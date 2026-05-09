import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:grocery1/features/home/presentation/cubit/cart_cubit.dart';
import 'package:grocery1/features/home/presentation/screens/home_screen.dart';
import 'package:grocery1/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:grocery1/features/my_list/presentation/view/my_list_view.dart';
import 'package:grocery1/features/my_list/presentation/view_model/favorites/favorites_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/smart_list/smart_lists_cubit.dart';
import 'package:grocery1/features/profile/presentation/views/profile_view.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyListView(),
    Center(child: Text("Profile")),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      
        BlocProvider(
          create: (context) => getIt<SmartListsCubit>()..fetchSmartLists(),
        ),
        BlocProvider(
          create: (context) => getIt<FavoritesCubit>()..fetchFavorites(),
        ),
        BlocProvider(
          create: (context) => getIt<HistoryCubit>()..fetchHistory(),
        ),
        BlocProvider(
          create: (context) => getIt<CartCubit>(),
        ),
      ],
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: HomeBottomNav(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
