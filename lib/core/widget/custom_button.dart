
import 'package:books/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backGroundColor,
    required this.textColor,
    this.borderRadius,
     this.text,
     this.textStyle,
  });
  final Color backGroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String? text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 142,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
          ),
        ),
        onPressed: () {},
        child: Text(
           text??'19.99€',
          style:textStyle?? Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
