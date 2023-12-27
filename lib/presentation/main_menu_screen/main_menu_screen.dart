import '../main_menu_screen/widgets/complete_item_widget.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_icon_button.dart';
import 'package:enforcenow/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MainMenuScreen extends StatelessWidget {
  MainMenuScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildWelcomeMrEdJaySection(context),
                      SizedBox(height: 51.v),
                      _buildFifteenSection(context),
                      SizedBox(height: 40.v),
                      Padding(
                          padding: EdgeInsets.only(left: 28.h),
                          child: Text("My activity",
                              style: theme.textTheme.titleLarge)),
                      SizedBox(height: 17.v),
                      GestureDetector(
                          onTap: () {
                            onTapTransactionHistory(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 28.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgShare,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.h, top: 4.v),
                                    child: Text("Record history",
                                        style: theme.textTheme.bodyLarge))
                              ]))),
                      SizedBox(height: 20.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child:
                              Text("Other", style: theme.textTheme.titleLarge)),
                      SizedBox(height: 17.v),
                      GestureDetector(
                          onTap: () {
                            onTapAboutApp(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgImage1,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.h, top: 4.v),
                                    child: Text("My Profile",
                                        style: theme.textTheme.bodyLarge))
                              ]))),
                      SizedBox(height: 16.v),
                      GestureDetector(
                          onTap: () {
                            onTapAboutApp1(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgFrame,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.h, top: 4.v),
                                    child: Text("About App",
                                        style: theme.textTheme.bodyLarge))
                              ]))),
                      SizedBox(height: 16.v),
                      GestureDetector(
                          onTap: () {
                            onTapAboutApp2(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Row(children: [
                                Opacity(
                                    opacity: 0.7,
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgLogoutRoundedLeft,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.h, top: 4.v),
                                    child: Text("Log out",
                                        style: theme.textTheme.bodyLarge))
                              ]))),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  Widget _buildWelcomeMrEdJaySection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 16.v),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgGroup156),
                fit: BoxFit.cover)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 73.v),
              Padding(
                  padding: EdgeInsets.only(left: 19.h),
                  child: Text("Welcome Mr. Ed Jay Ogoy",
                      style: CustomTextStyles.titleMediumOnErrorContainer)),
              SizedBox(height: 27.v),
              Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Row(children: [
                    Expanded(
                        child: CustomSearchView(
                            controller: searchController, hintText: "Search ")),
                    Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: CustomIconButton(
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            padding: EdgeInsets.all(12.h),
                            decoration:
                                IconButtonStyleHelper.fillOnPrimaryContainer,
                            child: CustomImageView(
                                imagePath: ImageConstant.imgSearchIcon)))
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildFifteenSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 23.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Record violation", style: theme.textTheme.titleLarge),
          SizedBox(height: 17.v),
          SizedBox(
              height: 103.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(right: 4.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10.h);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CompleteItemWidget(onTapComplete: () {
                      onTapComplete(context);
                    });
                  }))
        ]));
  }

  /// Navigates to the recordViolationCompleteCredentialsScreen when the action is triggered.
  onTapComplete(BuildContext context) {
    Navigator.pushNamed(
        context, AppRoutes.recordViolationCompleteCredentialsScreen);
  }

  /// Navigates to the recordHisotryScreen when the action is triggered.
  onTapTransactionHistory(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.recordHisotryScreen);
  }

  /// Navigates to the trafficEnforcerInfoScreen when the action is triggered.
  onTapAboutApp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.trafficEnforcerInfoScreen);
  }

  /// Navigates to the abouTheAppScreen when the action is triggered.
  onTapAboutApp1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.abouTheAppScreen);
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapAboutApp2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logInScreen);
  }
}
