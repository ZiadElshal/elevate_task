import 'package:dartz/dartz.dart';
import 'package:e_commerce_elevate_task/features/product_screen/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_elevate_task/core/errors/failures.dart';
import 'package:e_commerce_elevate_task/features/product_screen/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
//class has get all Products
class GetAllProductsUseCase{

  //use case to work need a repository object
  ProductRepository productRepository;
  GetAllProductsUseCase({required this.productRepository});

  ///func to get all Products
  Future<Either<Failures, List<ProductResponseEntity>>>invoke(){
    return productRepository.getAllProducts();
  }
}