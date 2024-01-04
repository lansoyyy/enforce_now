import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/app_bar/appbar_leading_image.dart';
import 'package:enforcenow/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:enforcenow/widgets/app_bar/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TrafficEnforcerInfoScreen extends StatelessWidget {
  const TrafficEnforcerInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildEditAccount(context),
                  _buildMyAccount(context)
                ]))));
  }

  /// Section Widget
  Widget _buildEditAccount(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return Container(
        padding: EdgeInsets.symmetric(vertical: 11.v),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgGroup156),
                fit: BoxFit.cover)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 17.v),
              CustomAppBar(
                  leadingWidth: 41.h,
                  leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgArrowLeft,
                      margin:
                          EdgeInsets.only(left: 21.h, top: 3.v, bottom: 1.v),
                      onTap: () {
                        onTapArrowLeft(context);
                      }),
                  title: AppbarSubtitleOne(
                      text: "MY PROFILE", margin: EdgeInsets.only(left: 16.h))),
              SizedBox(height: 72.v),
              Padding(
                  padding: EdgeInsets.only(left: 26.h),
                  child: Row(children: [
                    Icon(
                      Icons.account_circle_sharp,
                      size: 48,
                    ),
                    StreamBuilder<DocumentSnapshot>(
                        stream: userData,
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox();
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong'));
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          }
                          dynamic data = snapshot.data;
                          return Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data['name'],
                                        style: CustomTextStyles
                                            .titleMediumGray900),
                                    SizedBox(height: 6.v),
                                    Text(data['number'],
                                        style: CustomTextStyles
                                            .bodySmallAsapGray900),
                                    Text(data['email'],
                                        style: CustomTextStyles
                                            .bodySmallAsapGray900)
                                  ]));
                        })
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildMyAccount(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v),
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child:
                      Text("My Account", style: theme.textTheme.titleLarge))),
          SizedBox(height: 17.v),
          SizedBox(height: 16.v),
          GestureDetector(
            onTap: () {
              showAboutDialog(
                  context: context,
                  applicationName: 'Enforce Now',
                  applicationLegalese: 'Enforce Now',
                  applicationVersion: 'v1.0.0');
            },
            child: Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: _buildAccountPrivacy(context, text: "Account privacy")),
          ),
          SizedBox(height: 5.v)
        ]));
  }

  /// Common widget
  Widget _buildAccountPrivacy(
    BuildContext context, {
    required String text,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text(text,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: appTheme.gray800))),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 24.adaptSize,
          width: 24.adaptSize)
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
