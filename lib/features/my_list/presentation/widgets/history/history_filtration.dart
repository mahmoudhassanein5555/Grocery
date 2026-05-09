import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/my_list/domain/entity/filter_model.dart';

class HistoryFilterBottomSheet extends StatefulWidget {
  const HistoryFilterBottomSheet({super.key});

  @override
  State<HistoryFilterBottomSheet> createState() =>
      _HistoryFilterBottomSheetState();
}

class _HistoryFilterBottomSheetState extends State<HistoryFilterBottomSheet> {
  List<String> categories = [
    'Fresh Produce',
    'Canned',
    'Personal',
    'Cleaning',
    'Dairy & Eggs',
    'Bakery',
    'Meat',
    'Poultry',
    'Sea Food'
  ];
  List<String> selectedCategories = [];
  RangeValues priceRange = const RangeValues(0, 9999);
  List<int> selectedRatings = [];

  final Color darkBlue = const Color(0xFF034160);
  final Color bgColor = const Color(0xFFF1F8FA);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(Sizes.s24.r)),
      ),
      padding: EdgeInsets.only(
        left: Insets.s24.w,
        right: Insets.s24.w,
        top: Insets.s24.h,
        bottom: MediaQuery.of(context).padding.bottom + Insets.s24.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Text(
                'Filter',
                style: TextStyle(
                  fontSize: Sizes.s20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: Insets.s16.h),

            // Categories
            Text(
              'Categories',
              style: TextStyle(
                fontSize: Sizes.s16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: Insets.s12.h),
            Center(
              child: Wrap(
                spacing: Insets.s8.w,
                runSpacing: Insets.s8.h,
                alignment: WrapAlignment.center,
                children: categories.map((category) {
                  final isSelected = selectedCategories.contains(category);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedCategories.remove(category);
                        } else {
                          selectedCategories.add(category);
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Insets.s16.w, vertical: Insets.s8.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Sizes.s8.r),
                        border: Border.all(
                          color: isSelected ? darkBlue : Colors.grey[300]!,
                        ),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: Sizes.s14.sp,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: Insets.s16.h),
            Divider(color: Colors.grey[300]),
            SizedBox(height: Insets.s16.h),

            // Price Range
            Text(
              'Price Range',
              style: TextStyle(
                fontSize: Sizes.s16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: Insets.s8.h),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: darkBlue,
                inactiveTrackColor: Colors.grey[300],
                thumbColor: Colors.white,
                overlayColor: darkBlue.withOpacity(0.1),
                trackHeight: Sizes.s4.h,
                rangeThumbShape: const RoundRangeSliderThumbShape(elevation: 3),
              ),
              child: RangeSlider(
                values: priceRange,
                min: 0,
                max: 9999,
                onChanged: (RangeValues values) {
                  setState(() {
                    priceRange = values;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('From :', style: TextStyle(fontSize: Sizes.s12.sp)),
                    SizedBox(height: Insets.s4.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Insets.s16.w, vertical: Insets.s8.h),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(Sizes.s8.r),
                      ),
                      child: Text(
                        '${priceRange.start.toInt()} EGP',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Sizes.s14.sp),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('To :', style: TextStyle(fontSize: Sizes.s12.sp)),
                    SizedBox(height: Insets.s4.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Insets.s16.w, vertical: Insets.s8.h),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(Sizes.s8.r),
                      ),
                      child: Text(
                        '${priceRange.end.toInt()} EGP',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Sizes.s14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: Insets.s16.h),
            Divider(color: Colors.grey[300]),
            SizedBox(height: Insets.s16.h),

            // Rating
            Text(
              'Rating',
              style: TextStyle(
                fontSize: Sizes.s16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: Insets.s16.h),
            Center(
              child: Wrap(
                spacing: Insets.s16.w,
                runSpacing: Insets.s16.h,
                alignment: WrapAlignment.center,
                children: List.generate(5, (index) {
                  int starCount = 5 - index;
                  bool isSelected = selectedRatings.contains(starCount);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedRatings.remove(starCount);
                        } else {
                          selectedRatings.add(starCount);
                        }
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: Sizes.s20.w,
                          height: Sizes.s20.w,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.grey[400]
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(Sizes.s4.r),
                          ),
                          child: isSelected
                              ? Icon(Icons.check,
                                  size: Sizes.s16.sp, color: Colors.white)
                              : null,
                        ),
                        SizedBox(width: Insets.s8.w),
                        Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              starIndex < starCount
                                  ? Icons.star
                                  : Icons.star_border,
                              color: const Color(0xFFFFD700),
                              size: Sizes.s16.sp,
                            );
                          }),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: Insets.s32.h),

            // Done Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.s8.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: Insets.s16.h),
                ),
                onPressed: () {
                  final filterModel = FilterModel(
                    categories: selectedCategories.isNotEmpty
                        ? selectedCategories
                        : null,
                    minPrice: priceRange.start,
                    maxPrice: priceRange.end,
                    rating: selectedRatings.isNotEmpty
                        ? selectedRatings.first
                        : null,
                  );
                  Navigator.pop(context, filterModel);
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: Sizes.s16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
