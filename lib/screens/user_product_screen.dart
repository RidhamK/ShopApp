import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/provider/products.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/userproduct.dart';

import 'edit_product_screen.dart';

class UserProduct extends StatelessWidget {
  const UserProduct({Key? key}) : super(key: key);
  static const routeName = 'user-Product';
  Future<void> _refresh(BuildContext context) async {
    try {
      Provider.of<Products>(context, listen: false).fetchData(true);
    } catch (e) {
      print('e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final productData = Provider.of<Products>(context);

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
      body: FutureBuilder(
        future: _refresh(context),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refresh(context),
                    child: Consumer<Products>(
                      builder: (context, productData, _) => Padding(
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
                  ),
      ),
    );
  }
}
