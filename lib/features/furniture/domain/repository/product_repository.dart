import 'package:pham/features/furniture/domain/entity/product_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProductItems();
}
