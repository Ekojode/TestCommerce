import 'package:flutter/material.dart';

import '../data/models/product_model.dart';
import '../global_widgets/widgets.dart';
import '../utilities/utilities.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppDimensions.width(context) * 0.0075,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                imgUrl: product.image ??
                    'https://content.asos-media.com/-/media/hubs/about-us/about-asos/feb-update/about-asos-1-new-size-asos_brands.jpg',
                width: AppDimensions.width(context) * 0.4,
                height: AppDimensions.width(context) * 0.4,
                hasCircularBorder: true,
              ),
              SizedBox(height: AppDimensions.height(context) * 0.025),
              Text(product.name ?? '',
                  style: AppTextStyle.mediumText14(context)),
              SizedBox(height: AppDimensions.height(context) * 0.01),
              Text(
                'NGN ${product.price ?? 0}',
                style: AppTextStyle.boldText12(context)
                    .copyWith(color: AppColors.redVelvet),
              ),
              SizedBox(height: AppDimensions.height(context) * 0.01),
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
    );
  }
}
