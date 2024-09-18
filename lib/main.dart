import 'package:e_commerce_elevate_task/config/generate_routes.dart';
import 'package:e_commerce_elevate_task/config/routes.dart';
import 'package:e_commerce_elevate_task/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/my_block_observer.dart';
import 'features/product_screen/presentation/cubit/product_screen_view_model.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  runApp(BlocProvider(
      create: (context) => getIt<ProductScreenViewModel>(),
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesApp.productScreenRoute,
            routes: RoutesGenerate.routes
        );
      },
    );
  }
}
