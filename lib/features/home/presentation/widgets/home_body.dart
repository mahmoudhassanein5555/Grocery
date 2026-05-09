import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/home/presentation/widgets/search_results_view.dart';

import '../cubit/home_cubit.dart';
import '../cubit/product_search_cubit.dart';
import 'home_content_view.dart';
import 'home_header.dart';

class HomeBody extends StatelessWidget {
  final HomeSuccess state;

  const HomeBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: BlocBuilder<ProductSearchCubit, ProductSearchState>(
                builder: (context, searchState) {
                  final searchCubit = context.read<ProductSearchCubit>();

                  if (searchCubit.hasSearch) {
                    return SearchResultsView(searchState: searchState);
                  }

                  return HomeContentView(state: state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
