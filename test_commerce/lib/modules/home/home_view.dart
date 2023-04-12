import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../global_widgets/widgets.dart';
import '../../utilities/utilities.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: customAppBar(
              context: context,
              title: 'Mega Mall',
              color: AppColors.blueOcean,
              actionWidgets: [
                SvgPicture.asset('assets/icons/bell.svg'),
                Padding(
                  padding: AppDimensions.horizontalPadding(context),
                  child: SvgPicture.asset('assets/icons/shopping-cart.svg'),
                ),
              ]),
          body: SafeArea(
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
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                    RowHeader(
                        title: 'Categories',
                        actionText: 'See all',
                        onPressed: () {}),
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                    SizedBox(
                      height: AppDimensions.width(context) * 0.25,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            IconBox(
                                text: 'Food',
                                color: AppColors.lightGreen,
                                image: 'assets/icons/category/vegetable.svg'),
                            IconBox(
                                text: 'Gift',
                                color: AppColors.lightOrange,
                                image: 'assets/icons/category/fruit.svg'),
                            IconBox(
                                text: 'Fashion',
                                color: AppColors.lightYellow,
                                image: 'assets/icons/category/eggs.svg'),
                            IconBox(
                                text: 'Gadget',
                                color: AppColors.lightPurple,
                                image: 'assets/icons/category/meat.svg'),
                            IconBox(
                                text: 'Computers',
                                color: AppColors.lightGreen,
                                image: 'assets/icons/category/vegetable.svg'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                    RowHeader(
                        title: 'Featured Products',
                        actionText: 'See all',
                        onPressed: () {}),
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                    SizedBox(
                      height: AppDimensions.width(context) < 300
                          ? AppDimensions.width(context) * 0.75
                          : AppDimensions.width(context) * 0.735,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            ProductWidget(),
                            ProductWidget(),
                            ProductWidget()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                    RowHeader(
                        title: 'Best Sellers',
                        actionText: 'See all',
                        onPressed: () {}),
                    SizedBox(
                      height: AppDimensions.width(context) < 300
                          ? AppDimensions.width(context) * 0.75
                          : AppDimensions.width(context) * 0.735,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            ProductWidget(),
                            ProductWidget(),
                            ProductWidget()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                    RowHeader(
                        title: 'New Arrivals',
                        actionText: 'See all',
                        onPressed: () {}),
                    SizedBox(
                      height: AppDimensions.width(context) < 300
                          ? AppDimensions.width(context) * 0.75
                          : AppDimensions.width(context) * 0.735,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            ProductWidget(),
                            ProductWidget(),
                            ProductWidget()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                    RowHeader(
                        title: 'Top Rated Products',
                        actionText: 'See all',
                        onPressed: () {}),
                    SizedBox(
                      height: AppDimensions.width(context) < 300
                          ? AppDimensions.width(context) * 0.75
                          : AppDimensions.width(context) * 0.735,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            ProductWidget(),
                            ProductWidget(),
                            ProductWidget()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                    RowHeader(
                        title: 'Special Offers',
                        actionText: 'See all',
                        onPressed: () {}),
                    SizedBox(
                      height: AppDimensions.width(context) < 300
                          ? AppDimensions.width(context) * 0.75
                          : AppDimensions.width(context) * 0.735,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            ProductWidget(),
                            ProductWidget(),
                            ProductWidget()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height(context) * 0.01),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
