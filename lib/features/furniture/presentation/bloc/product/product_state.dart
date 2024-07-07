import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/product_model.dart';
import '../../../domain/entity/product_entity.dart';

abstract class ProductState extends Equatable {
  final DioException? exception;
  final List<ProductEntity>? products;

  const ProductState({this.exception, this.products});

  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductException extends ProductState {
  const ProductException(DioException? exception) : super(exception: exception);
}

class ProductEmpty extends ProductState {
  const ProductEmpty();
}

class ProductDone extends ProductState {
  const ProductDone(List<ProductEntity>? products) : super(products: products);
}
