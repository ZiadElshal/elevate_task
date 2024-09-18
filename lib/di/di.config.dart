// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i506;
import '../features/product_screen/data/data_sources/remote_data_source/remote_data_source.dart'
    as _i751;
import '../features/product_screen/data/data_sources/remote_data_source/remote_data_source_impl.dart'
    as _i779;
import '../features/product_screen/data/repositories/product_repository_impl.dart'
    as _i653;
import '../features/product_screen/domain/repositories/product_repository.dart'
    as _i799;
import '../features/product_screen/domain/use_cases/get_all_products_use_case.dart'
    as _i131;
import '../features/product_screen/presentation/cubit/product_screen_view_model.dart'
    as _i648;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i506.ApiManager>(() => _i506.ApiManager());
    gh.factory<_i751.ProductRemoteDataSource>(() =>
        _i779.ProductRemoteDataSourceImpl(apiManager: gh<_i506.ApiManager>()));
    gh.factory<_i799.ProductRepository>(() => _i653.ProductRepositoryImpl(
        productRemoteDataSource: gh<_i751.ProductRemoteDataSource>()));
    gh.factory<_i131.GetAllProductsUseCase>(() => _i131.GetAllProductsUseCase(
        productRepository: gh<_i799.ProductRepository>()));
    gh.factory<_i648.ProductScreenViewModel>(() => _i648.ProductScreenViewModel(
        getAllProductsUseCase: gh<_i131.GetAllProductsUseCase>()));
    return this;
  }
}
