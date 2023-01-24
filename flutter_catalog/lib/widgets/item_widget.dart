import 'package:flutter/material.dart';
import 'package:flutter_catalog/model/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Items item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepPurple,
      
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$ ${item.price}",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}