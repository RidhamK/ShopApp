import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/products.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/userproduct.dart';

import 'edit_product_screen.dart';

class UserProduct extends StatelessWidget {
  const UserProduct({Key? key}) : super(key: key);
  static const routeName = 'user-Product';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            // onPressed: null,
            onPressed: () =>
                Navigator.of(context).pushNamed(EditProduct.routeName),
            icon: Icon(Icons.add),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: productData.item.length,
        itemBuilder: (_, i) => Column(
          children: [
            UserProductWidget(
              productData.item[i].id,
              productData.item[i].imageUrl,
              productData.item[i].title,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
