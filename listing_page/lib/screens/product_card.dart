import 'package:flutter/material.dart';
import 'package:listing_page/screens/image_content.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      this.width,
      this.height,
      this.heightImage,
      this.borderRadius = 6,
      required this.image,
      this.title,
      this.price,
      this.color = Colors.white,
      this.product})
      : super(key: key);

  final double? width;
  final double? height;
  final double? heightImage;
  final double borderRadius;
  final Image image;
  final Color color;
  final String? title;
  final String? price;
  final product;

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider = image.image;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
            child: Image(
              image: imageProvider,
              width: width,
              height: heightImage,
              fit: BoxFit.cover,
            ),
          ),
          ImageCardContent(
            title: title,
            price: price,
            product: product,
          ),
        ],
      ),
    );
  }
}
