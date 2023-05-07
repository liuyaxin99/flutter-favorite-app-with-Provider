import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listing_page/screens/favorite.dart';
import 'package:listing_page/screens/product_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listing Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Listing Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _products = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = await json.decode(response);
    setState(() {
      _products = data["products"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _products.isNotEmpty
              ? Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        width: MediaQuery.of(context).size.width / 2,
                        heightImage: 100,
                        image: Image.network(_products[index]["thumbnail"]),
                        title: _products[index]["title"],
                        price: _products[index]["price"].toString(),
                        product: _products[index],
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => const FavoritePage(),
          );
          Navigator.push(context, route);
        },
        label: const Text('Favorites'),
      ),
    );
  }
}
