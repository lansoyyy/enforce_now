import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../record_hisotry_screen/widgets/topup_item_widget.dart';
import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/app_bar/appbar_leading_image.dart';
import 'package:enforcenow/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:enforcenow/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RecordHisotryScreen extends StatelessWidget {
  const RecordHisotryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildArrowLeft(context),
                  _buildLastTransaction(context)
                ]))));
  }

  /// Section Widget
  Widget _buildArrowLeft(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 28.v),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgGroup156),
                fit: BoxFit.cover)),
        child: CustomAppBar(
            leadingWidth: 41.h,
            leading: AppbarLeadingImage(
                imagePath: ImageConstant.imgArrowLeft,
                margin: EdgeInsets.only(left: 21.h, top: 3.v, bottom: 1.v),
                onTap: () {
                  onTapArrowLeft(context);
                }),
            title: AppbarSubtitleOne(
                text: "Record history", margin: EdgeInsets.only(left: 16.h))));
  }

  /// Section Widget
  Widget _buildLastTransaction(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 26.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("HISTORY", style: theme.textTheme.titleLarge),
          SizedBox(height: 17.v),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Records')
                  .where('userId',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                return Padding(
                    padding: EdgeInsets.only(right: 12.h),
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8.v);
                        },
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          return TopupItemWidget(
                            data: data.docs[index],
                          );
                        }));
              })
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
