import 'package:easy_localization/easy_localization.dart';
import 'package:evently/modules/auth/services/firebase_service.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:evently/core/utilities/toast.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  
  bool isLoading = false ;
  final FirebaseService _firebaseService = FirebaseService() ;

  Future<void> register({
    required BuildContext context ,
    required String name ,
    required String email ,
    required String password ,
  }) async {
    try {
      isLoading = true ;
      notifyListeners()  ;
      await _firebaseService.createAccount(name: name , email: email , password: password ) ;
      if ( context.mounted ) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar( 
            content: Row(
              textDirection: context.locale.languageCode =="ar" ?  .rtl : .ltr ,
              children: [
                Text("account_created_successfully".tr()),
                Text( name ) ,
              ],
            ) ,
            behavior: .floating ,
            backgroundColor: AppColors.green ,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16) ,
              borderSide: BorderSide( color: AppColors.green , )
            ),
          )
        );
      }
      Future.delayed( Duration( microseconds: 250 ) , (){
        if ( context.mounted ) {
          Navigator.pushReplacementNamed(context, AppRouteNames.mainLayoutScreen) ;          
        }
      }) ;
    } catch (e) {
      if ( context.mounted ) {
        Toast.showToast(title: e.toString() , context: context ) ;
      }
    }
    isLoading = false ;
    notifyListeners() ;
  }

  Future<void> login({
    required BuildContext context ,
    required String email ,
    required String password ,
  }) async {
    try {
      isLoading = true ;
      notifyListeners()  ;
      await _firebaseService.login( email: email , password: password ) ;
      if ( context.mounted ) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar( 
            content: Row(
              textDirection: context.locale.languageCode =="ar" ?  .rtl : .ltr ,
              children: [
                Text("welcome".tr()),
              ],
            ) ,
            behavior: .floating ,
            backgroundColor: AppColors.green ,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16) ,
              borderSide: BorderSide( color: AppColors.green , )
            ),
          )
        );
      }
        Future.delayed( Duration( microseconds: 250 ) , (){
        if ( context.mounted ) {
          Navigator.pushReplacementNamed(context, AppRouteNames.mainLayoutScreen) ;          
        }
      }) ;
    } catch (e) {
      if ( context.mounted ) {
        Toast.showToast(title: e.toString() , context: context ) ;
      }
    }
    isLoading = false ;
    notifyListeners() ;
  }

  Future<void> forgetPassword({
    required BuildContext context ,
    required String email ,
  }) async {
    try {
      isLoading = true ;
      notifyListeners()  ;
      await _firebaseService.forgetPassword( email: email  ) ;
    } catch (e) {
      if ( context.mounted ) {
        Toast.showToast(title: e.toString() , context: context ) ;
      }
    }
    isLoading = false ;
    notifyListeners() ;
  }
  
}