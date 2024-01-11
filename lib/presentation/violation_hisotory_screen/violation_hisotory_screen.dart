import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../record_violation_complete_credentials_screen/violation_list.dart';

class ViolationHisotoryScreen extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 4.h,
            vertical: 44.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Violation Historys",
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: Text(
                  "Driver’s Full Name",
                  style: CustomTextStyles.bodyMediumInterGray5000114,
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Text(
                  box.read('name'),
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 11.v),
              _buildLicenseNumber(context),
              Spacer(),
              Expanded(child: SizedBox(height: 53.v)),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Records')
                      .where('license', isEqualTo: box.read('license'))
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

                    final data = snapshot.requireData;
                    return CustomElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViolationList(
                                  lname:
                                      ' ${data.docs.first['lname']} ${data.docs.first['mname']}',
                                  fname: '${data.docs.first['fname']}',
                                  bday: data.docs.first['bday'],
                                  license: data.docs.first['license'],
                                  plate: data.docs.first['platenumber'],
                                  model: data.docs.first['model'],
                                  classification:
                                      data.docs.first['classification'],
                                  address: data.docs.first['address'],
                                  place: data.docs.first['place'],
                                  ownername: data.docs.first['ownername'],
                                  owneraddress:
                                      data.docs.first['owneraddress'])));
                        },
                        text: "Add a Record",
                        margin: EdgeInsets.symmetric(horizontal: 7.h));
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLicenseNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 23.h),
            child: Text(
              "License Number ",
              style: CustomTextStyles.bodyMediumInterGray5000114,
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 23.h),
            child: Text(
              box.read('license'),
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 1.v),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Records')
                  .where('license', isEqualTo: box.read('license'))
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

                final data = snapshot.requireData;
                return Container(
                  width: 346.h,
                  padding: EdgeInsets.symmetric(vertical: 20.v),
                  decoration: AppDecoration.outlineBlack90002.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 20.h,
                            right: 5.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 5.v,
                          ),
                          decoration: AppDecoration.fillBlue.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Date of Violations",
                                style: CustomTextStyles
                                    .labelMediumOnErrorContainer,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 28.h),
                                child: Text(
                                  "E-ticket ↓",
                                  style: CustomTextStyles
                                      .labelMediumOnErrorContainer,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 56.h),
                                child: Text(
                                  "Status",
                                  style: CustomTextStyles
                                      .labelMediumOnErrorContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      for (int i = 0; i < data.docs.length; i++)
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: _buildStableTableRow(context, data.docs[i]),
                        ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildStableTableRow(BuildContext context, data) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillOnErrorContainer,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            DateFormat.yMMMd().add_jm().format(data['dateTime'].toDate()),
            style: CustomTextStyles.bodyMediumInterErrorContainer,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text(
              "Show",
              style: CustomTextStyles.bodyMediumInterErrorContainer,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.h),
            child: Text(
              data['status'],
              style: CustomTextStyles.labelMediumMedium,
            ),
          ),
        ],
      ),
    );
  }
}
