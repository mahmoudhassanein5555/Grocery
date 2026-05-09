import 'package:flutter/material.dart';
import 'package:grocery1/features/home/presentation/widgets/product_card.dart';
import 'package:grocery1/features/product_details/presentation/view/product_details_screen.dart';

import '../cubit/product_search_cubit.dart';

class SearchResultsView extends StatelessWidget {
  final ProductSearchState searchState;

  const SearchResultsView({super.key, required this.searchState});

  @override
  Widget build(BuildContext context) {
    if (searchState is ProductSearchLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (searchState is ProductSearchError) {
      return Center(child: Text((searchState as ProductSearchError).message));
    }

    if (searchState is ProductSearchSuccess) {
      final products =
          (searchState as ProductSearchSuccess).productSearchEntity.products;

      if (products.isEmpty) {
        return const Center(child: Text("No products found"));
      }

      return GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCard(
            meal: products[index],
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        ProductDetailsScreen(productId: products[index].id)))),
      );
    }

    return const SizedBox();
  }
}
