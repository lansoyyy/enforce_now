import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RecordViolationCompleteCredentialsScreen extends StatelessWidget {
  RecordViolationCompleteCredentialsScreen({Key? key}) : super(key: key);

  TextEditingController surnameController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController editTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 16.v),
                child: Column(children: [
                  _buildArrowLeftSection(context),
                  SizedBox(height: 32.v),
                  _buildSurnameSection(context),
                  SizedBox(height: 9.v),
                  _buildFirstNameSection(context),
                  SizedBox(height: 11.v),
                  _buildNameSection(context),
                  SizedBox(height: 11.v),
                  _buildEditTextSection(context),
                  SizedBox(height: 31.v),
                  CustomElevatedButton(
                      text: "Next",
                      margin: EdgeInsets.symmetric(horizontal: 7.h)),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildArrowLeftSection(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 22.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeftOnsecondarycontainer,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(bottom: 68.v),
                  onTap: () {
                    onTapImgArrowLeft(context);
                  }),
              Expanded(
                  child: Container(
                      width: 295.h,
                      margin: EdgeInsets.only(left: 3.h, top: 8.v),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Record Violation\n",
                                style: theme.textTheme.headlineLarge),
                            TextSpan(
                                text: "Complete Credentials",
                                style: CustomTextStyles.headlineLargeBlueA200)
                          ]),
                          textAlign: TextAlign.center)))
            ])));
  }

  /// Section Widget
  Widget _buildSurnameSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text("Violator’s  Surname",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 2.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: surnameController,
                  alignment: Alignment.centerRight))
        ]));
  }

  /// Section Widget
  Widget _buildFirstNameSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text("Violator’s First Name",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 3.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: firstNameController,
                  alignment: Alignment.centerRight))
        ]));
  }

  /// Section Widget
  Widget _buildNameSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text("Violator’s  Middle Name",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: nameController, alignment: Alignment.centerRight))
        ]));
  }

  /// Section Widget
  Widget _buildEditTextSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text("License No.",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: editTextController,
                  textInputAction: TextInputAction.done,
                  alignment: Alignment.centerRight))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
