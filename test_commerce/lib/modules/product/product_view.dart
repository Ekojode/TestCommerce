import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../global_widgets/widgets.dart';
import '../../utilities/utilities.dart';

class ProductView extends StatelessWidget {
  final String productId;
  const ProductView({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarBack(
          context: context,
          title: 'Product Details',
          leadingAction: () => context.pop()),
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.screenPadding(context),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: AppDimensions.width(context)),
                    AppNetworkImageWidget(
                      imgUrl: 'model.product.image',
                      width: AppDimensions.width(context),
                      height: AppDimensions.width(context) * 0.8,
                    ),
                    const AppSpacer(),
                    Text(
                      ('model.product.name ??').capitalizeFirst,
                      style: AppTextStyle.boldText24(context),
                    ),
                    const AppSpacer(multiplier: 0.5),
                    Text(
                      ('0').toCurrency,
                      style: AppTextStyle.mediumText16(context)
                          .copyWith(color: AppColors.redVelvet),
                    ),
                    const AppSpacer(multiplier: 0.5),
                    Row(
                      children: [
                        Icon(
                          Icons.star_outlined,
                          color: AppColors.ratingYellow,
                          size: AppDimensions.width(context) * 0.05,
                        ),
                        const AppSpacer(),
                        Text(
                          '4.6',
                          style: AppTextStyle.regularText14(context),
                        ),
                        SizedBox(width: AppDimensions.width(context) * 0.02),
                        Text(
                          '86 Reviews',
                          style: AppTextStyle.regularText14(context),
                        ),
                        const Spacer(),
                        Container(
                          height: AppDimensions.height(context) * 0.035,
                          width: AppDimensions.width(context) * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.offGreen),
                          alignment: Alignment.center,
                          child: Text(
                            'Quantity: 10',
                            style: AppTextStyle.mediumText12(context)
                                .copyWith(color: AppColors.earthGreen),
                          ),
                        ),
                      ],
                    ),
                    const AppDivider(),
                    Text(
                      'Product Description',
                      style: AppTextStyle.boldText16(context),
                    ),
                    const AppSpacer(multiplier: 0.5),
                    Text(
                      ('model.product.description ??' '').capitalizeFirst,
                      style: AppTextStyle.regularText14(context),
                    ),
                    Text(
                      ('model.product.description ??' '').capitalizeFirst,
                      style: AppTextStyle.regularText14(context),
                    ),
                    const AppSpacer(multiplier: 8)
                  ],
                ),
              ),
              Padding(
                padding: AppDimensions.horizontalPadding(context),
                child: Row(
                  children: [
                    Expanded(
                        child: AppButton(
                            bgColor: AppColors.redVelvet,
                            onPressed: () {},
                            text: 'Add to Wishlist')),
                    SizedBox(width: AppDimensions.width(context) * 0.05),
                    Expanded(
                        child: AppButton(onPressed: () {}, text: 'Add to Cart'))
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
