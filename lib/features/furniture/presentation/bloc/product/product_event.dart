import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetProductItems extends ProductEvent {
  const GetProductItems();
}
