import 'package:e_commerce_elevate_task/features/product_screen/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_elevate_task/features/product_screen/presentation/cubit/product_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductScreenStates>{
  GetAllProductsUseCase getAllProductsUseCase;
  ProductScreenViewModel({required this.getAllProductsUseCase})
      :super(ProductInitialState());

  //todo: hold data - handle logic

  static ProductScreenViewModel get(context) => BlocProvider.of(context);

  ///to get all products
  Future<void> getAllProducts()async{
    emit(ProductLoadingState());
    var either =await getAllProductsUseCase.invoke();
    either.fold(
            (failures){
          emit(ProductErrorState(failures: failures));
        },
            (response){
          emit(ProductSuccessState(productsList: response));
        }
    );
  }
}