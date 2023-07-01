import '../../core/result/result.dart';
import '../model/product_item.dart';

abstract class ProductRepository {
  Future<Result> getProductItmes();
  Future<Result> addProductItem(ProductItem item);
  Future<Result> deleteProductItem(ProductItem item);
}
