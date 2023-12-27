import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/app_bar/appbar_title.dart';
import 'package:enforcenow/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RecordViolationFiveScreen extends StatelessWidget {
  const RecordViolationFiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 5.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgSingleLogo2,
                                    height: 47.v,
                                    width: 50.h,
                                    alignment: Alignment.center),
                                SizedBox(height: 1.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 91.h),
                                    child: Text("EnforceNow",
                                        style: theme.textTheme.labelSmall)),
                                SizedBox(height: 9.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 43.h),
                                    child: Text(
                                        "Wed, May 27, 2020 • 9:27:53 AM",
                                        style: CustomTextStyles
                                            .bodySmallBlack90002)),
                                SizedBox(height: 6.v),
                                SizedBox(
                                    height: 56.v,
                                    width: 253.h,
                                    child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                  height: 49.v,
                                                  width: 253.h,
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgPath,
                                                            height: 49.v,
                                                            width: 253.h,
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                "0237-7746-8981-9028-5626",
                                                                style: CustomTextStyles
                                                                    .labelLargeRobotoMonoBlack90002))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Text("TVR",
                                                  style: theme
                                                      .textTheme.labelSmall))
                                        ])),
                                SizedBox(height: 4.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: _buildCustomerType(context,
                                        customerTypeText: "Issued at",
                                        rText: "Cagayan de oro City")),
                                SizedBox(height: 14.v),
                                Divider(indent: 19.h),
                                SizedBox(height: 13.v),
                                SizedBox(
                                    height: 36.v,
                                    width: 253.h,
                                    child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: SizedBox(
                                                  width: 122.h,
                                                  child: Text(
                                                      "Juan Sebastian Dela Cruz",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: CustomTextStyles
                                                          .bodySmallBlack90002_1))),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 1.v),
                                                  child: Text("Violator’s Name",
                                                      style: theme.textTheme
                                                          .bodySmall))),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 22.v),
                                              child: _buildCustomerType(context,
                                                  customerTypeText: "License",
                                                  rText: "54673892023454"))
                                        ])),
                                SizedBox(height: 6.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: _buildCustomerType(context,
                                        customerTypeText: "Address",
                                        rText: "Cagayan de Oro City"))
                              ])),
                      SizedBox(height: 27.v),
                      Align(
                          alignment: Alignment.center,
                          child: Divider(indent: 19.h, endIndent: 20.h)),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: _buildCustomerType(context,
                                        customerTypeText: "Plate Number",
                                        rText: "04172997324")),
                                SizedBox(height: 7.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: _buildCustomerType(context,
                                        customerTypeText: "Type of Vehicle",
                                        rText: "Government")),
                                SizedBox(height: 6.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: _buildCustomerType(context,
                                        customerTypeText: "Body Color",
                                        rText: "Blue")),
                                SizedBox(height: 4.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: _buildCustomerType(context,
                                        customerTypeText: "Franchise No.",
                                        rText: "fmhfi784930278")),
                                SizedBox(height: 14.v),
                                SizedBox(
                                    height: 33.v,
                                    width: 254.h,
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: SizedBox(
                                                  width: 77.h,
                                                  child: Text(
                                                      "Amount to be Paid",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: theme.textTheme
                                                          .bodySmall))),
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                  width: 254.h,
                                                  child: Divider())),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Divider(),
                                                    SizedBox(height: 6.v),
                                                    Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text("800 PHP",
                                                            style: CustomTextStyles
                                                                .bodySmallBlack90002_1))
                                                  ]))
                                        ])),
                                SizedBox(height: 8.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              height: 14.v,
                                              width: 103.h,
                                              margin:
                                                  EdgeInsets.only(bottom: 1.v),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            "Traffic Enforcer",
                                                            style: theme
                                                                .textTheme
                                                                .bodySmall)),
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            "Traffic Enforcer",
                                                            style: theme
                                                                .textTheme
                                                                .bodySmall))
                                                  ])),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 79.h),
                                              child: Text("Ed Jay Ogoy",
                                                  style: CustomTextStyles
                                                      .bodySmallBlack90002_1))
                                        ])),
                                SizedBox(height: 8.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 19.h),
                                        child: Text("Violations/Comments",
                                            style: theme.textTheme.bodySmall))),
                                SizedBox(height: 3.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        width: 105.h,
                                        margin: EdgeInsets.only(left: 19.h),
                                        child: Text(
                                            "Over speeding\nFailure to carry OR/CR",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodySmallBlack90002Light
                                                .copyWith(height: 1.20))))
                              ])),
                      SizedBox(height: 38.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: 39.v,
                              width: 77.h,
                              margin: EdgeInsets.only(right: 101.h),
                              child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 5.v),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.h, vertical: 5.v),
                                            decoration: AppDecoration.fillBlue
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder10),
                                            child: Text("Print",
                                                style: theme
                                                    .textTheme.labelLarge))),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgPrint,
                                        height: 39.v,
                                        width: 25.h,
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(left: 10.h))
                                  ]))),
                      SizedBox(height: 4.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapHome(context);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 77.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.h, vertical: 1.v),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder10),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgHome,
                                            height: 19.v,
                                            width: 25.h,
                                            margin: EdgeInsets.only(top: 3.v)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 1.h, top: 8.v),
                                            child: Text("HOME",
                                                style: CustomTextStyles
                                                    .labelLargeBlack900))
                                      ])))),
                      SizedBox(height: 26.v),
                      Text("Please present this to the cashier.",
                          style: CustomTextStyles.bodySmallBlack90002Light),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 81.v,
        title: AppbarTitle(
            text: "Issue E-ticket", margin: EdgeInsets.only(left: 17.h)));
  }

  /// Common widget
  Widget _buildCustomerType(
    BuildContext context, {
    required String customerTypeText,
    required String rText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(customerTypeText,
          style:
              theme.textTheme.bodySmall!.copyWith(color: appTheme.gray60001)),
      Text(rText,
          style: CustomTextStyles.bodySmallBlack90002_1
              .copyWith(color: appTheme.black90002))
    ]);
  }

  /// Navigates to the mainMenuScreen when the action is triggered.
  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainMenuScreen);
  }
}
