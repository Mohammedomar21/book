import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: CachedNetworkImage(imageUrl: image,fit: BoxFit.fill,),
      // child: Container(
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(16),
      //       image: const DecorationImage(
      //         fit: BoxFit.fill,
      //
      //         image: AssetImage(
      //           AssetsData.mo,
      //         ),
      //       )),
      // ),
    );
  }
}
