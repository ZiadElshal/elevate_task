import 'package:e_commerce_elevate_task/features/product_screen/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_elevate_task/core/errors/failures.dart';

abstract class ProductScreenStates{}
class ProductInitialState extends ProductScreenStates{}

class ProductLoadingState extends ProductScreenStates{}

class ProductErrorState extends ProductScreenStates{
  Failures failures;
  ProductErrorState({required this.failures});
}

class ProductSuccessState extends ProductScreenStates{
  List<ProductResponseEntity> productsList;
  ProductSuccessState({required this.productsList});
}
