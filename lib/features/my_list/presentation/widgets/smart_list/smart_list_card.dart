import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/my_list/domain/entity/smart_list_entity.dart';

class SmartListCard extends StatelessWidget {
  final SmartListEntity entity;
  final VoidCallback onDelete;
  final VoidCallback onAddAllToCart;

  const SmartListCard({
    super.key,
    required this.entity,
    required this.onDelete,
    required this.onAddAllToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Insets.s16.h),
      padding: EdgeInsets.all(Insets.s16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.s16.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.s8.r),
                child: CachedNetworkImage(
                  imageUrl: entity.imageUrl,
                  width: Sizes.s60.w,
                  height: Sizes.s60.w,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Container(color: Colors.grey[200]),
                ),
              ),
              SizedBox(width: Insets.s12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.title,
                      style: TextStyle(
                        fontSize: Sizes.s16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: Insets.s5.h),
                    Text(
                      '${entity.meals.length} items',
                      style: TextStyle(
                        fontSize: Sizes.s14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.grey.shade400,
                  size: Sizes.s24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: Insets.s16.h),
          Text(
            'Updated ${entity.updatedAt}',
            style: TextStyle(
              fontSize: Sizes.s12.sp,
              color: Colors.grey.shade500,
            ),
          ),
          SizedBox(height: Insets.s16.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onAddAllToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003C5A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.s8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: Insets.s12.h),
                  ),
                  child: Text(
                    'Add All To Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.s14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: Insets.s12.w),
              OutlinedButton(
                onPressed: () {
                  //*Here The Edit Button */*********************************************** */
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.s8.r),
                  ),
                  side: const BorderSide(color: Color(0xFF003C5A)),
                  padding: EdgeInsets.symmetric(
                    vertical: Insets.s12.h,
                    horizontal: Insets.s20.w,
                  ),
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: const Color(0xFF003C5A),
                    fontSize: Sizes.s14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
