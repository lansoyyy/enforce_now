import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/presentation/record_violation_complete_credentials_screen/violation_list.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import '../../widgets/toast_widget.dart';

// ignore_for_file: must_be_immutable
class RecordNoCredentials extends StatefulWidget {
  @override
  State<RecordNoCredentials> createState() => _RecordNoCredentialsState();
}

class _RecordNoCredentialsState extends State<RecordNoCredentials> {
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

  TextEditingController commentController = TextEditingController();

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
            .ref('Images/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('Images/$fileName')
            .getDownloadURL();

        Navigator.of(context).pop();

        showToast('Uploaded!');
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
    print(editTextController.text);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Records')
                    .where('license', isEqualTo: editTextController.text)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    );
                  }

                  final data1 = snapshot.requireData;
                  return Container(
                      width: double.maxFinite,
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.h, vertical: 16.v),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          _buildArrowLeftSection(context),
                          SizedBox(height: 32.v),
                          GestureDetector(
                            onTap: () {
                              uploadPicture('camera');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 75,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Documentation')
                              ],
                            ),
                          ),
                          SizedBox(height: 9.v),
                          place(context),
                          SizedBox(height: 31.v),
                          CustomElevatedButton(
                              onPressed: () async {
                                int tots = 0;

                                await FirebaseFirestore.instance
                                    .collection('Records')
                                    .where('license',
                                        isEqualTo: editTextController.text)
                                    .get()
                                    .then((QuerySnapshot querySnapshot) {
                                  setState(() {
                                    tots = querySnapshot.docs.length;
                                  });
                                });
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
                                        owneraddress:
                                            owneraddressController.text)));
                              },
                              text: "Continue",
                              margin: EdgeInsets.symmetric(horizontal: 7.h)),
                          SizedBox(height: 5.v)
                        ]),
                      ));
                })));
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
                                text: "No Credentials",
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
