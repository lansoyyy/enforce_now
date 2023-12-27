import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/app_bar/appbar_subtitle.dart';
import 'package:enforcenow/widgets/app_bar/custom_app_bar.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/toast_widget.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: 188.v,
                          width: 225.h,
                          margin: EdgeInsets.only(left: 45.h),
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant.img14147815Polic,
                                height: 188.v,
                                width: 109.h,
                                alignment: Alignment.centerLeft),
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgMobileFriendlyDesign,
                                height: 188.v,
                                width: 225.h,
                                alignment: Alignment.center)
                          ]))),
                  SizedBox(height: 15.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: 47.v,
                          width: 142.h,
                          margin: EdgeInsets.only(left: 10.h),
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Login",
                                        style: CustomTextStyles
                                            .headlineLargeBlueA200_1)),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("Please login to continue.",
                                        style: CustomTextStyles
                                            .bodyMediumAsapGray800))
                              ]))),
                  SizedBox(height: 13.v),
                  _buildUserNameColumn(context),
                  SizedBox(height: 12.v),
                  _buildPasswordColumn(context),
                  SizedBox(height: 31.v),
                  CustomElevatedButton(
                      text: "Log In",
                      buttonTextStyle:
                          CustomTextStyles.titleMediumInterOnErrorContainer,
                      onPressed: () {
                        onTapLogIn(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 95.v,
        centerTitle: true,
        title: AppbarSubtitle(text: "WELCOME OFFICER!"));
  }

  /// Section Widget
  Widget _buildUserNameColumn(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Opacity(
          opacity: 0.7,
          child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Text("Email*",
                  style: CustomTextStyles.bodyMediumInterBlack90002))),
      SizedBox(height: 1.v),
      Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(controller: userNameController))
    ]);
  }

  /// Section Widget
  Widget _buildPasswordColumn(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Opacity(
          opacity: 0.7,
          child: Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Text("Password*",
                  style: CustomTextStyles.bodyMediumInterBlack90002))),
      SizedBox(height: 1.v),
      Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true))
    ]);
  }

  /// Navigates to the mainMenuScreen when the action is triggered.
  onTapLogIn(BuildContext context) {
    login(context);
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text, password: passwordController.text);
      showToast('Logged in succesfully!');
      Navigator.pushReplacementNamed(context, AppRoutes.mainMenuScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
