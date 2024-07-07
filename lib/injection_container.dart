import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pham/features/furniture/domain/use-case/get_product_items.dart';

import 'features/furniture/data/repository/product_repository_impl.dart';
import 'features/furniture/data/sources/api/api_service.dart';
import 'features/furniture/domain/repository/product_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio
  sl.registerSingleton<Dio>(Dio());

  //dependencies
  sl.registerSingleton<ApiService>(ApiService(sl()));

  sl.registerSingleton(GetProductItemsUseCase());


  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));
}
