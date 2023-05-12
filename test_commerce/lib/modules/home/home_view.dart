import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../global_widgets/widgets.dart';
import '../../utilities/utilities.dart';
import 'home_view_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Scaffold(
        appBar: customAppBar(
            context: context,
            title: 'Mega Mall',
            color: AppColors.blueOcean,
            actionWidgets: [
              SvgPicture.asset('assets/icons/bell.svg'),
              const AppCartIcon()
            ]),
        body: products.when(
            data: (prods) => SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: AppDimensions.screenPadding(context),
                      width: AppDimensions.width(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppTextField(
                            hasIcon: true,
                            icon: 'assets/icons/search.svg',
                            hintText: 'Search Products',
                          ),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          RowHeader(
                              title: 'Categories',
                              actionText: 'See all',
                              onPressed: () {}),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          SizedBox(
                            height: AppDimensions.width(context) * 0.25,
                            child: Center(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  IconBox(
                                      onPressed: () => context.goNamed(
                                          AppRouter.category,
                                          params: {'cat': 'food'}),
                                      text: 'Food',
                                      color: AppColors.lightGreen,
                                      image:
                                          'assets/icons/category/vegetable.svg'),
                                  IconBox(
                                      onPressed: () => context.goNamed(
                                          AppRouter.category,
                                          params: {'cat': 'gift'}),
                                      text: 'Gift',
                                      color: AppColors.lightOrange,
                                      image: 'assets/icons/category/fruit.svg'),
                                  IconBox(
                                      onPressed: () => context.goNamed(
                                          AppRouter.category,
                                          params: {'cat': 'fashion'}),
                                      text: 'Fashion',
                                      color: AppColors.lightYellow,
                                      image: 'assets/icons/category/eggs.svg'),
                                  IconBox(
                                      onPressed: () => context.goNamed(
                                          AppRouter.category,
                                          params: {'cat': 'gadget'}),
                                      text: 'Gadget',
                                      color: AppColors.lightPurple,
                                      image: 'assets/icons/category/meat.svg'),
                                  IconBox(
                                      onPressed: () => context.goNamed(
                                          AppRouter.category,
                                          params: {'cat': 'computers'}),
                                      text: 'Computers',
                                      color: AppColors.lightGreen,
                                      image:
                                          'assets/icons/category/vegetable.svg'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          RowHeader(
                              title: 'Featured Products',
                              actionText: 'See all',
                              onPressed: () {}),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          ProductRowList(
                              products: prods,
                              onPressed: (prod) {
                                context.goNamed(AppRouter.productDetails,
                                    params: {'productId': prod});
                              }),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          RowHeader(
                              title: 'Best Sellers',
                              actionText: 'See all',
                              onPressed: () {}),
                          ProductRowList(
                              products: prods,
                              onPressed: (prod) {
                                context.goNamed(AppRouter.productDetails,
                                    params: {'productId': prod});
                              }),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          RowHeader(
                              title: 'New Arrivals',
                              actionText: 'See all',
                              onPressed: () {}),
                          ProductRowList(
                              products: prods,
                              onPressed: (prod) {
                                context.goNamed(AppRouter.productDetails,
                                    params: {'productId': prod});
                              }),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          RowHeader(
                              title: 'Top Rated Products',
                              actionText: 'See all',
                              onPressed: () {}),
                          ProductRowList(
                              products: prods, onPressed: (prods) {}),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                          RowHeader(
                              title: 'Special Offers',
                              actionText: 'See all',
                              onPressed: () {}),
                          ProductRowList(
                              products: prods,
                              onPressed: (prod) {
                                context.goNamed(AppRouter.productDetails,
                                    params: {'productId': prod});
                              }),
                          SizedBox(
                              height: AppDimensions.height(context) * 0.01),
                        ],
                      ),
                    ),
                  ),
                ),
            error: (error, stacktrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () => const AppLoader()));
  }
}
