import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class IncompleteCredentialsScreen extends StatelessWidget {
  IncompleteCredentialsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController surnameController = TextEditingController();

  TextEditingController editTextController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

  TextEditingController editTextController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 24.v,
          ),
          child: Column(
            children: [
              Container(
                width: 314.h,
                margin: EdgeInsets.only(left: 10.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Record Violation\n",
                        style: theme.textTheme.headlineLarge,
                      ),
                      TextSpan(
                        text: "Incomplete Credentials",
                        style: CustomTextStyles.headlineLargeBlueA200,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 26.v),
              _buildRecordViolation(context),
              SizedBox(height: 15.v),
              _buildViolatorFirstName(context),
              SizedBox(height: 15.v),
              _buildViolatorMiddleName(context),
              SizedBox(height: 15.v),
              _buildViolatorAddress(context),
              SizedBox(height: 10.v),
              _buildBirthdate(context),
              SizedBox(height: 50.v),
              CustomElevatedButton(
                text: "Next",
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecordViolation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Text(
              "Violator ’s  Surname",
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        SizedBox(height: 2.v),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: surnameController,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildViolatorFirstName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "Violator’s First Name",
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: editTextController,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildViolatorMiddleName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "Violator’s  Middle Name",
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: nameController,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildViolatorAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Text(
              "Violator’s Address",
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: editTextController1,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBirthdate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 13.h),
            child: Text(
              "Birthdate",
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: editTextController2,
            textInputAction: TextInputAction.done,
          ),
        ),
      ],
    );
  }
}
