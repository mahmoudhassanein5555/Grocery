import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/home/presentation/widgets/product_card.dart';

import '../cubit/product_search_cubit.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchCubit, ProductSearchState>(
      builder: (context, state) {
        final cubit = context.read<ProductSearchCubit>();

        if (!cubit.hasSearch) return const SizedBox();

        if (state is ProductSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductSearchSuccess) {
          final products = state.productSearchEntity.products;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: ProductCard(meal: products[index]),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 4),
          );
        }

        if (state is ProductSearchError) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(state.message),
          );
        }

        return const SizedBox();
      },
    );
  }
}
