import 'package:easy_localization/easy_localization.dart';
import 'package:evently/modules/auth/manager/auth_provider.dart';
import 'package:evently/modules/auth/widgets/custom_input_field.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_fonts.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightMode = themeProvider.themeMode == ThemeMode.light;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Hero(
                    tag: "Evently",
                    child: SizedBox(
                      width: 142.w,
                      height: 27.h,
                      child: Image(
                        image: AssetImage(AppImages.evently),
                        color: isLightMode
                            ? AppColors.lightPrimaryColor
                            : AppColors.darkPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 48.h),
                  Align(
                    alignment: .centerStart,
                    child: Text(
                      "signupPage_title".tr(),
                      style: AppFonts.semiBold24.copyWith(
                        color: isLightMode
                            ? AppColors.lightPrimaryColor
                            : AppColors.textColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomInputField(
                          title: "name_hint",
                          icon: AppImages.user,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "empty_name_hint".tr();
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomInputField(
                          title: "email_hint",
                          icon: AppImages.sms,
                          controller: emailController,
                          validator: (value) {
                            final RegExp emailRegex = RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', );
                            if (value == null || value.isEmpty) {
                              return "empty_email_hint".tr();
                            } else if (!emailRegex.hasMatch(value.trim())) {
                              return "invalid_email_hint".tr();
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomInputField(
                          title: "password_hint", icon: AppImages.lock, isPassword: true, controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "empty_password_hint".tr();
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomInputField(
                          title: "confirm_password_hint".tr(), icon: AppImages.lock, isPassword: true,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "empty_password_hint".tr();
                            } else if ( passwordController.text != confirmPasswordController.text ) {
                              return "no_match_password".tr();
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 52.h),
                        Consumer<AuthProvider>(
                          builder: (context, provider , child) =>  CustomButton(
                            title: "sign_up".tr() , isLoading: provider.isLoading ,
                            onTap: () async {
                              if ( formKey.currentState!.validate() ){
                                provider.register( 
                                  context: context , 
                                  name: nameController.text , 
                                  email: emailController.text , 
                                  password: passwordController.text 
                                ) ;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          textDirection: context.locale.languageCode == 'ar' ? .rtl : .ltr , 
                          mainAxisAlignment: .center,
                          children: [
                            Text( "already_have_an_account".tr(),
                              style: AppFonts.regular14.copyWith( color: AppColors.lightSecTextColor, ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed( context , AppRouteNames.loginScreen, );
                              },
                              child: Text(
                                "login".tr(),
                                style: AppFonts.semiBold14White.copyWith(
                                  color: isLightMode ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor,
                                  decoration: .underline ,
                                  decorationColor: isLightMode ? AppColors.lightPrimaryColor : AppColors.darkPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
