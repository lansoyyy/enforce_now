import '../abou_the_app_screen/widgets/payment_item_widget.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/app_bar/appbar_leading_image.dart';
import 'package:enforcenow/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:enforcenow/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AbouTheAppScreen extends StatelessWidget {
  const AbouTheAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildUserProfile(context),
                  SizedBox(height: 57.v),
                  Container(
                      width: 334.h,
                      margin: EdgeInsets.only(left: 16.h, right: 10.h),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "EnforceNow",
                                style: theme.textTheme.labelMedium),
                            TextSpan(
                                text:
                                    " is a cutting-edge mobile application designed specifically for traffic enforcers. This powerful app revolutionizes the way traffic violations are recorded and managed, making the process more efficient and accurate.\n\nWith ",
                                style:
                                    CustomTextStyles.bodySmallInterBlack90002),
                            TextSpan(
                                text: "EnforceNow",
                                style: theme.textTheme.labelMedium),
                            TextSpan(
                                text:
                                    ", traffic enforcers can easily document and track various traffic violations, such as speeding, illegal parking, and reckless driving. The app provides a user-friendly interface that allows enforcers to input relevant information, capture photos or videos as evidence, and generate detailed reports.\n\nBy using ",
                                style:
                                    CustomTextStyles.bodySmallInterBlack90002),
                            TextSpan(
                                text: "EnforceNow",
                                style: theme.textTheme.labelMedium),
                            TextSpan(
                                text:
                                    ", traffic enforcers can save valuable time, reduce paperwork, and enhance the overall effectiveness of traffic enforcement efforts. The app empowers enforcers to enforce traffic rules more efficiently, leading to safer roads and a better driving experience for everyone.\n\nDownload",
                                style:
                                    CustomTextStyles.bodySmallInterBlack90002),
                            TextSpan(
                                text: " EnforceNow",
                                style: theme.textTheme.labelMedium),
                            TextSpan(
                                text:
                                    " today and join the growing community of traffic enforcers who are making a difference on the roads. Together, let's create a safer and more orderly traffic environment for all. \n\n🚦📱🚗 \n#EnforceNow\n #TrafficEnforcement \n#SafetyFirst",
                                style:
                                    CustomTextStyles.bodySmallInterBlack90002)
                          ]),
                          textAlign: TextAlign.left)),
                  SizedBox(height: 57.v)
                ]))));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return SizedBox(
        height: 241.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 241.v,
                  padding: EdgeInsets.symmetric(horizontal: 32.h),
                  decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: ListView.separated(
                      padding:
                          EdgeInsets.only(left: 7.h, top: 130.v, right: 7.h),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 29.h);
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return PaymentItemWidget();
                      }))),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 28.v),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgGroup156),
                          fit: BoxFit.cover)),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CustomAppBar(
                        leadingWidth: 41.h,
                        leading: AppbarLeadingImage(
                            imagePath: ImageConstant.imgArrowLeft,
                            margin: EdgeInsets.only(
                                left: 21.h, top: 3.v, bottom: 1.v),
                            onTap: () {
                              onTapArrowLeft(context);
                            }),
                        title: AppbarSubtitleOne(
                            text: "about app",
                            margin: EdgeInsets.only(left: 16.h))),
                    SizedBox(height: 41.v),
                    Text("The Team", style: theme.textTheme.headlineSmall),
                    SizedBox(height: 41.v)
                  ])))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
