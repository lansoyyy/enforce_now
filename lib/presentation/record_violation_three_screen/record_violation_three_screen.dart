import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/app_bar/appbar_leading_image.dart';
import 'package:enforcenow/widgets/app_bar/custom_app_bar.dart';
import 'package:enforcenow/widgets/custom_checkbox_button.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RecordViolationThreeScreen extends StatelessWidget {
  RecordViolationThreeScreen({Key? key}) : super(key: key);

  bool truckBan = false;

  bool illegalTerminal = false;

  bool colorum = false;

  bool tripCutting = false;

  bool operatingOutOfLine = false;

  bool invalidOrDelinquent = false;

  bool close = false;

  bool unloading = false;

  bool close1 = false;

  bool overSpeeding = false;

  bool beatingTheRedLight = false;

  bool improvisedMufflers = false;

  bool close2 = false;

  bool noPlate = false;

  bool recklessDriving = false;

  bool noLeftTurn = false;

  bool close3 = false;

  bool clamping = false;

  bool close4 = false;

  bool failureToCarryCOROR = false;

  bool illegalParking = false;

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 17.h),
                          child: Text("List of Violations",
                              style: CustomTextStyles.headlineLargeBlueA200_1)),
                      SizedBox(height: 18.v),
                      _buildFrame(context),
                      SizedBox(height: 17.v),
                      _buildSaveStack(context),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 48.v,
        leadingWidth: 359.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVector,
            margin: EdgeInsets.fromLTRB(18.h, 19.v, 336.h, 13.v),
            onTap: () {
              onTapVector(context);
            }));
  }

  /// Section Widget
  Widget _buildTruckBanColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(right: 19.h),
              child: Row(children: [
                CustomCheckboxButton(
                    text: "Truck Ban",
                    value: truckBan,
                    padding: EdgeInsets.symmetric(vertical: 2.v),
                    onChange: (value) {
                      truckBan = value;
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 96.h),
                    child: CustomCheckboxButton(
                        text: "Illegal Terminal",
                        value: illegalTerminal,
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        onChange: (value) {
                          illegalTerminal = value;
                        }))
              ])),
          SizedBox(height: 11.v),
          Padding(
              padding: EdgeInsets.only(right: 38.h),
              child: Row(children: [
                CustomCheckboxButton(
                    text: "Colorum",
                    value: colorum,
                    padding: EdgeInsets.symmetric(vertical: 2.v),
                    textStyle: CustomTextStyles.bodySmallJostSecondaryContainer,
                    onChange: (value) {
                      colorum = value;
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 105.h),
                    child: CustomCheckboxButton(
                        text: "Trip Cutting",
                        value: tripCutting,
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        onChange: (value) {
                          tripCutting = value;
                        }))
              ])),
          SizedBox(height: 11.v),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCheckboxButton(
                          text: "Operating out of line",
                          value: operatingOutOfLine,
                          padding: EdgeInsets.symmetric(vertical: 1.v),
                          onChange: (value) {
                            operatingOutOfLine = value;
                          }),
                      SizedBox(height: 11.v),
                      CustomCheckboxButton(
                          text: "Invalid of Deliquent",
                          value: invalidOrDelinquent,
                          padding: EdgeInsets.symmetric(vertical: 2.v),
                          textStyle:
                              CustomTextStyles.bodySmallJostSecondaryContainer,
                          onChange: (value) {
                            invalidOrDelinquent = value;
                          })
                    ])),
            Padding(
                padding: EdgeInsets.only(left: 33.h, top: 9.v),
                child: CustomCheckboxButton(
                    text:
                        "Driving under the influence of liquor\n/narcotic drugs",
                    isExpandedText: true,
                    value: close,
                    onChange: (value) {
                      close = value;
                    }))
          ])
        ]));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          _buildTruckBanColumn(context),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 8.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CustomCheckboxButton(
                      text: "Unloading",
                      value: unloading,
                      padding: EdgeInsets.symmetric(vertical: 1.v),
                      onChange: (value) {
                        unloading = value;
                      }),
                  SizedBox(height: 8.v),
                  CustomCheckboxButton(
                      text: "Top load passengers/\ncargoes",
                      isExpandedText: true,
                      value: close1,
                      onChange: (value) {
                        close1 = value;
                      }),
                  SizedBox(height: 8.v),
                  CustomCheckboxButton(
                      text: "Over speeding",
                      value: overSpeeding,
                      padding: EdgeInsets.symmetric(vertical: 1.v),
                      onChange: (value) {
                        overSpeeding = value;
                      }),
                  SizedBox(height: 11.v),
                  CustomCheckboxButton(
                      text: "Beating the read light",
                      value: beatingTheRedLight,
                      padding: EdgeInsets.symmetric(vertical: 1.v),
                      onChange: (value) {
                        beatingTheRedLight = value;
                      }),
                  SizedBox(height: 11.v),
                  CustomCheckboxButton(
                      text: "Improvised mufflers",
                      value: improvisedMufflers,
                      padding: EdgeInsets.symmetric(vertical: 1.v),
                      onChange: (value) {
                        improvisedMufflers = value;
                      }),
                  SizedBox(height: 8.v),
                  CustomCheckboxButton(
                      text: "No side mirror/No seat belt",
                      isExpandedText: true,
                      value: close2,
                      onChange: (value) {
                        close2 = value;
                      }),
                  SizedBox(height: 8.v),
                  CustomCheckboxButton(
                      text: "No plate",
                      value: noPlate,
                      padding: EdgeInsets.symmetric(vertical: 1.v),
                      onChange: (value) {
                        noPlate = value;
                      })
                ]),
                Padding(
                    padding: EdgeInsets.only(left: 18.h, top: 17.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCheckboxButton(
                              text: "Reckless Driving",
                              value: recklessDriving,
                              padding: EdgeInsets.symmetric(vertical: 1.v),
                              onChange: (value) {
                                recklessDriving = value;
                              }),
                          SizedBox(height: 11.v),
                          CustomCheckboxButton(
                              text: "No left turn",
                              value: noLeftTurn,
                              padding: EdgeInsets.symmetric(vertical: 2.v),
                              onChange: (value) {
                                noLeftTurn = value;
                              }),
                          SizedBox(height: 9.v),
                          CustomCheckboxButton(
                              text:
                                  "Failure to obey \nTraffic device/ \ntraffic enforcers/\nsigns",
                              isExpandedText: true,
                              value: close3,
                              onChange: (value) {
                                close3 = value;
                              }),
                          SizedBox(height: 8.v),
                          CustomCheckboxButton(
                              text: "Clamping",
                              value: clamping,
                              padding: EdgeInsets.symmetric(vertical: 1.v),
                              onChange: (value) {
                                clamping = value;
                              }),
                          SizedBox(height: 13.v),
                          CustomCheckboxButton(
                              text: "Obstruction to \nsidewalk",
                              isExpandedText: true,
                              value: close4,
                              onChange: (value) {
                                close4 = value;
                              })
                        ]))
              ])),
          SizedBox(height: 7.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.h, right: 23.h),
                  child: Row(children: [
                    CustomCheckboxButton(
                        text: "Failure to carry COR/OR",
                        isExpandedText: true,
                        value: failureToCarryCOROR,
                        onChange: (value) {
                          failureToCarryCOROR = value;
                        }),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 29.h, top: 3.v, bottom: 3.v),
                        child: CustomCheckboxButton(
                            text: "Illegal parking",
                            value: illegalParking,
                            padding: EdgeInsets.symmetric(vertical: 1.v),
                            onChange: (value) {
                              illegalParking = value;
                            }))
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildCommentColumn(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 16.v,
                      width: 162.h,
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text("Other Violation/Comments",
                                style:
                                    CustomTextStyles.bodyMediumInterGray50001)),
                        Align(
                            alignment: Alignment.center,
                            child: Text("Other Violation/Comments",
                                style:
                                    CustomTextStyles.bodyMediumInterGray50001))
                      ])),
                  SizedBox(height: 6.v),
                  Padding(
                      padding: EdgeInsets.only(left: 7.h),
                      child: CustomTextFormField(
                          controller: commentController,
                          textInputAction: TextInputAction.done))
                ])));
  }

  /// Section Widget
  Widget _buildSaveStack(BuildContext context) {
    return SizedBox(
        height: 195.v,
        width: 332.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 34.v,
                  width: 106.h,
                  margin: EdgeInsets.only(bottom: 17.v),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                            padding: EdgeInsets.only(right: 27.h),
                            child: Text("Next",
                                style: CustomTextStyles
                                    .bodySmallInterOnErrorContainer))),
                    CustomElevatedButton(
                        height: 27.v,
                        width: 106.h,
                        text: "Save",
                        buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                        buttonTextStyle:
                            CustomTextStyles.bodySmallInterOnErrorContainer,
                        alignment: Alignment.bottomCenter)
                  ]))),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 195.v,
                  width: 332.h,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 17.h, vertical: 13.v),
                            decoration: AppDecoration.outlineBlack.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgCamera,
                                      height: 21.v,
                                      width: 25.h),
                                  SizedBox(height: 9.v),
                                  Text("Documentation",
                                      style: CustomTextStyles
                                          .bodySmallAsapGray90010)
                                ]))),
                    _buildCommentColumn(context)
                  ])))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapVector(BuildContext context) {
    Navigator.pop(context);
  }
}
