import 'package:flutter/material.dart';

import '../data/models/product_model.dart';
import '../global_widgets/widgets.dart';
import '../utilities/utilities.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onPressed;
  const ProductWidget(
      {super.key, required this.product, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppDimensions.width(context) * 0.0075,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.width(context) * 0.02,
                vertical: AppDimensions.height(context) * 0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppNetworkImageWidget(
                  imgUrl: product.image,
                  width: AppDimensions.width(context) * 0.4,
                  height: AppDimensions.width(context) * 0.4,
                  hasCircularBorder: true,
                ),
                SizedBox(height: AppDimensions.height(context) * 0.025),
                Text(
                  product.name ?? '',
                  style: AppTextStyle.mediumText14(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const AppSpacer(),
                Text(
                  'NGN ${product.price ?? 0}',
                  style: AppTextStyle.boldText12(context)
                      .copyWith(color: AppColors.redVelvet),
                ),
                const AppSpacer(),
                SizedBox(
                  width: AppDimensions.width(context) * 0.4,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_outlined,
                        color: AppColors.ratingYellow,
                        size: AppDimensions.width(context) * 0.04,
                      ),
                      SizedBox(
                        width: AppDimensions.width(context) * 0.015,
                        height: AppDimensions.height(context) * 0.015,
                      ),
                      Text(
                        '4.6',
                        style: AppTextStyle.regularText10(context),
                      ),
                      SizedBox(width: AppDimensions.width(context) * 0.025),
                      Text(
                        '86 Reviews',
                        style: AppTextStyle.regularText10(context),
                      ),
                      const Spacer(),
                      PopupMenuButton(
                          child: Icon(
                            Icons.more_vert_outlined,
                            color: AppColors.darkGrey,
                            size: AppDimensions.width(context) * 0.05,
                          ),
                          itemBuilder: (context) {
                            return const [PopupMenuItem(child: Text('hujh'))];
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
