import 'package:evently/utilities/app_colors.dart';
import 'package:evently/utilities/app_textstyles.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key, required this.title , required this.onTap });
  final String title ;
  final Function onTap ;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10 ,
      crossAxisAlignment: .start ,
      children: [
        Text( title ,
          style: AppTextstyles.headline ,
        ) ,
        InkWell(
          onTap: () {
            onTap() ;                   /// don't forget () to call the function ///
            // showModalBottomSheet(
            //   context: context , 
            //   builder: (context) => Container(
            //     width: .infinity ,
            //     height: 0.4*MediaQuery.heightOf(context) ,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(16) ,
            //         topRight: Radius.circular(16) ,
            //       ) ,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 16 ),
            //       child: Column(
            //         crossAxisAlignment: .start ,
            //         spacing: 15 ,
            //         children: [
            //           Row(
            //             children: [
            //               Text( "Arabic" , 
            //                 style: TextStyle(
            //                   fontSize: 25 ,
            //                   fontWeight:  .w400 ,
            //                 ),
            //               ),
            //               Spacer() ,
            //               Icon( Icons.check ) ,
            //             ],
            //           ) ,
            //           Row(
            //             children: [
            //               Text( "English" , 
            //                 style: TextStyle(
            //                   fontSize: 25 ,
            //                   fontWeight:  .w400 ,
            //                 ),
            //               ),
            //               Spacer() ,
            //               Icon( Icons.check ) ,
            //             ],
            //           ) ,
            //         ],
            //       ),
            //     ) ,
            //   ) ,
            // ) ;
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity ,
            decoration: BoxDecoration(
              border: Border.all( color: AppColors.primary , ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text( "Arabic" ,
                    style: TextStyle(
                      color: AppColors.primary ,
                      fontSize: 20 ,
                      fontWeight: .w700 ,
                    ),
                  ),
                  Spacer() ,
                  Icon( 
                    Icons.keyboard_arrow_down_sharp ,
                    color: AppColors.primary ,
                  ) ,
                ],
              ),
            ),
          ),
        ) ,
      ],
    );
  }
}