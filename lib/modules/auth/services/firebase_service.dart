import 'package:firebase_auth/firebase_auth.dart';

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
  
}
