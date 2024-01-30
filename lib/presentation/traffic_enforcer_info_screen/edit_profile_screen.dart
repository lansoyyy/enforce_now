import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/app_bar/appbar_leading_image.dart';
import 'package:enforcenow/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:enforcenow/widgets/app_bar/custom_app_bar.dart';
import 'package:enforcenow/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final num = TextEditingController();
  final email = TextEditingController();
  final position = TextEditingController();
  final address = TextEditingController();

  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  Future<void> uploadPicture(String inputSource) async {
    final picker = ImagePicker();
    XFile pickedImage;
    try {
      pickedImage = (await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920))!;

      fileName = path.basename(pickedImage.path);
      imageFile = File(pickedImage.path);

      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: AlertDialog(
                title: Row(
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Loading . . .',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'QRegular'),
                ),
              ],
            )),
          ),
        );

        await firebase_storage.FirebaseStorage.instance
            .ref('Users/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('Users/$fileName')
            .getDownloadURL();

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'profile': imageURL});

        Navigator.of(context).pop();
      } on firebase_storage.FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

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

                  num.text = data['number'];
                  email.text = data['email'];
                  position.text = data['type'];
                  address.text = data['address'];
                  return SingleChildScrollView(
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
                                      text: "EDIT PROFILE",
                                      margin: EdgeInsets.only(left: 16.h))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: GestureDetector(
                                onTap: () {
                                  uploadPicture('gallery');
                                },
                                child: Center(
                                    child: CircleAvatar(
                                  minRadius: 45,
                                  maxRadius: 45,
                                  backgroundImage:
                                      NetworkImage(data['profile']),
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(data['name'], style: theme.textTheme.titleLarge),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 7.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 20.h),
                                          child: Text("Contact Number",
                                              style: CustomTextStyles
                                                  .bodyMediumInterBlack90002))),
                                  SizedBox(height: 2.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 18.h),
                                      child: CustomTextFormField(
                                          controller: num,
                                          alignment: Alignment.centerRight))
                                ])),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 7.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 20.h),
                                          child: Text("Email",
                                              style: CustomTextStyles
                                                  .bodyMediumInterBlack90002))),
                                  SizedBox(height: 2.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 18.h),
                                      child: CustomTextFormField(
                                          enabled: false,
                                          controller: email,
                                          alignment: Alignment.centerRight))
                                ])),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 7.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 20.h),
                                          child: Text("Position",
                                              style: CustomTextStyles
                                                  .bodyMediumInterBlack90002))),
                                  SizedBox(height: 2.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 18.h),
                                      child: CustomTextFormField(
                                          enabled: false,
                                          controller: position,
                                          alignment: Alignment.centerRight))
                                ])),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 7.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 20.h),
                                          child: Text("Address",
                                              style: CustomTextStyles
                                                  .bodyMediumInterBlack90002))),
                                  SizedBox(height: 2.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 18.h),
                                      child: CustomTextFormField(
                                          controller: address,
                                          alignment: Alignment.centerRight))
                                ])),
                        SizedBox(
                          height: 30,
                        ),
                        CustomElevatedButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(data.id)
                                  .update({
                                'number': num.text,
                                'address': address.text,
                                'type': position.text,
                                'email': email.text,
                              });
                              showToast('Profile updated!');
                              Navigator.of(context).pop();
                            },
                            height: 30,
                            width: 150,
                            text: 'Save'),
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
