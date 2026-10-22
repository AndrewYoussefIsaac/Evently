import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/app_colors.dart';
import 'package:evently/core/utilities/app_images.dart';
import 'package:evently/modules/main_layout/manager/layout_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key,  required this.favUsers, required this.eventId});

  final List<String> favUsers ; 
  final String eventId ;
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final String userId = FirebaseAuth.instance.currentUser!.uid ;
  @override
  Widget build(BuildContext context) {
    String shownImage = widget.favUsers.contains( userId )
      ? AppImages.filledFavorite 
      : AppImages.favorite ;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>( context, listen: true, );
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return InkWell(
      onTap: (){
        LayoutProvider provider = Provider.of(context,listen: false) ;  /////////////////////////////// + last note 
        provider.updateFavorite( widget.eventId ) ;
        setState(() { 
          shownImage == AppImages.favorite 
              ? shownImage = AppImages.filledFavorite 
              : shownImage = AppImages.favorite  ;
        });
      } , 
      child: SvgPicture.asset(
        shownImage ,
        colorFilter: ColorFilter.mode(
          isLight 
          ? AppColors.lightPrimaryColor 
          : AppColors.darkPrimaryColor ,
          .srcIn
        ),
      ) ,
    );
  }
}