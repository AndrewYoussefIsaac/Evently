import 'package:easy_localization/easy_localization.dart';
import 'package:evently/modules/auth/manager/auth_provider.dart';
import 'package:evently/core/widgets/custom_action_button.dart';
import 'package:evently/modules/auth/widgets/custom_input_field.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/utilities/toast.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  
    final TextEditingController emailController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of( context , listen: true ) ;
    bool isLightMode = themeProvider.themeMode == ThemeMode.light  ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "forget_password_title".tr() , 
          style: AppFonts.medium18.copyWith( 
            color: isLightMode ? AppColors.lightTextColor : AppColors.textColor ,
          ) ,
        ) ,
        leading: CustomActionButton( 
          onTap: () => Navigator.pop(context) ,
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isLightMode ? AppColors.lightPrimaryColor : Colors.white,
            size: 24.sp , 
          ) ,
        ) ,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 16.w ),
          child: Column(
            children: [
              SizedBox( height: 32.h ,) ,
              Image( 
                width: 343.w ,
                height: 343.h ,
                image: AssetImage( AppImages.forgetPassword ) ,
                color: ( isLightMode )? AppColors.lightPrimaryColor : AppColors.textColor  ,
              ) ,
              SizedBox( height: 40.h ,) ,
              CustomInputField(
                title: "email_hint" , 
                icon: AppImages.sms , 
                controller: emailController ,
                validator: (value){
                  final RegExp emailRegex = RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' );
                  if ( value == null || value.isEmpty ) {
                    return "empty_email_hint".tr() ;
                  }
                  else if ( ! emailRegex.hasMatch(value.trim()) ) {
                    return "invalid_email_hint".tr() ;
                  }
                  else {
                    return null ;
                  }
                },
              ) , 
              SizedBox( height: 40.h ,) ,
              Consumer<AuthProvider>(
                builder: ( context , provider , child ) =>
                CustomButton( 
                  title: "forget_password_title".tr() , 
                  isLoading: provider.isLoading , 
                  onTap: () {
                    final RegExp emailRegex = RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' );
                    if ( emailController.text == "" ) {
                      Toast.showToast(title: "empty_email_hint".tr() , context: context ) ;
                    } else if ( ! emailRegex.hasMatch(emailController.text.trim()) ){
                      Toast.showToast( title: "invalid_email_hint".tr() , context: context ) ;
                    }else {
                      provider.forgetPassword( context: context, email: emailController.text ) ;
                    }
                  },
                ),
              ) ,
            ],
          ),
        ),
      ),
    );
  }
}