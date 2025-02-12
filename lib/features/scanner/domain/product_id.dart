class ProductId {
  final String value;

  ProductId(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductId && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}