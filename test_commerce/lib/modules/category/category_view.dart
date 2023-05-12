import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../global_widgets/widgets.dart';
import '../../utilities/utilities.dart';
import 'category_view_model.dart';

class CategoryView extends ConsumerWidget {
  final String category;
  const CategoryView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categegoryProducts = ref.watch(categoryProductsProvider(category));
    return Scaffold(
        appBar: customAppBarBack(
            context: context,
            title: 'Category',
            actionWidgets: [const AppCartIcon()],
            leadingAction: () => context.pop()),
        body: categegoryProducts.when(
            data: (products) => SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: AppDimensions.screenPadding(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: AppDimensions.width(context)),
                          Text(category.capitalizeFirst,
                              style: AppTextStyle.boldText24(context)),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          const AppTextField(
                            hasIcon: true,
                            icon: 'assets/icons/search.svg',
                            hintText: 'Search Products',
                          ),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          SizedBox(
                            height: AppDimensions.height(context) * 0.7,
                            child: products.isEmpty
                                ? Center(
                                    child: Text(
                                    'There are no products in this category',
                                    style: AppTextStyle.mediumText16(context),
                                  ))
                                : ProductGrid(
                                    products: products,
                                    onPressed: (prod) {
                                      context.pushNamed(
                                          AppRouter.productDetails,
                                          params: {'productId': prod});
                                    }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
            loading: () => const AppLoader()));
  }
}
