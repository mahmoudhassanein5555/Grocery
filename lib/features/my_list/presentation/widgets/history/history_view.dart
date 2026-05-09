import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/core/utils/app_toast.dart';
import 'package:grocery1/features/my_list/domain/entity/history_entity.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_state.dart';
import 'package:grocery1/features/my_list/presentation/widgets/history/history_card.dart';
import 'package:grocery1/features/product_details/presentation/view/product_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';
import 'package:grocery1/features/my_list/presentation/widgets/history/history_filtration.dart';
import 'package:grocery1/features/my_list/domain/entity/filter_model.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryCubit, HistoryState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          AppToast.showToast(
            context: context,
            title: "Success",
            description: "Item added to cart successfully!",
            type: ToastificationType.success,
          );
        } else if (state is AddToCartHistoryError) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.message,
            type: ToastificationType.warning,
          );
        }
      },
      buildWhen: (previous, current) {
        return current is HistoryLoading ||
            current is HistoryLoaded ||
            current is HistoryError;
      },
      builder: (context, state) {
        if (state is HistoryLoading || state is HistoryInitial) {
          return _buildLoadingState();
        } else if (state is HistoryLoaded) {
          return _buildLoadedState(context, state.historyItems);
        } else if (state is HistoryError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: Sizes.s60.sp,
                ),
                SizedBox(height: Insets.s16.h),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Sizes.s16.sp),
                ),
                SizedBox(height: Insets.s24.h),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<HistoryCubit>().fetchHistory();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text("Retry"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF034160),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoadingState() {
    final dummyData = List.generate(
      4,
      (index) => HistoryEntity(
        id: index,
        title: 'Loading Item',
        subtitle: 'Loading',
        rating: 4,
        ratingCount: 10,
        price: 100,
        originalPrice: 150,
        imageUrl: 'https://via.placeholder.com/150',
      ),
    );

    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        padding: EdgeInsets.all(Insets.s16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Insets.s16.w,
          mainAxisSpacing: Insets.s16.h,
          childAspectRatio: 0.65,
        ),
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return HistoryCard(entity: dummyData[index]);
        },
      ),
    );
  }

  Widget _buildLoadedState(
    BuildContext context,
    List<HistoryEntity> historyItems,
  ) {
    if (historyItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No History Found',
              style: TextStyle(
                fontSize: Sizes.s16.sp,
                color: ColorManager.black,
              ),
            ),
            SizedBox(height: Insets.s16.h),
            ElevatedButton.icon(
              onPressed: () {
                context.read<HistoryCubit>().fetchHistory();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.darkBlue,
                foregroundColor: ColorManager.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Sizes.s8.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.s24.w,
                  vertical: Insets.s12.h,
                ),
              ),
              icon: Icon(Icons.refresh, size: Sizes.s20.sp),
              label: Text(
                'Retry',
                style: TextStyle(
                  fontSize: Sizes.s14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Stack(
      children: [
        GridView.builder(
          padding: EdgeInsets.all(Insets.s16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: Insets.s16.w,
            mainAxisSpacing: Insets.s16.h,
            childAspectRatio: 0.65,
          ),
          itemCount: historyItems.length,
          itemBuilder: (context, index) {
            return HistoryCard(
              entity: historyItems[index],
              onFavoriteToggle: () {
                context.read<HistoryCubit>().addToCart(historyItems[index].id);
              },
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ProductDetailsScreen(productId: historyItems[index].id),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: Insets.s16.h,
          right: Insets.s16.w,
          child: FloatingActionButton(
            onPressed: () async {
              final result = await showModalBottomSheet<FilterModel>(
                context: context,
                isScrollControlled: true,
                backgroundColor: ColorManager.black,
                builder: (context) => const HistoryFilterBottomSheet(),
              );
              if (result != null && context.mounted) {
                context.read<HistoryCubit>().fetchHistory(filters: result);
              }
            },
            backgroundColor: Colors.white,
            elevation: 2,
            child: Icon(
              Icons.sort,
              color: ColorManager.darkBlue,
              size: Sizes.s28.sp,
            ),
          ),
        ),
      ],
    );
  }
}
