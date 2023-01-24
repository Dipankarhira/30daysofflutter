class Items {
  final num id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Items(
      {required this.id,
      required this.name,
      required this.desc,
      required this.color,
      required this.image,
      required this.price});

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        color: map["color"],
        image: map["image"],
        price: map["price"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "color": color,
        "image": image,
        "price": price,
      };
}

class CatalogModel {
  static  List<Items>? items;
}
