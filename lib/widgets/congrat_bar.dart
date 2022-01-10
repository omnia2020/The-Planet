import 'package:education_system/config/constants.dart';
import 'package:education_system/extensions/relative_length.dart';
import 'package:flutter/material.dart';

class CongratBar extends StatelessWidget {
  const CongratBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(seconds: 3),
      color: ConstantsColors.greenColor,
      curve: Curves.easeInOutSine,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.3.vh),
        child: Text(
          'Congratulations 🎉 , you are here...',
          style: AppStyles.whiteStyle,
        ),
      ),
    );
  }
}
