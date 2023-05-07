import 'package:flutter/material.dart';
import 'package:listing_page/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class ImageCardContent extends StatelessWidget {
  const ImageCardContent({Key? key, this.title, this.price, this.product})
      : super(key: key);

  final String? title;
  final String? price;
  final product;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null || price != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (title != null && price != null)
                    const SizedBox(
                      height: 2,
                    ),
                  if (price != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(price!, style: const TextStyle(color: Colors.red)),
                        IconButton(
                          icon: provider.isExist(product)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            provider.toggleFavorite(product);
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
