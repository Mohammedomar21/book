import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/assets.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5/4,
      child: Container(

        decoration:  BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.fill,
                image:AssetImage(AssetsData.mo)
            ),

            borderRadius: BorderRadius.circular(8)
        ),


      ),
    );
  }
}