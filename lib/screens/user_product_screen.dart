import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/provider/products.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/userproduct.dart';

import 'edit_product_screen.dart';

class UserProduct extends StatelessWidget {
  const UserProduct({Key? key}) : super(key: key);
  static const routeName = 'user-Product';
  Future _refresh(BuildContext context) async {
    Provider.of<Products>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(EditProduct.routeName),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refresh(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: productData.item.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductWidget(
                  productData.item[i].id.toString(),
                  productData.item[i].imageUrl,
                  productData.item[i].title,
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
