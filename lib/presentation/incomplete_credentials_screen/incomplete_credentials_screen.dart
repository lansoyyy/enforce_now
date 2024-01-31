import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/presentation/incomplete_credentials_screen/incomplete_crednetials_screen2.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class IncompleteCredentialsScreen extends StatefulWidget {
  IncompleteCredentialsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<IncompleteCredentialsScreen> createState() =>
      _IncompleteCredentialsScreenState();
}

class _IncompleteCredentialsScreenState
    extends State<IncompleteCredentialsScreen> {
  TextEditingController surnameController = TextEditingController();

  TextEditingController editTextController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

  TextEditingController editTextController2 = TextEditingController();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 24.v,
          ),
          child: Column(
            children: [
              Container(
                width: 314.h,
                margin: EdgeInsets.only(left: 10.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Record Violation\n",
                        style: theme.textTheme.headlineLarge,
                      ),
                      TextSpan(
                        text: "${box.read('type')} Credentials",
                        style: CustomTextStyles.headlineLargeBlueA200,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 26.v),
              _buildRecordViolation(context),
              SizedBox(height: 15.v),
              _buildViolatorFirstName(context),
              SizedBox(height: 15.v),
              _buildViolatorMiddleName(context),
              SizedBox(height: 15.v),
              box.read('type') == 'Complete'
                  ? SizedBox()
                  : _buildViolatorAddress(context),
              SizedBox(height: 10.v),
              box.read('type') == 'Complete'
                  ? SizedBox()
                  : _buildBirthdate(context),
              box.read('type') == 'Complete'
                  ? _buildViolatorAddress(context)
                  : SizedBox(),
              SizedBox(height: 50.v),
              CustomElevatedButton(
                onPressed: () async {
                  int tots = 0;

                  if (box.read('type') == 'Complete') {
                    await FirebaseFirestore.instance
                        .collection('Records')
                        .where('license', isEqualTo: editTextController1.text)
                        .get()
                        .then((QuerySnapshot querySnapshot) {
                      setState(() {
                        tots = querySnapshot.docs.length;
                      });
                    });
                  } else {
                    await FirebaseFirestore.instance
                        .collection('Records')
                        .where('lname', isEqualTo: surnameController.text)
                        .get()
                        .then((QuerySnapshot querySnapshot) {
                      setState(() {
                        tots = querySnapshot.docs.length;
                      });
                    });
                  }

                  if (tots != 0) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('Records Available'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                box.write('license', editTextController1.text);
                                print(fnameController.text);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        IncompleteCredentialsScreen2(
                                          license: editTextController1.text,
                                          address: editTextController1.text,
                                          bday: editTextController2.text,
                                          fname: fnameController.text,
                                          lname: surnameController.text,
                                          mname: nameController.text,
                                        )));
                              },
                              child: Text('Continue'),
                            ),
                            TextButton(
                              onPressed: () {
                                box.write('license', editTextController1.text);
                                box.write(
                                    'name',
                                    fnameController.text +
                                        ' ' +
                                        surnameController.text);
                                Navigator.pushNamed(
                                    context, AppRoutes.violationHisotoryScreen);
                              },
                              child: Text('View'),
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
                                box.write('license', editTextController1.text);
                                print(fnameController.text);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        IncompleteCredentialsScreen2(
                                          license: editTextController1.text,
                                          address: editTextController1.text,
                                          bday: editTextController2.text,
                                          fname: fnameController.text,
                                          lname: surnameController.text,
                                          mname: nameController.text,
                                        )));
                              },
                              child: Text('Add Record'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                text: "Next",
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecordViolation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Text(
              "Violator ’s  Surname",
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        SizedBox(height: 2.v),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: surnameController,
          ),
        ),
      ],
    );
  }

  final fnameController = TextEditingController();

  /// Section Widget
  Widget _buildViolatorFirstName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "Violator’s First Name",
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: fnameController,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildViolatorMiddleName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "Violator’s  Middle Name",
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: nameController,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildViolatorAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Text(
              box.read('type') == 'Complete' ? "License" : 'Address',
              style: CustomTextStyles.bodyMediumInterBlack90002,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomTextFormField(
            controller: editTextController1,
          ),
        ),
      ],
    );
  }

  var dateController = TextEditingController();

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
  Widget _buildBirthdate(BuildContext context) {
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
}
