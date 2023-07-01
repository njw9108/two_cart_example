import 'package:two_cart_example/domain/model/product_item.dart';
import 'package:two_cart_example/core/result/result.dart';
import 'package:two_cart_example/domain/repository/product_repository.dart';

import '../data_source/product_data_source/product_data_source.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({
    required this.productDataSource,
  });
  @override
  Future<Result> getProductItmes() async {
    return await getProductItmes();
  }

  @override
  Future<Result> addProductItem(ProductItem item) async {
    return await productDataSource.addProductItem(item);
  }

  @override
  Future<Result> deleteProductItem(ProductItem item) async {
    return await productDataSource.deleteProductItem(item);
  }
}
