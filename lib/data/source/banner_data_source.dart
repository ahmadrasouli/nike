import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nike2/data/banner.dart';
import 'package:nike2/data/common/http_response_validator.dart';

abstract class IBannerDataSource {
  Future<List<BannerEntity>> getAll();
}

class BannerRemoteDataSource
    with HttpResponseValidator
    implements IBannerDataSource {
  final Dio httpClient;

  BannerRemoteDataSource(this.httpClient);
  @override
  Future<List<BannerEntity>> getAll() async {
    final response = await httpClient.get('banner/slider');
    validateResponse(response);
    final List<BannerEntity> banners = [];

    (response.data as List).forEach((jasonObject) {
      banners.add(BannerEntity.fromJason(jasonObject));
    });
    return banners;
  }
}
