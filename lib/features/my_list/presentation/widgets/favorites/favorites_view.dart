import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/core/utils/app_toast.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_entity.dart';
import 'package:grocery1/features/my_list/presentation/view_model/favorites/favorites_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/favorites/favorites_state.dart';
import 'package:grocery1/features/my_list/presentation/widgets/favorites/favorite_card.dart';
import 'package:grocery1/features/product_details/presentation/view/product_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesCubit>().fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is RemoveFavoriteError) {
          AppToast.showToast(
            context: context,
            title: 'Error',
            description: state.message,
            type: ToastificationType.error,
          );
        } else if (state is RemoveFavoriteSuccess) {
          AppToast.showToast(
            context: context,
            title: 'Success',
            description: "Favorite removed successfully",
            type: ToastificationType.success,
          );
        } else if (state is AddToCartDone) {
          AppToast.showToast(
            context: context,
            title: "Success",
            description: "Item added to cart successfully",
            type: ToastificationType.success,
          );
        } else if (state is AddToCartFavoriteError) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.message,
            type: ToastificationType.warning,
          );
        }
      },
      buildWhen: (previous, current) {
        return current is! RemoveFavoriteSuccess;
      },
      builder: (context, state) {
        if (state is FavoritesLoading || state is FavoritesInitial) {
          return _buildLoadingState();
        } else if (state is FavoritesLoaded) {
          return _buildLoadedState(state.favorites);
        } else if (state is FavoritesError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoadingState() {
    final dummyData = List.generate(
      3,
      (index) => FavoriteEntity(
        id: index,
        title: 'Loading Product',
        price: 100,
        originalPrice: 150,
        imageUrl: 'https://via.placeholder.com/150',
      ),
    );

    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        padding: EdgeInsets.all(Sizes.s16.sp),
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            entity: dummyData[index],
            onRemove: () {
              context.read<FavoritesCubit>().removeFavorite(
                    dummyData[index].id,
                  );
            },
            addToCart: () {},
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ProductDetailsScreen(productId: dummyData[index].id),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadedState(List<FavoriteEntity> favorites) {
    if (favorites.isEmpty) {
      return Center(
        child: Text(
          'No Favorites Found',
          style: TextStyle(fontSize: Sizes.s16.sp),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          entity: favorites[index],
          onRemove: () {
            context.read<FavoritesCubit>().removeFavorite(favorites[index].id);
          },
          addToCart: () {
            context.read<FavoritesCubit>().addToCart(favorites[index].id);
          },
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  ProductDetailsScreen(productId: favorites[index].id),
            ),
          ),
        );
      },
    );
  }
}
