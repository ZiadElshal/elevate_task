import 'package:dartz/dartz.dart';
import 'package:e_commerce_elevate_task/features/product_screen/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_elevate_task/core/errors/failures.dart';

abstract class ProductRepository{
  Future<Either<Failures, List<ProductResponseEntity>>>getAllProducts();}