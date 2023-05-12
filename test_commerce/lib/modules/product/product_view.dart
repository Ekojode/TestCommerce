import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_commerce/providers/cart_provider.dart';

import '../../global_widgets/widgets.dart';
import '../../utilities/utilities.dart';
import 'product_view_model.dart';

class ProductView extends ConsumerWidget {
  final String productId;
  const ProductView({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productRef = ref.watch(singleProductProvider(productId));
    return Scaffold(
        appBar: customAppBarBack(
            context: context,
            title: 'Product Details',
            actionWidgets: [const AppCartIcon()],
            leadingAction: () => context.pop()),
        body: productRef.when(
            data: (product) => SafeArea(
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
                                imgUrl: product.image,
                                width: AppDimensions.width(context),
                                height: AppDimensions.width(context) * 0.8,
                              ),
                              const AppSpacer(),
                              Text(
                                (product.name ?? '').capitalizeFirst,
                                style: AppTextStyle.boldText24(context),
                              ),
                              const AppSpacer(multiplier: 0.5),
                              Text(
                                ('${product.price ?? 0}').toCurrency,
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
                                  SizedBox(
                                      width:
                                          AppDimensions.width(context) * 0.02),
                                  Text(
                                    '86 Reviews',
                                    style: AppTextStyle.regularText14(context),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height:
                                        AppDimensions.height(context) * 0.035,
                                    width: AppDimensions.width(context) * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.offGreen),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Quantity: 10',
                                      style: AppTextStyle.mediumText12(context)
                                          .copyWith(
                                              color: AppColors.earthGreen),
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
                                (product.description ?? '').capitalizeFirst,
                                style: AppTextStyle.regularText14(context),
                              ),
                              Text(
                                (product.description ?? '').capitalizeFirst,
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
                              SizedBox(
                                  width: AppDimensions.width(context) * 0.05),
                              Expanded(child:
                                  Consumer(builder: (context, ref, child) {
                                return AppButton(
                                    onPressed: () => ref
                                        .read(cartProvider.notifier)
                                        .addProductToCart(product),
                                    text: 'Add to Cart');
                              }))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
            loading: () => const AppLoader()));
  }
}
