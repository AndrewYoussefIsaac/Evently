import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {

  Future<UserCredential> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(name);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email ,
        password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw 'Invalid email or password.';
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgetPassword({ required String email }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email) ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw 'Invalid email or password.';
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
  

  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance ;

  Future<UserCredential> signInWithGoogle() async {
    await _googleSignIn.initialize( serverClientId: dotenv.env["SERVER_CLIENT_ID"] ) ;
    final GoogleSignInAccount result = await _googleSignIn.authenticate() ;
    final googleAuth = result.authentication ;
    final credentials = GoogleAuthProvider.credential( idToken: googleAuth.idToken , ) ;
    return await FirebaseAuth.instance.signInWithCredential(credentials) ;
  }
  
}
