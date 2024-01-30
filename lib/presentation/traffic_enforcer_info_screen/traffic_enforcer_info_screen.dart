import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/presentation/traffic_enforcer_info_screen/edit_profile_screen.dart';
import 'package:enforcenow/widgets/app_bar/appbar_leading_image.dart';
import 'package:enforcenow/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:enforcenow/widgets/app_bar/custom_app_bar.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TrafficEnforcerInfoScreen extends StatelessWidget {
  const TrafficEnforcerInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder<DocumentSnapshot>(
                stream: userData,
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const SizedBox();
                  }
                  dynamic data = snapshot.data;
                  return Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 150,
                              padding: EdgeInsets.symmetric(vertical: 11.v),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/back.png',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CustomAppBar(
                                  leadingWidth: 41.h,
                                  leading: AppbarLeadingImage(
                                      imagePath: ImageConstant.imgArrowLeft,
                                      margin: EdgeInsets.only(
                                          left: 21.h, top: 3.v, bottom: 1.v),
                                      onTap: () {
                                        onTapArrowLeft(context);
                                      }),
                                  title: AppbarSubtitleOne(
                                      text: "MY PROFILE",
                                      margin: EdgeInsets.only(left: 16.h))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Center(
                                  child: CircleAvatar(
                                minRadius: 45,
                                maxRadius: 45,
                                backgroundImage: NetworkImage(data['profile']),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(data['name'], style: theme.textTheme.titleLarge),
                        SizedBox(
                          height: 10,
                        ),
                        CustomElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditProfileScreen()));
                            },
                            height: 30,
                            width: 150,
                            text: 'Edit profile'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(data['number'], style: theme.textTheme.bodyMedium),
                        SizedBox(
                          height: 5,
                        ),
                        Text(data['email'], style: theme.textTheme.bodyMedium),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Position:',
                                  style: theme.textTheme.titleMedium),
                              Text(data['type'],
                                  style: theme.textTheme.titleLarge),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Address:',
                                  style: theme.textTheme.titleMedium),
                              Text(data['address'],
                                  style: theme.textTheme.titleLarge),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })));
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
              image: AssetImage(
                'assets/images/back.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        text: "MY PROFILE",
                        margin: EdgeInsets.only(left: 16.h))),
                SizedBox(height: 72.v),
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 26.h),
                      child: Row(children: [
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.account_circle_rounded,
                                          size: 75,
                                        ),
                                      ]));
                            })
                      ])),
                )
              ]),
        ));
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
