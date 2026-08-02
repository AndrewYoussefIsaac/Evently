import 'package:evently/models/tab_info.dart';
import 'package:evently/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int currentTab = 0 ;
  final List<TabInfo> tabs = const [
    TabInfo( icon: "assets/icons/home.png", label: "home" , ) ,
    TabInfo( icon: "assets/icons/map.png", label: "map" , ) ,
    TabInfo( icon: "assets/icons/love.png", label: "love" , ) ,
    TabInfo( icon: "assets/icons/profile.png", label: "profile" , ) ,
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(0),
        color: AppColors.primary  ,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed ,
          elevation: 0 ,
          backgroundColor: AppColors.transparent ,
          currentIndex: currentTab ,
          onTap: (index) {
            setState(() {
              currentTab = index ;
            });
          },
          items: [
            ...List.generate( tabs.length , 
              (index) => BottomNavigationBarItem(
                icon: ImageIcon( AssetImage(tabs[index].icon) ) ,
                label: tabs[index].label ,
              )
            ) ,
          ],
          selectedItemColor: AppColors.white ,
          showUnselectedLabels: true ,
        ),
      ),
    );
  }
}