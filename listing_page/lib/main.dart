import 'package:flutter/material.dart';
import 'package:listing_page/provider/favorite_provider.dart';
import 'package:listing_page/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
