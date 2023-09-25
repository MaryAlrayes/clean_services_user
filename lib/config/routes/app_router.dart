import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/managers/string_manager.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/screens/ask_service_screen.dart';
import 'package:saudi_clean_services/features/auth/login/presentation/screens/login_screen.dart';
import 'package:saudi_clean_services/features/auth/signup/presentation/screens/signup_screen.dart';
import 'package:saudi_clean_services/features/auth/verfication_code/presentation/screens/verfication_code_screen.dart';
import 'package:saudi_clean_services/features/drawer_navigation/presentation/screens/homepage_screen.dart';
import 'package:saudi_clean_services/features/laundries/data/laundry.dart';
import 'package:saudi_clean_services/features/laundries/presentation/screens/laundry_details_screen.dart';
import 'package:saudi_clean_services/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:saudi_clean_services/features/orders/data/order.dart';
import 'package:saudi_clean_services/features/orders/presentation/screens/order_details_screen.dart';
import 'package:saudi_clean_services/features/orders_log/data/order_log.dart';
import 'package:saudi_clean_services/features/orders_log/presentation/screens/order_log_details_screen.dart';
import 'package:saudi_clean_services/features/settings/presentation/screens/change_language_screen.dart';
import 'package:saudi_clean_services/features/settings/presentation/screens/change_password_screen.dart';
import 'package:saudi_clean_services/features/settings/presentation/screens/change_personal_info.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) =>  LoginScreen(),
        );

      case SignupScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );

      case VerficationCodeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const VerficationCodeScreen(),
        );

      case HomepagScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomepagScreen(),
        );


      case NotificationsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const NotificationsScreen(),
        );

      case LaundryDetailsScreen.routeName:
        final args = routeSettings.arguments as Map;
        Laundry laundry = args['laundry'] as Laundry;
        return MaterialPageRoute(
          builder: (context) => LaundryDetailsScreen(laundry: laundry),
        );

          case AskServiceScreen.routeName:
        final args = routeSettings.arguments as Map;
        Laundry laundry = args['laundry'] as Laundry;
        return MaterialPageRoute(
          builder: (context) => AskServiceScreen(laundry: laundry),
        );



      case OrderDetailsScreen.routeName:
        final args = routeSettings.arguments as Map;
        Order order = args['order'] as Order;
        return MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(order: order),
        );

      case OrderLogDetailsScreen.routeName:
        final args = routeSettings.arguments as Map;
        OrderLog order = args['orderLog'] as OrderLog;
        return MaterialPageRoute(
          builder: (context) => OrderLogDetailsScreen(orderLog: order),
        );
           case ChangePersonalInfoScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ChangePersonalInfoScreen(),
        );

      case ChangePasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(),
        );

      case ChangeLanguageScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ChangeLanguageScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
