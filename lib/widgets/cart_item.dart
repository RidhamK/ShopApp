import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';

class CartWidget extends StatelessWidget {
  // const CartWidget({Key? key}) : super(key: key);

  final String id;
  final String productId;
  final double price;
  final int qty;
  final String title;

  CartWidget(
    this.id,
    this.productId,
    this.price,
    this.qty,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(child: Text('\$${price}')),
            ),
          ),
          title: Text(title),
          subtitle: Text('${price * qty}'),
          trailing: Text('${qty}x'),
        ),
      ),
    );
  }
}