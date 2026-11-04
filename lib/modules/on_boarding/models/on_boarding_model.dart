import 'package:evently/core/utilities/app_images.dart';

class OnBoardingModel {
  final String title ;
  final String describtion ;
  final String image ;
  OnBoardingModel({ required this.title, required this.describtion, required this.image}) ;
  static final List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      title: "onboarding1_title" , 
      describtion: "onboarding1_discription" , 
      image: AppImages.onboarding1 ,
    ) ,
    OnBoardingModel(
      title: "onboarding2_title" , 
      describtion: "onboarding2_discription" , 
      image: AppImages.onboarding2 ,
    ) ,
    OnBoardingModel(
      title: "onboarding3_title" , 
      describtion: "onboarding3_discription" , 
      image: AppImages.onboarding3 ,
    )
  ] ;
}