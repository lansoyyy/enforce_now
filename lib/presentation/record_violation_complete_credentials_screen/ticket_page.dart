import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../../widgets/custom_text_form_field.dart';
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;

// ignore_for_file: must_be_immutable
class TicketPage extends StatefulWidget {
  String fname;
  String lname;
  String bday;
  String license;
  String plate;
  String model;
  String classification;
  String address;
  String place;
  String ownername;
  String owneraddress;

  String others;

  String id;

  List violations;

  TicketPage(
      {required this.fname,
      required this.id,
      required this.violations,
      required this.others,
      required this.lname,
      required this.bday,
      required this.license,
      required this.plate,
      required this.model,
      required this.classification,
      required this.address,
      required this.place,
      required this.ownername,
      required this.owneraddress});
  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  TextEditingController othersController = TextEditingController();

  final box = GetStorage();

  List<bool> selectedViolations =
      List<bool>.generate(2 * (violations.length ~/ 2), (index) => false);

  List<Map<String, dynamic>> selectedItems = [];

  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  final doc = pw.Document();

  printing(Uint8List capturedImage) async {
    doc.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Container(
            height: double.infinity,
            width: double.infinity,
            child: pw.Image(
              pw.MemoryImage(capturedImage),
            ));
      },
    ));

    await Printing.layoutPdf(onLayout: (format) async => doc.save());
  }

  final ssController = ScreenshotController();

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
    print(selectedItems);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 16.v),
                child: SingleChildScrollView(
                  child: Column(children: [
                    _buildArrowLeftSection(context),
                    Screenshot(
                      controller: ssController,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/img_single_logo_2.png',
                            height: 50,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Enforce Now'),
                          SizedBox(
                            height: 5,
                          ),
                          Text(DateFormat('MMMM, dd, yyyy hh:mm a')
                              .format(DateTime.now())),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Divider(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(DateFormat('TVR').format(DateTime.now())),
                          SizedBox(
                            height: 5,
                          ),
                          Text(DateFormat(widget.id).format(DateTime.now())),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Issued at:'),
                                    Text('Cagayan De Oro City',
                                        style: CustomTextStyles
                                            .bodySmallBebasNeueBlue700),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Violator's Name"),
                                    Text(widget.ownername,
                                        style: CustomTextStyles
                                            .bodySmallBebasNeueBlue700),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("License"),
                                    Text(widget.license,
                                        style: CustomTextStyles
                                            .bodySmallBebasNeueBlue700),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Address"),
                                    Text(widget.owneraddress,
                                        style: CustomTextStyles
                                            .bodySmallBebasNeueBlue700),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Plate Number"),
                                    Text(widget.plate,
                                        style: CustomTextStyles
                                            .bodySmallBebasNeueBlue700),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Type of Vehicle"),
                                    Text(widget.model,
                                        style: CustomTextStyles
                                            .bodySmallBebasNeueBlue700),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Body Color"),
                                    Text(widget.classification,
                                        style: CustomTextStyles
                                            .bodySmallBebasNeueBlue700),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount to be paid"),
                                    Text(
                                        '${widget.violations.fold(0, (acc, violation) => int.parse(acc.toString()) + int.parse(violation["fine"].toString()))}',
                                        style: CustomTextStyles
                                            .headlineLargeBlueA200),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    itemCount: widget.violations.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(widget.violations[index]
                                                  ['violation'] +
                                              ':'),
                                          Text(
                                              widget.violations[index]['fine']
                                                  .toString(),
                                              style: CustomTextStyles
                                                  .bodySmallBebasNeueBlue700)
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.mainMenuScreen);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Home')
                            ],
                          ),
                        ),
                        CustomElevatedButton(
                            width: 150,
                            onPressed: () {
                              ssController
                                  .capture(
                                      delay: const Duration(milliseconds: 10))
                                  .then((capturedImage) async {
                                printing(capturedImage!);
                              }).catchError((onError) {
                                print(onError);
                              });
                            },
                            text: "Print",
                            margin: EdgeInsets.symmetric(horizontal: 7.h)),
                      ],
                    ),
                    SizedBox(height: 5.v)
                  ]),
                ))));
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
                                text: "Issue E-Ticket",
                                style: CustomTextStyles.headlineLargeBlueA200),
                          ]),
                          textAlign: TextAlign.center)))
            ])));
  }

  void updateSelectedItems() {
    selectedItems.clear();
    for (int i = 0; i < selectedViolations.length; i++) {
      if (selectedViolations[i]) {
        selectedItems.add(violations[i]);
      }
    }
    print(selectedItems);
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  Widget buildothers(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text("Other Violations/Comments",
                      style: CustomTextStyles.bodyMediumInterBlack90002))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: CustomTextFormField(
                  maxLines: 5,
                  controller: othersController,
                  textInputAction: TextInputAction.done,
                  alignment: Alignment.centerRight))
        ]));
  }
}
