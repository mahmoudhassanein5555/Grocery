import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/core/utils/app_toast.dart';
import 'package:grocery1/features/my_list/domain/entity/smart_list_entity.dart';
import 'package:grocery1/features/my_list/presentation/view_model/smart_list/smart_lists_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/smart_list/smart_lists_state.dart';
import 'package:grocery1/features/my_list/presentation/widgets/smart_list/smart_list_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class SmartListsView extends StatelessWidget {
  const SmartListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SmartListsCubit, SmartListsState>(
      listener: (context, state) {
        if (state is DeleteSmartListSuccess) {
          AppToast.showToast(
            context: context,
            title: 'Success',
            description: "Smart List deleted successfully",
            type: ToastificationType.success,
          );
        } else if (state is DeleteSmartListError) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.message,
            type: ToastificationType.error,
          );
        } else if (state is AddAllToCartError) {
          AppToast.showToast(
            context: context,
            title: 'Error',
            description: state.message,
            type: ToastificationType.error,
          );
        } else if (state is AddAllToCartSuccess) {
          AppToast.showToast(
            context: context,
            title: "Success",
            description: "All items added to cart successfully!",
            type: ToastificationType.success,
          );
        }
      },
      buildWhen: (previous, current) {
        return current is! DeleteSmartListSuccess;
      },
      builder: (context, state) {
        if (state is SmartListsLoading || state is SmartListsInitial) {
          return _buildLoadingState();
        } else if (state is SmartListsLoaded) {
          return _buildLoadedState(state.smartLists, () {
            context.read<SmartListsCubit>().fetchSmartLists();
          });
        } else if (state is SmartListsError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(
                fontSize: Sizes.s16.sp,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoadingState() {
    final dummyData = List.generate(
      3,
      (index) => SmartListEntity(
        id: index,
        title: 'Loading Title',
        itemCount: 10,
        updatedAt: '2 days ago',
        imageUrl: 'https://via.placeholder.com/150',
      ),
    );

    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        padding: EdgeInsets.all(Insets.s16.w),
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return SmartListCard(
            entity: dummyData[index],
            onDelete: () {
              context.read<SmartListsCubit>().deleteSmartList(
                    dummyData[index].id,
                  );
            },
            onAddAllToCart: () {
              context.read<SmartListsCubit>().addAllToCart(dummyData[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildLoadedState(
    List<SmartListEntity> smartLists,
    VoidCallback refresh,
  ) {
    if (smartLists.isEmpty) {
      return Stack(
        children: [
          Center(
            child: Text(
              'No Smart Lists Found',
              style: TextStyle(fontSize: Sizes.s16.sp),
            ),
          ),
          Positioned(
            bottom: Insets.s16.h,
            right: Insets.s16.w,
            child: FloatingActionButton(
              onPressed: () {
                //*Here The Add Button */*********************************************** */
              },
              backgroundColor: ColorManager.white,
              elevation: 0,
              child: Icon(
                Icons.add,
                color: ColorManager.darkBlue,
                size: Sizes.s28.sp,
              ),
            ),
          ),
        ],
      );
    }
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.all(Insets.s16.w),
          itemCount: smartLists.length,
          itemBuilder: (context, index) {
            return SmartListCard(
              entity: smartLists[index],
              onDelete: () {
                context.read<SmartListsCubit>().deleteSmartList(
                      smartLists[index].id,
                    );
              },
              onAddAllToCart: () {
                context.read<SmartListsCubit>().addAllToCart(smartLists[index]);
              },
            );
          },
        ),
        Positioned(
          bottom: Insets.s16.h,
          right: Insets.s16.w,
          child: FloatingActionButton(
            onPressed: () {
              //*Here The Add Button */*********************************************** */
            },
            backgroundColor: ColorManager.white,
            elevation: 0,
            child: Icon(
              Icons.add,
              color: ColorManager.darkBlue,
              size: Sizes.s28.sp,
            ),
          ),
        ),
      ],
    );
  }
}
