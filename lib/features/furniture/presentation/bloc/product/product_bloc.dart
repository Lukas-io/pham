import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pham/features/furniture/presentation/bloc/product/product_event.dart';
import 'package:pham/features/furniture/presentation/bloc/product/product_state.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/use-case/get_product_items.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductItemsUseCase _getProductItemsUseCase;

  ProductBloc(
    this._getProductItemsUseCase,
  ) : super(const ProductLoading()) {
    on<GetProductItems>(onGetProductItems);
  }

  Future<void> onGetProductItems(
      GetProductItems event, Emitter<ProductState> emit) async {
    final dataState = await _getProductItemsUseCase();
    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(const ProductEmpty());
      } else {
        emit(ProductDone(dataState.data!));
      }
    } else if (dataState is DataException) {
      emit(ProductException(dataState.exception!));
    }
  }
}
