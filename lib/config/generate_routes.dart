import 'package:e_commerce_elevate_task/config/routes.dart';
import 'package:e_commerce_elevate_task/features/product_screen/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerate{
  static Map<String, Widget Function(BuildContext)> routes={
    RoutesApp.productScreenRoute : (context) => ProductScreen(),
  };
}