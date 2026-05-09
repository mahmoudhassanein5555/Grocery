import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/my_list/domain/entity/favorite_entity.dart';

class FavoriteCard extends StatelessWidget {
  final FavoriteEntity entity;
  final VoidCallback onRemove;
  final VoidCallback addToCart;
  final VoidCallback? onTap;

  const FavoriteCard({
    super.key,
    required this.entity,
    required this.onRemove,
    required this.addToCart,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: Insets.s16.h),
        padding: EdgeInsets.all(Insets.s16.w),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(Sizes.s12.r),
          border: Border.all(color: ColorManager.lightGrey),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.s8.r),
                  child: CachedNetworkImage(
                    imageUrl: entity.imageUrl,
                    width: Sizes.s80.w,
                    height: Sizes.s80.w,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Container(
                      color: ColorManager.lightGrey,
                      width: Sizes.s80.w,
                      height: Sizes.s80.w,
                    ),
                  ),
                ),
                Positioned(
                  top: Insets.s5.h,
                  left: Insets.s5.w,
                  child: InkWell(
                    onTap: onRemove,
                    child: CircleAvatar(
                      radius: Sizes.s12.r,
                      backgroundColor: ColorManager.white,
                      child: Icon(
                        Icons.favorite,
                        color: ColorManager.error,
                        size: Sizes.s16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: Insets.s16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.title,
                    style: TextStyle(
                      fontSize: Sizes.s16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.black,
                    ),
                  ),
                  SizedBox(height: Insets.s8.h),
                  Row(
                    children: [
                      Text(
                        '£${entity.price.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: Sizes.s16.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.darkBlue,
                        ),
                      ),
                      SizedBox(width: Insets.s8.w),
                      Text(
                        '£${entity.originalPrice.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: Sizes.s14.sp,
                          color: ColorManager.textGrey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Insets.s12.h),
                  SizedBox(
                    height: Sizes.s36.h,
                    child: ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.s8.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: Insets.s24.w),
                      ),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: Sizes.s14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
