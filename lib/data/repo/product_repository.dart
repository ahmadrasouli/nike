import 'package:nike2/common/http_client.dart';
import 'package:nike2/data/product.dart';
import 'package:nike2/data/source/product_data_source.dart';

final productRepository =
    ProductRepository(ProductRemoteDataSource(httpClient));

abstract class IProductRepository {
  Future<List<productEntity>> getAll(int sort);
  Future<List<productEntity>> search(int searchTerm);
}

class ProductRepository implements IProductRepository {
  final IproductDataSource dataSource;

  ProductRepository(this.dataSource);
  @override
  Future<List<productEntity>> getAll(int sort) => dataSource.getAll(sort);

  @override
  Future<List<productEntity>> search(int searchTerm) =>
      dataSource.search(searchTerm);
}
