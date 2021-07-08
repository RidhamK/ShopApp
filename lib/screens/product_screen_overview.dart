import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';

import 'package:shopapp/provider/provider.dart';

class ProductOverview extends StatelessWidget {
  // const ProductOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: productGrid(),
    );
  }
}
