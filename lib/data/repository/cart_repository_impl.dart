import 'package:two_cart_example/domain/model/shopping_cart.dart';
import 'package:two_cart_example/domain/model/product_item.dart';
import 'package:two_cart_example/core/result/result.dart';
import 'package:two_cart_example/domain/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  @override
  Future<Result> addCart(ProductItem item, ShoppingCart cart) async {
    cart.items.add(item);
    return const ResultSucess<bool>(resultValue: true);
  }

  @override
  Future<Result> removCart(ProductItem item, ShoppingCart cart) async {
    for (var element in cart.items) {
      if (element.name == item.name) {
        cart.items.remove(element);
        return const ResultSucess<bool>(resultValue: true);
      }
    }

    return ResultError(message: '${item.name} 상품이 없습니다.');
  }
}
