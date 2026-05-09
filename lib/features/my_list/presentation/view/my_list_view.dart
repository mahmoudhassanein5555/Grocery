import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';
import 'package:grocery1/features/my_list/presentation/view_model/favorites/favorites_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/smart_list/smart_lists_cubit.dart';
import 'package:grocery1/features/my_list/presentation/widgets/favorites/favorites_view.dart';
import 'package:grocery1/features/my_list/presentation/widgets/history/history_view.dart';
import 'package:grocery1/features/my_list/presentation/widgets/smart_list/smart_lists_view.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView>
    with SingleTickerProviderStateMixin {
// print('token: $token');
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SmartListsCubit>(
          create: (context) => getIt<SmartListsCubit>()..fetchSmartLists(),
        ),
        BlocProvider<FavoritesCubit>(
          create: (context) => getIt<FavoritesCubit>()..fetchFavorites(),
        ),
        BlocProvider<HistoryCubit>(
          create: (context) => getIt<HistoryCubit>()..fetchHistory(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'My List',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF003C5A),
            unselectedLabelColor: Colors.grey.shade400,
            indicatorColor: const Color(0xFF003C5A),
            labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            tabs: const [
              Tab(text: 'Smart Lists'),
              Tab(text: 'Favorites'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SmartListsView(),
            FavoritesView(),
            HistoryView(),
          ],
        ),
      ),
    );
  }
}
