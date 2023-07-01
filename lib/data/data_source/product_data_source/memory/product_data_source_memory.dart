import 'package:two_cart_example/domain/model/product_item.dart';

import '../../../../core/result/result.dart';
import '../product_data_source.dart';

class ProductDataSourceMemory extends ProductDataSource {
  @override
  Future<Result> getProductItmes() async {
    return ResultSucess<List<ProductItem>>(
      resultValue: sampleItems,
    );
  }

  @override
  Future<Result> addProductItem(ProductItem item) async {
    sampleItems.add(item);
    return const ResultSucess<bool>(resultValue: true);
  }

  @override
  Future<Result> deleteProductItem(ProductItem item) async {
    for (var element in sampleItems) {
      if (element.name == item.name) {
        sampleItems.remove(element);
        return const ResultSucess<bool>(resultValue: true);
      }
    }

    return ResultError(message: '${item.name} 상품이 없습니다.');
  }
}

List<ProductItem> sampleItems = [
  ProductItem(
    name: '상품1',
    price: 500,
    type: ProductType.normal,
  ),
  ProductItem(
    name: '상품2',
    price: 1000,
    type: ProductType.normal,
  ),
  ProductItem(
    name: '상품3',
    price: 4500,
    type: ProductType.fresh,
  ),
  ProductItem(
    name: '상품4',
    price: 5500,
    type: ProductType.normal,
  ),
  ProductItem(
    name: '상품5',
    price: 3000,
    type: ProductType.fresh,
  ),
  ProductItem(
    name: '상품6',
    price: 6600,
    type: ProductType.normal,
  ),
];
