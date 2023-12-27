import 'package:flutter/material.dart';
import 'package:enforcenow/presentation/splash_screen/splash_screen.dart';
import 'package:enforcenow/presentation/log_in_screen/log_in_screen.dart';
import 'package:enforcenow/presentation/main_menu_screen/main_menu_screen.dart';
import 'package:enforcenow/presentation/abou_the_app_screen/abou_the_app_screen.dart';
import 'package:enforcenow/presentation/record_hisotry_screen/record_hisotry_screen.dart';
import 'package:enforcenow/presentation/traffic_enforcer_info_screen/traffic_enforcer_info_screen.dart';
import 'package:enforcenow/presentation/record_violation_complete_credentials_screen/record_violation_complete_credentials_screen.dart';
import 'package:enforcenow/presentation/record_violation_two_screen/record_violation_two_screen.dart';
import 'package:enforcenow/presentation/record_violation_three_screen/record_violation_three_screen.dart';
import 'package:enforcenow/presentation/record_violation_five_screen/record_violation_five_screen.dart';
import 'package:enforcenow/presentation/violation_hisotory_screen/violation_hisotory_screen.dart';
import 'package:enforcenow/presentation/incomplete_credentials_screen/incomplete_credentials_screen.dart';
import 'package:enforcenow/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String logInScreen = '/log_in_screen';

  static const String mainMenuScreen = '/main_menu_screen';

  static const String abouTheAppScreen = '/abou_the_app_screen';

  static const String recordHisotryScreen = '/record_hisotry_screen';

  static const String trafficEnforcerInfoScreen =
      '/traffic_enforcer_info_screen';

  static const String recordViolationCompleteCredentialsScreen =
      '/record_violation_complete_credentials_screen';

  static const String recordViolationTwoScreen = '/record_violation_two_screen';

  static const String recordViolationThreeScreen =
      '/record_violation_three_screen';

  static const String recordViolationFiveScreen =
      '/record_violation_five_screen';

  static const String violationHisotoryScreen = '/violation_hisotory_screen';

  static const String incompleteCredentialsScreen =
      '/incomplete_credentials_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    logInScreen: (context) => LogInScreen(),
    mainMenuScreen: (context) => MainMenuScreen(),
    abouTheAppScreen: (context) => AbouTheAppScreen(),
    recordHisotryScreen: (context) => RecordHisotryScreen(),
    trafficEnforcerInfoScreen: (context) => TrafficEnforcerInfoScreen(),
    recordViolationCompleteCredentialsScreen: (context) =>
        RecordViolationCompleteCredentialsScreen(),
    recordViolationTwoScreen: (context) => RecordViolationTwoScreen(),
    recordViolationThreeScreen: (context) => RecordViolationThreeScreen(),
    recordViolationFiveScreen: (context) => RecordViolationFiveScreen(),
    violationHisotoryScreen: (context) => ViolationHisotoryScreen(),
    incompleteCredentialsScreen: (context) => IncompleteCredentialsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
