import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/font_manager.dart';
import 'package:grocery1/core/resources/string_constants.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/core/utils/app_toast.dart';
import 'package:grocery1/features/cart/presentation/screens/showdrawe.dart';
import 'package:grocery1/features/product_details/presentation/view_model/product_details_cubit.dart';
import 'package:grocery1/features/product_details/presentation/view_model/product_details_state.dart';
import 'package:grocery1/features/product_details/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:grocery1/features/product_details/presentation/widgets/detail_card_widget.dart';
import 'package:grocery1/features/product_details/presentation/widgets/helpers/format_how_to_use.dart';
import 'package:grocery1/features/product_details/presentation/widgets/helpers/get_formatted_expiry.dart';
import 'package:grocery1/features/product_details/presentation/widgets/product_details_skeletonizer_widget.dart';
import 'package:grocery1/features/home/presentation/screens/search_screen.dart';
import 'package:toastification/toastification.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final ProductDetailsCubit _productDetailsCubit;
  int quantity = 1;
  bool isFavorite = false;
  int? currentProductId;

  @override
  void initState() {
    super.initState();
    _productDetailsCubit = getIt<ProductDetailsCubit>()
      ..getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productDetailsCubit,
      child: Scaffold(
        endDrawer: Showdrawer(),
        backgroundColor: ColorManager.pureWhite,
        appBar: AppBar(
          backgroundColor: ColorManager.pureWhite,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorManager.black,
              size: Sizes.s20.sp,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            StringConstants.productDetailsTitle,
            style: getMediumStyle(
              color: ColorManager.black,
              fontSize: Sizes.s18.sp,
              fontFamily: FontConstants.interFontFamily,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: ColorManager.black,
                size: Sizes.s28.sp,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SearchScreen(),
                  ),
                );
              },
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.shopping_cart_outlined,
            //     color: ColorManager.black,
            //     size: Sizes.s28.sp,
            //   ),
            //   onPressed: () {},
            // ),
            SizedBox(width: Insets.s16.w),
          ],
        ),
        body: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
          listener: (context, state) {
            if (state is ProductDetailsErrorState) {
              AppToast.showToast(
                context: context,
                title: StringConstants.errorTitle,
                description: state.errorMessage,
                type: ToastificationType.error,
              );
            } else if (state is ProductDetailsToggleFavoriteSuccessState) {
              if (state.response.data.mealId == currentProductId) {
                setState(() {
                  isFavorite = state.response.data.isFavorited;
                });
              }
            } else if (state is ProductDetailsToggleFavoriteErrorState) {
              AppToast.showToast(
                context: context,
                title: StringConstants.errorTitle,
                description: state.errorMessage,
                type: ToastificationType.error,
              );
              setState(() {
                isFavorite = !isFavorite;
              });
            } else if (state is ProductDetailsAddToCartSuccessState) {
              AppToast.showToast(
                context: context,
                title: "Success",
                description: state.response.message.isNotEmpty
                    ? state.response.message
                    : 'Item added to cart successfully',
                type: ToastificationType.success,
              );
            } else if (state is ProductDetailsAddToCartErrorState) {
              AppToast.showToast(
                context: context,
                title: StringConstants.errorTitle,
                description: state.errorMessage,
                type: ToastificationType.error,
              );
            } else if (state is! ProductDetailsLoadingState &&
                state is! ProductDetailsInitialState &&
                state is! ProductDetailsSuccessState) {
              AppToast.showToast(
                context: context,
                title: StringConstants.errorTitle,
                description: 'Unexpected state encountered.',
                type: ToastificationType.error,
              );
            }
          },
          buildWhen: (previous, current) {
            return current is! ProductDetailsToggleFavoriteSuccessState &&
                current is! ProductDetailsToggleFavoriteErrorState &&
                current is! ProductDetailsAddToCartSuccessState &&
                current is! ProductDetailsAddToCartErrorState;
          },
          builder: (context, state) {
            if (state is ProductDetailsInitialState ||
                state is ProductDetailsLoadingState) {
              return const ProductDetailsSkeletonizerWidget();
            } else if (state is ProductDetailsSuccessState) {
              var item = state.productDetailsResponseEntity.data;
              // Initialize local state once
              if (currentProductId != item.id) {
                currentProductId = item.id;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      isFavorite = item.isFavorite;
                    });
                  }
                });
              }
              return SingleChildScrollView(
                padding: EdgeInsets.all(Insets.s16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Sizes.s240.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.s16.r),
                            image: DecorationImage(
                              image: NetworkImage(item.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: Insets.s12.h,
                          right: Insets.s12.w,
                          child: CircleAvatar(
                            backgroundColor: ColorManager.white,
                            radius: Sizes.s20.r,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite
                                    ? Colors.red
                                    : ColorManager.textGrey,
                                size: Sizes.s20.sp,
                              ),
                              onPressed: () {
                                if (currentProductId != null) {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                  context
                                      .read<ProductDetailsCubit>()
                                      .toggleFavorite(currentProductId!);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Insets.s20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: getBoldStyle(
                              color: ColorManager.black,
                              fontSize: Sizes.s24.sp,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '£${item.finalPrice}',
                              style: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: Sizes.s22.sp,
                              ),
                            ),
                            SizedBox(width: Insets.s8.w),
                            Text(
                              '£${item.price}',
                              style: TextStyle(
                                fontSize: Sizes.s16.sp,
                                color: ColorManager.textGrey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Insets.s8.h),
                    Row(
                      children: [
                        ...List.generate(5, (index) {
                          if (item.rating >= index + 1) {
                            return Icon(
                              Icons.star,
                              color: ColorManager.ratingGold,
                              size: Sizes.s20.sp,
                            );
                          } else if (item.rating > index) {
                            return Icon(
                              Icons.star_half,
                              color: ColorManager.ratingGold,
                              size: Sizes.s20.sp,
                            );
                          } else {
                            return Icon(
                              Icons.star,
                              color: ColorManager.lightGrey,
                              size: Sizes.s20.sp,
                            );
                          }
                        }),
                        SizedBox(width: Insets.s8.w),
                        Text(
                          '(${item.rating})',
                          style: getMediumStyle(
                            color: ColorManager.textGrey,
                            fontSize: Sizes.s14.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Insets.s24.h),
                    Text(
                      'Details',
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: Sizes.s18.sp,
                      ),
                    ),
                    SizedBox(height: Insets.s12.h),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: DetailCardWidget(
                              title: StringConstants.includesTitle,
                              value: item.includes,
                            ),
                          ),
                          SizedBox(width: Insets.s12.w),
                          Expanded(
                            child: DetailCardWidget(
                              title: StringConstants.sizeTitle,
                              value: item.size,
                            ),
                          ),
                          SizedBox(width: Insets.s12.w),
                          Expanded(
                            child: DetailCardWidget(
                              title: StringConstants.expiryTitle,
                              value: getFormattedExpiry(item.expiryDate),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Insets.s24.h),
                    Text(
                      StringConstants.descriptionTitle,
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: Sizes.s18.sp,
                      ),
                    ),
                    SizedBox(height: Insets.s8.h),
                    Text(
                      item.description,
                      style: getRegularStyle(
                        color: ColorManager.textGrey,
                        fontSize: Sizes.s15.sp,
                      ),
                    ),
                    SizedBox(height: Insets.s24.h),
                    Text(
                      StringConstants.howToUseTitle,
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: Sizes.s18.sp,
                      ),
                    ),
                    SizedBox(height: Insets.s8.h),
                    Text(
                      formatHowToUse(item.howToUse),
                      style: TextStyle(
                        fontSize: Sizes.s15.sp,
                        color: ColorManager.textGrey,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: Insets.s100.h),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: Sizes.s80.sp,
                      color: ColorManager.lightGrey,
                    ),
                    SizedBox(height: Insets.s16.h),
                    Text(
                      StringConstants.somethingWentWrong,
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: Sizes.s18.sp,
                      ),
                    ),
                    SizedBox(height: Insets.s8.h),
                    Text(
                      StringConstants.pleaseTryAgainLater,
                      style: getRegularStyle(
                        color: ColorManager.textGrey,
                        fontSize: Sizes.s14.sp,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          quantity: quantity,
          mealId: currentProductId,
        ),
      ),
    );
  }
}
