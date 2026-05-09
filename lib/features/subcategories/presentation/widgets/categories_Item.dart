import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/font_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final Color backgroundColor;
  const CategoryItem(
      {super.key,
      required this.image,
      required this.title,
      required this.backgroundColor,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
      width: 80.w,
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey,
          width: 0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 1), // اتجاه الظل
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 8.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  imageUrl: image ?? "",
                  width: 68.w,
                  height: 54.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                    color: color,
                    fontSize: FontSize.s12,
                    fontFamily: FontConstants.interFontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
