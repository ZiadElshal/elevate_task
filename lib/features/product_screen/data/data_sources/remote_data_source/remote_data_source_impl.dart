import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_elevate_task/core/api/api_manager.dart';
import 'package:e_commerce_elevate_task/features/product_screen/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:e_commerce_elevate_task/core/api/end_points.dart';
import 'package:e_commerce_elevate_task/features/product_screen/data/models/ProductResponseDto.dart';
import 'package:e_commerce_elevate_task/core/errors/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
  //will call Api so return ProductResponseDto

  ApiManager apiManager;
  ProductRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, List<ProductResponseDto>>> getAllProducts() async{
    // TODO: implement getAllProducts
    var checkNetworkResult = await Connectivity().checkConnectivity();
    if (checkNetworkResult.contains(ConnectivityResult.wifi) ||
        checkNetworkResult.contains(ConnectivityResult.mobile)){
      ///internet connection
      var response = await apiManager.getData(EndPoints.getAllProducts);

      ///success case
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        List productsJson = response.data ;
        var getAllProductsResponse = productsJson
            .map((json) => ProductResponseDto.fromJson(json))
            .toList();
        return right(getAllProductsResponse);
      }
      ///server error case
      else{
        return left(ServerError(errorMessage: "Server Error, Cannot Get Product"));
      }

    }else{
      ///no internet connection
      return left(NetworkError(errorMessage: "No Internet Connection"));
    }
  }

}