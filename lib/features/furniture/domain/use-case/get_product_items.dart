import 'package:pham/features/furniture/domain/entity/product_entity.dart';
import 'package:pham/features/furniture/domain/repository/product_repository.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/use_case/use_case.dart';

class GetProductItemsUseCase
    implements UseCase<DataState<List<ProductEntity>>, void> {
  final ProductRepository _productRepository;

  const GetProductItemsUseCase(this._productRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getProductItems();
  }
}
