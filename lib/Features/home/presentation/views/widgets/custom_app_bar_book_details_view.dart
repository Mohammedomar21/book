import 'package:flutter/material.dart';

class CustomAppBarBookDetailsView extends StatelessWidget {
  const CustomAppBarBookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              size: 31.52,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 25,
            ))
      ],
    );
  }
}
