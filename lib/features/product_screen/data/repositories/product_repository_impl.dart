import 'package:dartz/dartz.dart';
import 'package:e_commerce_elevate_task/features/product_screen/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:e_commerce_elevate_task/features/product_screen/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_elevate_task/core/errors/failures.dart';
import 'package:e_commerce_elevate_task/features/product_screen/domain/repositories/product_repository.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository{

  //to work need object from ProductRemoteDataSource (abstract)
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failures, List<ProductResponseEntity>>> getAllProducts() async{
    // TODO: implement getAllProducts
    var either = await productRemoteDataSource.getAllProducts();
    return either.fold(
            (error)=> left(error),
            (response)=> right(response)
    );
  }
}