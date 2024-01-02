import 'package:enforcenow/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TopupItemWidget extends StatelessWidget {
  var data;

  TopupItemWidget({required this.data});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        box.write('name', data['fname'] + ' ' + data['lname']);
        box.write('license', data['license']);
        box.write('id', data.id);
        Navigator.pushNamed(context, AppRoutes.violationHisotoryScreen);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.v),
        decoration: AppDecoration.fillOnErrorContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_sharp,
              color: Colors.grey,
              size: 32,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Column(
                children: [
                  Text(
                    data['fname'] + ' ' + data['lname'],
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 6.v),
                  Text(
                    "Cagayan de Oro City",
                    style: CustomTextStyles.bodySmallAsapGray600,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 6.v),
              child: Column(
                children: [
                  Text(
                    DateFormat.yMMMd()
                        .add_jm()
                        .format(data['dateTime'].toDate()),
                    style: CustomTextStyles.bodySmallAsapGray800,
                  ),
                  SizedBox(height: 3.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "500",
                      style: CustomTextStyles.bodyLargeGreen800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
