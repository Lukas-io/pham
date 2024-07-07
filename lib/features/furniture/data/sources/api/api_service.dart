import 'package:dio/dio.dart';
import 'package:pham/features/furniture/data/model/product_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: kBaseApiUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/products')
  Future<HttpResponse<List<ProductModel>>> getProductItems({
    @Query("Apikey") required String kApiKey,
    @Query("Appid") required String kAppId,
    @Query("organisation_id") required String kOrganisationId,
  });
}
