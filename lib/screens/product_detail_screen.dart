import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // const ProductDetailScreen({Key? key}) : super(key: key);
  // final String title;
  // ProductDetailScreen(this.title);
  static const routeName = 'product-detailpge';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProducts = Provider.of<Products>(context).findBYId(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
      body: null,
    );
  }
}
