import 'package:education_system/extensions/relative_length.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color? btnColor;
  final Color? textColor;
  final String? btnText;
  final Function()? onPressed;
  const PrimaryButton({
    Key? key,
    required this.btnColor,
    required this.btnText,
    required this.onPressed,
    required this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 39.7.vw,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          btnText ?? "",
          style: TextStyle(
            fontSize: 3.7.vw,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
