import 'package:flutter/material.dart';
import 'package:listing_page/provider/favorite_provider.dart';
import 'package:listing_page/screens/product_card.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final products = provider.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            width: MediaQuery.of(context).size.width,
            heightImage: 100,
            image: Image.network(product["thumbnail"]),
            title: product["title"],
            price: product["price"].toString(),
            product: product,
          );
        },
      ),
    );
  }
}
