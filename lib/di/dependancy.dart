import 'package:two_cart_example/data/data_source/product_data_source/memory/product_data_source_memory.dart';
import 'package:two_cart_example/data/repository/product_repository_impl.dart';

final productDataSourceMemory = ProductDataSourceMemory();

final productRepository = ProductRepositoryImpl(
  productDataSource: productDataSourceMemory,
);
