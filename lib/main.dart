import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:grocery1/features/cart/presentation/screens/checkoutscreen.dart';
import 'package:grocery1/features/cart/presentation/screens/paymentview.dart';
import 'package:grocery1/features/delivery_addresses/data/repo/delivery_addresses_repo_impl.dart';
import 'package:grocery1/features/delivery_addresses/presentation/cubit/delivery_addresses_cubit.dart';

import 'package:grocery1/main_app.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/utils/my_bloc_observer.dart';

import 'package:grocery1/features/home/presentation/screens/testscreen.dart';
import 'package:grocery1/features/subcategories/presentation/sub_categories_screen.dart';
import 'package:grocery1/features/login/presentation/screens/login_screen.dart';
import 'SplashView.dart';

// product details
import 'package:grocery1/features/product_details/presentation/view/product_details_screen.dart';
import 'package:grocery1/features/product_details/presentation/view_model/product_details_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }

  Bloc.observer = MyBlocObserver();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => minacartcubit()..fetchcart(),
            ),
            BlocProvider(
          //    child: Checkoutscreen(),
                create: (context) => DeliveryAddressesCubit(
                      repo: DeliveryAddressesRepoImpl(apiManger: ApiManager()),
                    )..getAddresses()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grocery App',
            theme: ThemeData(
              useMaterial3: true,
            ),

            /// أول شاشة
            home: const SplashView(),

            /// Routes
            routes: {
              Paymentscreen.routeName: (context) => Paymentscreen(),
              Checkoutscreen.routeName: (context) => Checkoutscreen(),
              SubCategoriesScreen.routeName: (context) => SubCategoriesScreen(),

              testscreen.routeName: (context) => testscreen(),

              LoginScreen.routeName: (context) => const LoginScreen(),

              SplashView.routeName: (context) => const SplashView(),

              // /// ضيفنا product details هنا
              // ProductDetailsScreen.routeName: (context) => BlocProvider(
              //       create: (context) =>
              //           getIt<ProductDetailsCubit>()..getProductDetails(3),
              //       child: const ProductDetailsScreen(),
              //     ),
            },
          ),
        );
      },
    );
  }
}
