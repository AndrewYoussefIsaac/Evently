import 'package:evently/core/models/event_model.dart';
import 'package:evently/modules/manage_event/manager/manage_event_provider.dart';
import 'package:evently/modules/manage_event/screens/event_details_screen.dart';
import 'package:evently/modules/manage_event/screens/manage_event_screen.dart';
import 'package:evently/modules/auth/manager/auth_provider.dart';
import 'package:evently/modules/auth/screens/forget_password_screen.dart';
import 'package:evently/modules/auth/screens/login_screen.dart';
import 'package:evently/modules/auth/screens/signup_screen.dart';
import 'package:evently/modules/main_layout/manager/layout_provider.dart';
import 'package:evently/modules/main_layout/screens/main_layout_screen.dart';
import 'package:evently/modules/splash/screens/splash_screen.dart';
import 'package:evently/modules/start/screens/start_screen.dart';
import 'package:evently/core/utilities/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRouteNames.startScreen:
        return MaterialPageRoute(builder: (_) => StartScreen());

      case AppRouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: LoginScreen(),
          ),
        );

      case AppRouteNames.signupScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: SignupScreen(),
          ),
        );

      case AppRouteNames.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: ForgetPasswordScreen(),
          ),
        );

      case AppRouteNames.mainLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => LayoutProvider(),
            child: MainLayoutScreen(),
          ),
        );

      case AppRouteNames.manageEventScreen:
        final EventModel? eventModel = settings.arguments as EventModel? ;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (BuildContext context) => ManageEventProvider( event: eventModel ) ,
            child: ManageEventScreen( event: eventModel , ) ,
          ),
        );

      case AppRouteNames.eventDetailsScreen:
        final EventModel eventModel = settings.arguments as EventModel ;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (BuildContext context) => ManageEventProvider() ,
            child: EventDetailsScreen( event: eventModel ,),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text("there's an error"))),
        );
    }
  }
}
