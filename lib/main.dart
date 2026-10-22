import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/utilities/routes/app_route.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:evently/core/utilities/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>( create: (context) => ThemeProvider() , )
      ],
      child: EasyLocalization(
        supportedLocales: const [ 
          Locale('en') ,
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        child: const EventlyApp()
      ) ,
    )
  );
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context) ;
    return ScreenUtilInit(
      designSize: const Size( 375 , 812 ),
      minTextAdapt: true ,
      builder:(context,child){
        return MaterialApp(
          title: 'Evently',
          debugShowCheckedModeBanner: false ,
          localizationsDelegates : context.localizationDelegates ,
          supportedLocales : context.supportedLocales ,
          locale: context.locale ,
          onGenerateRoute : AppRoute.onGenerateRoute ,
          initialRoute: AppRouteNames.splashScreen ,
          themeMode: themeProvider.themeMode ,
          theme: AppThemes.lightTheme , 
          darkTheme: AppThemes.darkTheme ,
          builder: (context, widget) {
            return Directionality(
              textDirection: .ltr ,
              child: widget!,
            );
          },
        );
      }
    );
  }
}