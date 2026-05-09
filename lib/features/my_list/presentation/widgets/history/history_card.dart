import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/my_list/domain/entity/history_entity.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCard extends StatefulWidget {
  final HistoryEntity entity;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;

  const HistoryCard({
    super.key,
    required this.entity,
    this.onFavoriteToggle,
    this.onTap,
  });

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.entity.isFavorite;
  }

  @override
  void didUpdateWidget(covariant HistoryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.entity.isFavorite != oldWidget.entity.isFavorite) {
      setState(() {
        isFavorite = widget.entity.isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12.r)),
                  child: CachedNetworkImage(
                    imageUrl: widget.entity.imageUrl,
                    height: Sizes.s120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Container(color: Colors.grey[200], height: Sizes.s120),
                  ),
                ),
                Positioned(
                  top: Sizes.s8,
                  right: Sizes.s8,
                  child: BlocListener<HistoryCubit, HistoryState>(
                    listener: (context, state) {
                      if (state is AddRemoveFavoriteSuccess) {
                        if (state.response.data.mealId == widget.entity.id) {
                          setState(() {
                            isFavorite = state.response.data.isFavorited;
                          });
                        }
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });

                        context.read<HistoryCubit>().addRemoveFavorite(
                              widget.entity.id,
                            );
                      },
                      child: CircleAvatar(
                        radius: 14.r,
                        backgroundColor: Colors.white,
                        child: isFavorite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: Sizes.s16,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                                size: Sizes.s16,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(Sizes.s12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          widget.entity.title,
                          style: TextStyle(
                            fontSize: Sizes.s18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: Sizes.s10),
                    ],
                  ),
                  SizedBox(height: Sizes.s10),
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < widget.entity.rating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: Sizes.s20,
                          ),
                        ),
                      ),
                      SizedBox(height: Sizes.s10),
                      Text(
                        '(${widget.entity.ratingCount})',
                        style: TextStyle(
                          fontSize: Sizes.s14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.s2),
                  Row(
                    children: [
                      Text(
                        '£${widget.entity.price.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: Sizes.s16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF003C5A),
                        ),
                      ),
                      SizedBox(width: Sizes.s8),
                      Text(
                        '£${widget.entity.originalPrice.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: Sizes.s14,
                          color: Colors.grey.shade400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.s18),
                  SizedBox(
                    width: double.infinity,
                    height: Sizes.s36,
                    child: ElevatedButton(
                      onPressed: widget.onFavoriteToggle,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003C5A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.s20,
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
