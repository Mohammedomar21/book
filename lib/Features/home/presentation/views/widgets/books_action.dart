import 'package:flutter/material.dart';

import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomButton(
            text: '19.99€',
            textColor: Colors.black,
            backGroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          CustomButton(
            text: 'Free preview',
            textStyle: Styles.textStyle16
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            textColor: Colors.white,
            backGroundColor: kBackGroundColorButtonPreview,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
        ],
      ),
    );
  }
}
