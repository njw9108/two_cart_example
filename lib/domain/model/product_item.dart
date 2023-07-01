enum ProductType {
  normal,
  fresh,
}

class ProductItem {
  final String name;
  final int price;
  final ProductType type;

  ProductItem({
    required this.name,
    required this.price,
    required this.type,
  });
}
