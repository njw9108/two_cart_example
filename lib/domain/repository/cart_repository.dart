import 'package:two_cart_example/domain/model/product_item.dart';
import 'package:two_cart_example/domain/model/shopping_cart.dart';

import '../../../core/result/result.dart';

abstract class CartRepository {
  Future<Result> addCart(ProductItem item, ShoppingCart cart);
  Future<Result> removCart(ProductItem item, ShoppingCart cart);
}
