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
    return SizedBox();
  }
}
