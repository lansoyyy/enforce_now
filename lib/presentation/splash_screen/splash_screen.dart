import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 16.h, top: 165.v, right: 16.h),
                child: Column(children: [
                  SizedBox(
                      height: 173.v,
                      width: 232.h,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgSingleLogo2,
                            height: 123.v,
                            width: 130.h,
                            alignment: Alignment.topCenter),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Text("EnforceNow",
                                style: theme.textTheme.displayMedium))
                      ])),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: 134.h,
                          margin: EdgeInsets.only(right: 86.h),
                          child: Text(
                              "E-Ticketing System for\n Traffic Violations",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.labelLargeBlack90002))),
                  SizedBox(height: 58.v),
                  CustomElevatedButton(
                      text: "Let’s Get Started",
                      onPressed: () {
                        onTapLetsGetStarted(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapLetsGetStarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logInScreen);
  }
}
