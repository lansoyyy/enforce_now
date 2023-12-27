import 'package:enforcenow/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentItemWidget extends StatelessWidget {
  const PaymentItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74.h,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.v),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgCandidacy1,
                height: 56.adaptSize,
                width: 56.adaptSize,
                radius: BorderRadius.circular(
                  28.h,
                ),
              ),
              SizedBox(height: 10.v),
              Text(
                "Aljhon Bautista",
                style: CustomTextStyles.bodySmallAsapGray90011,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
