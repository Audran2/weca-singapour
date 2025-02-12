class BarcodeId {
  final String value;

  BarcodeId(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BarcodeId && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}