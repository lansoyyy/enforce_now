import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/presentation/record_violation_complete_credentials_screen/violation_list.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class IncompleteCredentialsScreen2 extends StatefulWidget {
  String lname;
  String fname;
  String mname;
  String address;
  String bday;
  String license;

  IncompleteCredentialsScreen2(
      {required this.lname,
      required this.fname,
      required this.mname,
      required this.address,
      required this.license,
      required this.bday});

  @override
  State<IncompleteCredentialsScreen2> createState() =>
      _IncompleteCredentialsScreen2State();
}

class _IncompleteCredentialsScreen2State
    extends State<IncompleteCredentialsScreen2> {
  TextEditingController surnameController = TextEditingController();

  TextEditingController editTextController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

  TextEditingController editTextController2 = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 24.v,
          ),
          child: SingleChildScrollView(
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
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Violators Surname:',
                            style: CustomTextStyles.bodyMediumInterBlack90002,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            widget.lname,
                            style: CustomTextStyles.labelLargeBlack900,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Violators Firstname:',
                            style: CustomTextStyles.bodyMediumInterBlack90002,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            widget.fname,
                            style: CustomTextStyles.labelLargeBlack900,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Violators Middlename:',
                            style: CustomTextStyles.bodyMediumInterBlack90002,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            widget.mname,
                            style: CustomTextStyles.labelLargeBlack900,
                          ),
                        ],
                      ),
                      box.read('type') == 'Complete'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'License',
                                  style: CustomTextStyles
                                      .bodyMediumInterBlack90002,
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  widget.license,
                                  style: CustomTextStyles.labelLargeBlack900,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Birthdate',
                                  style: CustomTextStyles
                                      .bodyMediumInterBlack90002,
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  widget.bday,
                                  style: CustomTextStyles.labelLargeBlack900,
                                ),
                              ],
                            ),
                      box.read('type') == 'Complete'
                          ? SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Address',
                                  style: CustomTextStyles
                                      .bodyMediumInterBlack90002,
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  widget.address,
                                  style: CustomTextStyles.labelLargeBlack900,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 26.v),
                SizedBox(height: 9.v),
                box.read('type') == 'Complete'
                    ? platenumber(context)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Padding(
                                padding: EdgeInsets.only(right: 7.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Opacity(
                                          opacity: 0.7,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 22.h),
                                              child: Text("License No.",
                                                  style: CustomTextStyles
                                                      .bodyMediumInterBlack90002))),
                                      SizedBox(height: 1.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 18.h),
                                          child: CustomTextFormField(
                                              controller: editTextController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              alignment: Alignment.centerRight))
                                    ])),
                          ),
                          SizedBox(width: 150, child: platenumber(context)),
                        ],
                      ),
                SizedBox(height: 9.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 150, child: type(context)),
                    SizedBox(width: 150, child: classification(context)),
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
                SizedBox(height: 50.v),
                CustomElevatedButton(
                  onPressed: () {
                    box.write(
                        'license',
                        box.read('type') == 'Complete'
                            ? widget.license
                            : editTextController.text);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViolationList(
                            lname: ' ${widget.lname}',
                            fname: '${widget.fname}',
                            bday: widget.bday,
                            license: box.read('type') == 'Complete'
                                ? widget.license
                                : editTextController.text,
                            plate: platenumberTextController.text,
                            model: typeTextController.text,
                            classification: classificationTextController.text,
                            address: addressTextController.text,
                            place: placeTextController.text,
                            ownername: ownernameController.text,
                            owneraddress: owneraddressController.text)));
                  },
                  text: "Next",
                ),
                SizedBox(height: 5.v),
              ],
            ),
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
            controller: editTextController,
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
              "Violator’s Address",
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
}
