import 'package:e_commerce_elevate_task/core/utils/color_manager.dart';
import 'package:e_commerce_elevate_task/di/di.dart';
import 'package:e_commerce_elevate_task/features/product_screen/presentation/cubit/product_screen_states.dart';
import 'package:e_commerce_elevate_task/features/product_screen/presentation/cubit/product_screen_view_model.dart';
import 'package:e_commerce_elevate_task/features/product_screen/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "product_screen";
  ProductScreen({super.key});

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductScreenViewModel viewModel = getIt<ProductScreenViewModel>();

    return
        Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ProductScreenViewModel, ProductScreenStates>(
          bloc: viewModel..getAllProducts(),
          builder: (context, state) {
            if (state is ProductSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.productsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 15,
                    childAspectRatio: 7 / 9,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: ProductItem(
                        productResponseEntity: state.productsList[index],
                      ),
                    );
                  },
                ),
              );
            } else if (state is ProductErrorState) {
              return Text(state.failures.errorMessage);

            } else {
              return
                Center(child: CircularProgressIndicator(color: ColorManager.primary,));
            }
          },
        ),
      );
  }
}
