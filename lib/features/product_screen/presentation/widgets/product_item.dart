import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_elevate_task/core/utils/color_manager.dart';
import 'package:e_commerce_elevate_task/features/product_screen/domain/entities/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  ProductResponseEntity productResponseEntity;
  ProductItem({super.key, required this.productResponseEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: ColorManager.primaryDark.withOpacity(0.3),
          width: 2.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: productResponseEntity.image ?? '',
                  height: 128.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryDark,
                      )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                top: 5.h,
                right: 2.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: IconButton(
                    color: ColorManager.primaryDark,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              productResponseEntity.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp,
                color: ColorManager.primaryDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  "EGP ${productResponseEntity.price}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: ColorManager.primaryDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Review (${productResponseEntity.rating!.rate})",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: ColorManager.primaryDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                const Icon(
                  Icons.star_rate_rounded,
                  color: ColorManager.starRateColor,
                ),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {
                    //todo: add to cart
                  },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: ColorManager.primaryDark,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}