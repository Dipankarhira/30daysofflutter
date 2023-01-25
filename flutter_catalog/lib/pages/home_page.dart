// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/model/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              ?
              // ListView.builder(
              //     itemCount: CatalogModel.items!.length,
              //     itemBuilder: (context, index) {
              //       return ItemWidget(
              //         item: CatalogModel.items![index],
              //       );
              //     },
              //   )

              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: CatalogModel.items!.length,
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items![index];
                    return Card(
                      shadowColor: Colors.deepPurple,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridTile(
                          header: Text(item.name),
                          footer: Text("\$${item.price.toString()}"),
                          child: Image.network(item.image),
                        ),
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(color: Colors.deepPurple),
                )),
      drawer: MyDrawer(),
    );
  }
}
