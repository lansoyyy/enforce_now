import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/presentation/record_violation_complete_credentials_screen/violation_list.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

// ignore_for_file: must_be_immutable
class RecordViolationCompleteCredentialsScreen extends StatefulWidget {
  @override
  State<RecordViolationCompleteCredentialsScreen> createState() =>
      _RecordViolationCompleteCredentialsScreenState();
}

class _RecordViolationCompleteCredentialsScreenState
    extends State<RecordViolationCompleteCredentialsScreen> {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: 175,
                                  child: _buildSurnameSection(context)),
                              SizedBox(
                                  width: 175,
                                  child: _buildFirstNameSection(context)),
                            ],
                          ),
                          SizedBox(height: 9.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 175, child: buildbday(context)),
                              SizedBox(width: 175, child: suffix(context)),
                            ],
                          ),
                          SizedBox(height: 9.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 175,
                                child: Padding(
                                    padding: EdgeInsets.only(right: 7.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Opacity(
                                              opacity: 0.7,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 22.h),
                                                  child: Text("License No.",
                                                      style: CustomTextStyles
                                                          .bodyMediumInterBlack90002))),
                                          SizedBox(height: 1.v),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 18.h),
                                              child: CustomTextFormField(
                                                  controller:
                                                      editTextController,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  alignment:
                                                      Alignment.centerRight))
                                        ])),
                              ),
                              SizedBox(width: 175, child: platenumber(context)),
                            ],
                          ),
                          SizedBox(height: 9.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 175, child: type(context)),
                              SizedBox(
                                  width: 175, child: classification(context)),
                            ],
                          ),
                          SizedBox(height: 9.v),
                          address(context),
                          SizedBox(height: 9.v),
                          place(context),
                          SizedBox(height: 9.v),
                          owndername(context),
                          SizedBox(height: 9.v),
                          ownderaddress(context),
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
                                if (tots != 0) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Records Available'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Close'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              box.write('license',
                                                  editTextController.text);
                                              Navigator.pushNamed(
                                                  context,
                                                  AppRoutes
                                                      .violationHisotoryScreen);
                                            },
                                            child: Text('Continue'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('No Records'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Close'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => ViolationList(
                                                      lname:
                                                          ' ${surnameController.text} ${suffixTextController.text}',
                                                      fname:
                                                          '${firstNameController.text}',
                                                      bday: bdayTextController
                                                          .text,
                                                      license:
                                                          editTextController
                                                              .text,
                                                      plate:
                                                          platenumberTextController
                                                              .text,
                                                      model: typeTextController
                                                          .text,
                                                      classification:
                                                          classificationTextController
                                                              .text,
                                                      address:
                                                          addressTextController
                                                              .text,
                                                      place: placeTextController
                                                          .text,
                                                      ownername:
                                                          ownernameController
                                                              .text,
                                                      owneraddress:
                                                          owneraddressController
                                                              .text)));
                                            },
                                            child: Text('Add Record'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
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
                                text: "${box.read('type')} Credentials",
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
  var dateController = TextEditingController();

  /// Section Widget
  void dateFromPicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.blue,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        dateController.text = formattedDate;
      });
    } else {
      return null;
    }
  }

  /// Section Widget
  Widget buildbday(BuildContext context) {
    return GestureDetector(
      onTap: () {
        dateFromPicker(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.7,
            child: Padding(
              padding: EdgeInsets.only(left: 13.h),
              child: Text(
                "Birthdate",
                style: CustomTextStyles.bodyMediumInterBlack90002,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: CustomTextFormField(
              enabled: false,
              controller: dateController,
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
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
