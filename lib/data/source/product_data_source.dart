import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nike2/common/exceptions.dart';
import 'package:nike2/data/common/http_response_validator.dart';

import '../product.dart';

abstract class IproductDataSource {
  Future<List<productEntity>> getAll(int sort);
  Future<List<productEntity>> search(int searchTerm);
}

class ProductRemoteDataSource
    with HttpResponseValidator
    implements IproductDataSource {
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);
  @override
  Future<List<productEntity>> getAll(int sort) async {
    final response = await httpClient.get('product/list?sort=$sort');
    validateResponse(response);
    final List<productEntity> products = [];
    (response.data as List).forEach((element) {
      products.add(productEntity.fromJson(element));
    });
    return products;
  }

  @override
  Future<List<productEntity>> search(int searchTerm) async {
    final response = await httpClient.get('product/list?search?q=$searchTerm');
    validateResponse(response);
    final List<productEntity> products = [];
    (response.data as List).forEach((element) {
      products.add(productEntity.fromJson(element));
    });
    return products;
  }
}
