import 'package:easy_localization/easy_localization.dart';
import 'package:evently/pages/main_layout_screen.dart';
import 'package:evently/tabs/profile_page.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/utilities/app_routes.dart';
import 'package:evently/utilities/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>( create: (context) => ThemeProvider() ) ,
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale("en") ,
          Locale("ar") ,
        ] , 
        fallbackLocale: const Locale("en"),
        path: 'assets/translations' ,
        child: const Evently()
      ) ,
    )
  );
}

class Evently extends StatelessWidget {
  const Evently({super.key});
  @override
  Widget build(context) {
    ThemeProvider themeProvider = Provider.of( context , listen: true ) ;
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Evently',
      routes: {
        AppRoutes.profilePage :(context) => ProfilePage() ,
        AppRoutes.mainLayout :(context) => MainLayoutScreen() ,
      } ,
      initialRoute: AppRoutes.mainLayout ,
      theme: AppThemes.themeLight ,
      darkTheme : AppThemes.themeDark ,
      themeMode:  themeProvider.themeMode ,
      localizationsDelegates : context.localizationDelegates ,
      supportedLocales : context.supportedLocales ,
      locale: context.locale ,
    );
  }
}
