import 'package:enforcenow/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompleteItemWidget extends StatelessWidget {
  CompleteItemWidget({
    Key? key,
    this.onTapComplete,
  }) : super(
          key: key,
        );

  VoidCallback? onTapComplete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96.h,
      child: GestureDetector(
        onTap: () {
          onTapComplete!.call();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 4.v,
          ),
          decoration: AppDecoration.fillBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 6.v),
              CustomImageView(
                imagePath: ImageConstant.imgCopyToClipboard,
                height: 51.adaptSize,
                width: 51.adaptSize,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                width: 49.h,
                child: Text(
                  "Complete credentials",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodySmallBebasNeueBlue700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
