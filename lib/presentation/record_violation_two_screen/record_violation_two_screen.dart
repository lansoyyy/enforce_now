import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RecordViolationTwoScreen extends StatelessWidget {
  RecordViolationTwoScreen({Key? key}) : super(key: key);

  TextEditingController editTextController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

  TextEditingController editTextController2 = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController editTextController3 = TextEditingController();

  TextEditingController editTextController4 = TextEditingController();

  TextEditingController editTextController5 = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController editTextController6 = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController editTextController7 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 18.v),
                child: Column(children: [
                  _buildArrowLeftSection(context),
                  SizedBox(height: 7.v),
                  _buildEditText(context),
                  SizedBox(height: 15.v),
                  _buildEditText1(context),
                  SizedBox(height: 17.v),
                  _buildDateOfBirth(context),
                  SizedBox(height: 12.v),
                  _buildEditText2(context),
                  SizedBox(height: 15.v),
                  _buildAddressSection(context),
                  SizedBox(height: 16.v),
                  _buildPlaceOfViolationSection(context),
                  SizedBox(height: 13.v),
                  _buildOwnerSNameSection(context),
                  SizedBox(height: 11.v),
                  _buildOwnerSAddressSection(context),
                  SizedBox(height: 29.v),
                  _buildNextSection(context),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildArrowLeftSection(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 7.h, right: 31.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeftOnsecondarycontainer,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(bottom: 64.v),
                  onTap: () {
                    onTapImgArrowLeft(context);
                  }),
              Expanded(
                  child: Container(
                      width: 295.h,
                      margin: EdgeInsets.only(left: 5.h, top: 4.v),
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
  Widget _buildViolatorSSurnameSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Violator’s Surname ",
          style: CustomTextStyles.bodyMediumInterGray5000114),
      SizedBox(height: 4.v),
      CustomTextFormField(width: 153.h, controller: editTextController)
    ]);
  }

  /// Section Widget
  Widget _buildViolatorSFirstSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Violator’s  First Name ",
              style: CustomTextStyles.bodyMediumInterGray5000114),
          SizedBox(height: 2.v),
          CustomTextFormField(width: 153.h, controller: firstNameController)
        ]));
  }

  /// Section Widget
  Widget _buildEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 22.h, right: 19.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildViolatorSSurnameSection(context),
          _buildViolatorSFirstSection(context)
        ]));
  }

  /// Section Widget
  Widget _buildLicenseNumberSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("License Number*",
          style: CustomTextStyles.bodyMediumInterGray5000114),
      CustomTextFormField(width: 153.h, controller: editTextController1)
    ]);
  }

  /// Section Widget
  Widget _buildSuffixSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 11.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Suffix", style: CustomTextStyles.bodyMediumInterGray5000114),
          CustomTextFormField(width: 153.h, controller: editTextController2)
        ]));
  }

  /// Section Widget
  Widget _buildEditText1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 19.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildLicenseNumberSection(context),
          _buildSuffixSection(context)
        ]));
  }

  /// Section Widget
  Widget _buildDateOfBirthSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Date of Birth*",
          style: CustomTextStyles.bodyMediumInterGray5000114),
      SizedBox(height: 2.v),
      CustomTextFormField(width: 153.h, controller: dateOfBirthController)
    ]);
  }

  /// Section Widget
  Widget _buildPlateNumberSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Plate Number *",
              style: CustomTextStyles.bodyMediumInterGray5000114),
          SizedBox(height: 2.v),
          Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: CustomTextFormField(
                  width: 153.h, controller: editTextController3))
        ]));
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 22.h, right: 19.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildDateOfBirthSection(context),
          _buildPlateNumberSection(context)
        ]));
  }

  /// Section Widget
  Widget _buildTypeModelSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 1.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Type/ Model *",
              style: CustomTextStyles.bodyMediumInterGray5000114),
          SizedBox(height: 2.v),
          CustomTextFormField(width: 153.h, controller: editTextController4)
        ]));
  }

  /// Section Widget
  Widget _buildClassificationSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Classification",
              style: CustomTextStyles.bodyMediumInterGray5000114),
          SizedBox(height: 3.v),
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: CustomTextFormField(
                  width: 153.h, controller: editTextController5))
        ]));
  }

  /// Section Widget
  Widget _buildEditText2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 22.h, right: 18.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildTypeModelSection(context),
          _buildClassificationSection(context)
        ]));
  }

  /// Section Widget
  Widget _buildAddressSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 7.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Address *", style: CustomTextStyles.bodyMediumInterGray5000114),
          SizedBox(height: 2.v),
          Padding(
              padding: EdgeInsets.only(right: 7.h),
              child: CustomTextFormField(controller: addressController))
        ]));
  }

  /// Section Widget
  Widget _buildPlaceOfViolationSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 7.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Place of Violation",
              style: CustomTextStyles.bodyMediumInterGray5000114),
          Padding(
              padding: EdgeInsets.only(right: 6.h),
              child: CustomTextFormField(controller: editTextController6))
        ]));
  }

  /// Section Widget
  Widget _buildOwnerSNameSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 7.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Owner’s Name",
              style: CustomTextStyles.bodyMediumInterGray5000114),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(right: 7.h),
              child: CustomTextFormField(controller: nameController))
        ]));
  }

  /// Section Widget
  Widget _buildOwnerSAddressSection(BuildContext context) {
    return SizedBox(
        height: 55.v,
        width: 317.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text("Owner’s Address",
                  style: CustomTextStyles.bodyMediumInterGray5000114)),
          CustomTextFormField(
              width: 316.h,
              controller: editTextController7,
              textInputAction: TextInputAction.done,
              alignment: Alignment.bottomCenter)
        ]));
  }

  /// Section Widget
  Widget _buildNextSection(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 132.h),
            child: IntrinsicWidth(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomElevatedButton(
                  height: 27.v,
                  width: 106.h,
                  text: "Next",
                  buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                  buttonTextStyle:
                      CustomTextStyles.bodySmallInterOnErrorContainer,
                  onPressed: () {
                    onTapNext(context);
                  }),
              Container(
                  margin: EdgeInsets.only(left: 291.h),
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: SizedBox(
                      width: 90.h,
                      child: Text("Next",
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style:
                              CustomTextStyles.bodySmallInterOnErrorContainer)))
            ]))));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the recordViolationThreeScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.recordViolationThreeScreen);
  }
}
