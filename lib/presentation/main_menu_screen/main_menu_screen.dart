import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_icon_button.dart';
import 'package:enforcenow/widgets/custom_search_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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

  final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  /// Section Widget
  Widget _buildWelcomeMrEdJaySection(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: userData,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          dynamic data = snapshot.data;
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 16.v),
              decoration: BoxDecoration(
                color: Colors.blue[700],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 25.v),
                    Padding(
                        padding: EdgeInsets.only(left: 19.h),
                        child: Text("Welcome Mr. ${data['name']}",
                            style:
                                CustomTextStyles.titleMediumOnErrorContainer)),
                    SizedBox(height: 27.v),
                    Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Row(children: [
                          Expanded(
                              child: CustomSearchView(
                                  controller: searchController,
                                  hintText: "Search ")),
                          Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: CustomIconButton(
                                  height: 40.adaptSize,
                                  width: 40.adaptSize,
                                  padding: EdgeInsets.all(12.h),
                                  decoration: IconButtonStyleHelper
                                      .fillOnPrimaryContainer,
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgSearchIcon)))
                        ]))
                  ]));
        });
  }

  final box = GetStorage();

  /// Section Widget
  Widget _buildFifteenSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 23.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Record violation", style: theme.textTheme.titleLarge),
          SizedBox(height: 17.v),
          SizedBox(
            height: 103.v,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    box.write('type', 'Complete');
                    onTapComplete(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 6.v),
                        Icon(
                          Icons.file_copy,
                          size: 32,
                        ),
                        SizedBox(height: 7.v),
                        SizedBox(
                          width: 49.h,
                          child: Text(
                            "Complete credentials",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodySmallBebasNeueBlue700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    box.write('type', 'Incomplete');
                    onTapComplete(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 6.v),
                        Icon(
                          Icons.system_security_update_warning_rounded,
                          size: 32,
                        ),
                        SizedBox(height: 7.v),
                        SizedBox(
                          width: 49.h,
                          child: Text(
                            "Incomplete credentials",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodySmallBebasNeueBlue700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    box.write('type', 'No credentials');
                    onTapComplete(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 6.v),
                        Icon(
                          Icons.no_sim_outlined,
                          size: 32,
                        ),
                        SizedBox(height: 7.v),
                        SizedBox(
                          width: 49.h,
                          child: Text(
                            "No credentials",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodySmallBebasNeueBlue700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
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
