import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/presentation/record_violation_complete_credentials_screen/ticket_page.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:enforcenow/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../../core/services/add_record.dart';
import '../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ViolationList extends StatefulWidget {
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
  String? img;
  String? desc;

  ViolationList(
      {required this.fname,
      required this.lname,
      required this.bday,
      required this.license,
      required this.plate,
      required this.model,
      required this.classification,
      required this.address,
      required this.place,
      this.img = '',
      this.desc = '',
      required this.ownername,
      required this.owneraddress});
  @override
  State<ViolationList> createState() => _ViolationListState();
}

class _ViolationListState extends State<ViolationList> {
  TextEditingController othersController = TextEditingController();

  final box = GetStorage();

  List<bool> selectedViolations =
      List<bool>.generate(2 * (violations.length ~/ 2), (index) => false);

  List<Map<String, dynamic>> selectedItems = [];

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
    print(selectedItems);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 16.v),
                child: SingleChildScrollView(
                  child: Column(children: [
                    _buildArrowLeftSection(context),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Violations')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                            height: 300,
                            width: 500,
                            child: ListView.builder(
                              itemCount: data.docs.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: Text(data.docs[index]['name']),
                                        value: selectedViolations[index],
                                        onChanged: (value) {
                                          setState(() {
                                            selectedViolations[index] = value!;
                                            updateSelectedItems();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(child: buildothers(context)),
                    SizedBox(height: 31.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Documentation')
                            ],
                          ),
                        ),
                        CustomElevatedButton(
                            width: 150,
                            onPressed: () {
                              if (widget.lname != '' ||
                                  widget.fname != '' ||
                                  widget.license != '' ||
                                  widget.bday != '' ||
                                  widget.plate != '' ||
                                  widget.model != '' ||
                                  widget.classification != '' ||
                                  widget.address != '' ||
                                  widget.place != '' ||
                                  widget.ownername != '' ||
                                  widget.owneraddress != '') {
                                try {
                                  final id = addRecord(
                                          widget.lname,
                                          widget.fname,
                                          '',
                                          widget.license,
                                          box.read('type'),
                                          widget.bday,
                                          widget.plate,
                                          widget.model,
                                          widget.classification,
                                          widget.address,
                                          widget.place,
                                          widget.ownername,
                                          widget.owneraddress,
                                          widget.img == ''
                                              ? imageURL
                                              : widget.img,
                                          widget.desc == ''
                                              ? othersController.text
                                              : widget.desc,
                                          '${selectedItems.fold(0, (acc, violation) => int.parse(acc.toString()) + int.parse(violation["fine"].toString()))}')
                                      .then((value) {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Record Saved!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    AppRoutes.mainMenuScreen);
                                              },
                                              child: Text(
                                                'Home',
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => TicketPage(
                                                            id: value,
                                                            others:
                                                                othersController
                                                                    .text,
                                                            violations:
                                                                selectedItems,
                                                            fname: widget.fname,
                                                            lname: widget.lname,
                                                            bday: widget.bday,
                                                            license:
                                                                widget.license,
                                                            plate: widget.plate,
                                                            model: widget.model,
                                                            classification: widget
                                                                .classification,
                                                            address:
                                                                widget.address,
                                                            place: widget.place,
                                                            ownername: widget
                                                                .ownername,
                                                            owneraddress: widget
                                                                .owneraddress)));
                                              },
                                              child: Text(
                                                'Issue E-Ticket',
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    showToast('Record added succesfully!');
                                  });
                                } catch (e) {
                                  showToast(e.toString());
                                }
                              } else {
                                showToast(
                                    'Cannot proceed! Please input blank fields');
                              }
                            },
                            text: "Save",
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
                                text: "List of Violations",
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
