class Item {
  final String name;
  final String? description;

  Item({required this.name, this.description});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      description: json['description'],
    );
  }
}