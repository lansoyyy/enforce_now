import 'package:enforcenow/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Log In",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.logInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Main Menu",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.mainMenuScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Abou the APP",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.abouTheAppScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Record Hisotry",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.recordHisotryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Traffic Enforcer Info",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.trafficEnforcerInfoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle:
                              "Record Violation ( Complete Credentials)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context,
                              AppRoutes
                                  .recordViolationCompleteCredentialsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Record Violation Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.recordViolationTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Record Violation Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.recordViolationThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Record Violation Five",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.recordViolationFiveScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Violation Hisotory",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.violationHisotoryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Incomplete Credentials",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.incompleteCredentialsScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
