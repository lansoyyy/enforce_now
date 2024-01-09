import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/presentation/record_violation_complete_credentials_screen/violation_list.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// ignore_for_file: must_be_immutable
class RecordViolationCompleteCredentialsScreen extends StatelessWidget {
  TextEditingController surnameController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController editTextController = TextEditingController();

  TextEditingController bdayTextController = TextEditingController();
  TextEditingController suffixTextController = TextEditingController();

  TextEditingController platenumberTextController = TextEditingController();
  TextEditingController typeTextController = TextEditingController();
  TextEditingController classificationTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController placeTextController = TextEditingController();
  TextEditingController ownernameController = TextEditingController();
  TextEditingController owneraddressController = TextEditingController();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 16.v),
                child: SingleChildScrollView(
                  child: Column(children: [
                    _buildArrowLeftSection(context),
                    SizedBox(height: 32.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 175, child: _buildSurnameSection(context)),
                        SizedBox(
                            width: 175, child: _buildFirstNameSection(context)),
                      ],
                    ),
                    SizedBox(height: 9.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 175, child: buildbday(context)),
                        SizedBox(width: 175, child: suffix(context)),
                      ],
                    ),
                    SizedBox(height: 9.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 175, child: _buildEditTextSection(context)),
                        SizedBox(width: 175, child: platenumber(context)),
                      ],
                    ),
                    SizedBox(height: 9.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 175, child: type(context)),
                        SizedBox(width: 175, child: classification(context)),
                      ],
                    ),
                    SizedBox(height: 9.v),
                    address(context),
                    SizedBox(height: 9.v),
                    place(context),
                    SizedBox(height: 9.v),
                    owndername(context),
                    SizedBox(height: 9.v),
                    ownderaddress(context),
                    SizedBox(height: 31.v),
                    CustomElevatedButton(
                        onPressed: () {
                          // addRecord(
                          //     surnameController.text,
                          //     firstNameController.text,
                          //     nameController.text,
                          //     editTextController.text,
                          //     box.read('type'));
                          // showToast('Record added succesfully!');
                          // Navigator.pushReplacementNamed(
                          //     context, AppRoutes.mainMenuScreen);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViolationList(
                                  lname:
                                      ' ${surnameController.text} ${suffixTextController.text}',
                                  fname: '${firstNameController.text}',
                                  bday: bdayTextController.text,
                                  license: editTextController.text,
                                  plate: platenumberTextController.text,
                                  model: typeTextController.text,
                                  classification:
                                      classificationTextController.text,
                                  address: addressTextController.text,
                                  place: placeTextController.text,
                                  ownername: ownernameController.text,
                                  owneraddress: owneraddressController.text)));
                        },
                        text: "Continue",
                        margin: EdgeInsets.symmetric(horizontal: 7.h)),
                    SizedBox(height: 5.v)
                  ]),
                ))));
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
  Widget buildbday(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text("Birthdate",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: bdayTextController,
                  alignment: Alignment.centerRight))
        ]));
  }

  Widget suffix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text("Suffix",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: suffixTextController,
                  alignment: Alignment.centerRight))
        ]));
  }

  Widget platenumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text("Platenumber",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: platenumberTextController,
                  alignment: Alignment.centerRight))
        ]));
  }

  Widget type(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text("Type/Model",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: typeTextController,
                  alignment: Alignment.centerRight))
        ]));
  }

  Widget classification(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text("Classification",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: classificationTextController,
                  alignment: Alignment.centerRight))
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

  Widget place(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text("Place of Violation",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: placeTextController,
                  textInputAction: TextInputAction.done,
                  alignment: Alignment.centerRight))
        ]));
  }

  Widget address(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text("Address",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: addressTextController,
                  textInputAction: TextInputAction.done,
                  alignment: Alignment.centerRight))
        ]));
  }

  Widget owndername(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text("Owner's Name",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: ownernameController,
                  textInputAction: TextInputAction.done,
                  alignment: Alignment.centerRight))
        ]));
  }

  Widget ownderaddress(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text("Owner's Address",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  controller: owneraddressController,
                  textInputAction: TextInputAction.done,
                  alignment: Alignment.centerRight))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
