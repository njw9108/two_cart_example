import '../../../core/result/result.dart';
import '../../../domain/model/product_item.dart';

abstract class ProductDataSource {
  Future<Result> getProductItmes();
  Future<Result> addProductItem(ProductItem item);
  Future<Result> deleteProductItem(ProductItem item);
}
