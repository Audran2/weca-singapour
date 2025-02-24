class FavoriteProduct {
  final String id;
  final String image;
  final String name;
  final String brand;
  final String barcode;

  FavoriteProduct({
    required this.id,
    required this.image,
    required this.name,
    required this.brand,
    required this.barcode,
  });

  String getBrand() {
    if (brand.length > 15) return "${brand.substring(0, 12)}...";

    return brand;
  }

  String getName() {
    if (name.length > 15) return "${name.substring(0, 12)}...";

    return name;
  }
}