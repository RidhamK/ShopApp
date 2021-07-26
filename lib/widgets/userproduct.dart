import 'package:flutter/material.dart';
import 'package:shopapp/screens/edit_product_screen.dart';

class UserProductWidget extends StatefulWidget {
  // const UserProductWidget({Key? key}) : super(key: key);
  String id;
  String imageUrl;
  String title;
  UserProductWidget(this.imageUrl, this.title, this.id);

  @override
  State<UserProductWidget> createState() => _UserProductWidgetState();
}

class _UserProductWidgetState extends State<UserProductWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.imageUrl),
      ),
      title: Text(widget.title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProduct.routeName);
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
