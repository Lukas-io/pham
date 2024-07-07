import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pham/core/constants/constants.dart';
import 'package:pham/core/resources/data_state.dart';
import 'package:pham/features/furniture/domain/entity/product_entity.dart';

import '../../domain/repository/product_repository.dart';
import '../sources/api/api_service.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiService _apiService;

  const ProductRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<ProductEntity>>> getProductItems() async {
    try {
      final httpResponse = await _apiService.getProductItems(
          kApiKey: kApikey, kAppId: kAppId, kOrganisationId: kOrganisationId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }
}
