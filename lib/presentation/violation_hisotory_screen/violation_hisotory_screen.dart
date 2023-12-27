import 'package:enforcenow/core/app_export.dart';
import 'package:enforcenow/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ViolationHisotoryScreen extends StatelessWidget {
  const ViolationHisotoryScreen({Key? key})
      : super(
          key: key,
        );

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
                  "Violation History",
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
                  "Juan Sebastian Dela Cruz",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 9.v),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: Text(
                  "Date of Birth ",
                  style: CustomTextStyles.bodyMediumInterGray5000114,
                ),
              ),
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(left: 26.h),
                child: Text(
                  "01/14/2000",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 11.v),
              _buildLicenseNumber(context),
              Spacer(),
              SizedBox(height: 53.v),
              CustomElevatedButton(
                height: 27.v,
                width: 106.h,
                text: "Add record",
                buttonStyle: CustomButtonStyles.fillBlue,
                buttonTextStyle: theme.textTheme.labelLarge!,
                alignment: Alignment.center,
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
              "328798652BFVDFg4y3y",
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 1.v),
          Container(
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
                          style: CustomTextStyles.labelMediumOnErrorContainer,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28.h),
                          child: Text(
                            "E-ticket ↓",
                            style: CustomTextStyles.labelMediumOnErrorContainer,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 56.h),
                          child: Text(
                            "Status",
                            style: CustomTextStyles.labelMediumOnErrorContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: _buildStableTableRow(context),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: _buildStableTableRow(context),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: _buildStableTableRow(context),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: _buildStableTableRow(context),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: _buildStableTableRow(context),
                ),
                SizedBox(height: 19.v),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: _buildStableTableRow(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildStableTableRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillOnErrorContainer,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "01/24/2024",
            style: CustomTextStyles.bodyMediumInterErrorContainer,
          ),
          Padding(
            padding: EdgeInsets.only(left: 47.h),
            child: Text(
              "Show",
              style: CustomTextStyles.bodyMediumInterErrorContainer,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 42.h),
            child: Text(
              "Paid",
              style: CustomTextStyles.labelMediumMedium,
            ),
          ),
        ],
      ),
    );
  }
}
