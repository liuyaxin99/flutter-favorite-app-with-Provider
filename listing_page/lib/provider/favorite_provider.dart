import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List _products = [];
  List get products => _products;

  void toggleFavorite(product) {
    final isExist = _products.contains(product);
    if (isExist) {
      _products.remove(product);
    } else {
      _products.add(product);
    }
    notifyListeners();
  }

  bool isExist(product) {
    final isExist = _products.contains(product);
    return isExist;
  }

  void clearFavorite() {
    _products = [];
    notifyListeners();
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
