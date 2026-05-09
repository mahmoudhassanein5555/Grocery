import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/product_details/presentation/widgets/detail_card_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsSkeletonizerWidget extends StatelessWidget {
  const ProductDetailsSkeletonizerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: ColorManager.white,
                    radius: Sizes.s20,
                    child: const Icon(
                      Icons.favorite,
                      color: ColorManager.grey,
                      size: Sizes.s20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Sizes.s16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'Product Name Skeleton',
                    style: TextStyle(
                      fontSize: Sizes.s24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '£000',
                      style: TextStyle(
                        fontSize: Sizes.s22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: Sizes.s8),
                    Text('£000', style: TextStyle(fontSize: Sizes.s16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: Sizes.s8),
            Row(
              children: [
                ...List.generate(
                  5,
                  (index) => const Icon(Icons.star, size: Sizes.s20),
                ),
                const SizedBox(width: Sizes.s8),
                const Text('(0.0)'),
              ],
            ),
            const SizedBox(height: Sizes.s24),
            const Text(
              'Detailes',
              style: TextStyle(
                fontSize: Sizes.s18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Sizes.s12),
            Row(
              children: [
                Expanded(
                  child: DetailCardWidget(title: 'Includes', value: 'Skeleton'),
                ),
                const SizedBox(width: Sizes.s12),
                Expanded(
                  child: DetailCardWidget(title: 'Size', value: 'Skeleton'),
                ),
                const SizedBox(width: Sizes.s12),
                Expanded(
                  child: DetailCardWidget(title: 'Expiry', value: 'Skeleton'),
                ),
              ],
            ),
            const SizedBox(height: Sizes.s24),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: Sizes.s18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Sizes.s8),
            const Text(
              'This is a fake description for the skeleton loading effect.\n'
              'It will show grey lines instead of actual text.',
              style: TextStyle(fontSize: Sizes.s15),
            ),
            const SizedBox(height: Sizes.s24),
            const Text(
              'How to Use',
              style: TextStyle(
                fontSize: Sizes.s18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Sizes.s8),
            const Text(
              '1- Fake instruction step one.\n'
              '2- Fake instruction step two.',
              style: TextStyle(fontSize: Sizes.s15),
            ),
            const SizedBox(height: Sizes.s24),
          ],
        ),
      ),
    );
  }
}
