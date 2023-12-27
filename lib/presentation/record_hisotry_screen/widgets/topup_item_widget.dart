import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopupItemWidget extends StatelessWidget {
  const TopupItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.v),
      decoration: AppDecoration.fillOnErrorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 40.adaptSize,
            width: 40.adaptSize,
            padding: EdgeInsets.all(10.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgDownload,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Column(
              children: [
                Text(
                  "Aljhon Bautista",
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
                  "September 3, 2023",
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
    );
  }
}
