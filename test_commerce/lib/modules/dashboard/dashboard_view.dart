import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import 'dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.nonReactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (
        BuildContext context,
        DashboardViewModel model,
        Widget? child,
      ) {
        return AppBaseView(
          child: Scaffold(
            body: Padding(
              padding: AppDimensions.screenPadding(context),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RowHeader(
                        title: 'Categories',
                        actionText: 'See All',
                        onPressed: () {}),
                    SizedBox(
                      height: AppDimensions.height(context) * 0.125,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            IconBox(
                              color: AppColors.lightGreen,
                              text: 'Food',
                              image: 'assets/icons/category/vegetable.svg',
                            ),
                            IconBox(
                              color: AppColors.lightOrange,
                              text: 'Gift',
                              image: 'assets/icons/category/fruit.svg',
                            ),
                            IconBox(
                              color: AppColors.lightYellow,
                              text: 'Fashion',
                              image: 'assets/icons/category/eggs.svg',
                            ),
                            IconBox(
                              color: AppColors.lightPurple,
                              text: 'Gadget',
                              image: 'assets/icons/category/meat.svg',
                            ),
                            IconBox(
                              color: AppColors.lightGreen,
                              text: 'Computers',
                              image: 'assets/icons/category/vegetable.svg',
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppNetworkImageWidget(
                      imgUrl:
                          'https://content.asos-media.com/-/media/hubs/about-us/about-asos/feb-update/about-asos-1-new-size-asos_brands.jpg',
                      hasCircularBorder: true,
                      width: AppDimensions.width(context),
                      height: AppDimensions.width(context),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: AppDimensions.height(context) * 0.1,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 8.0,
                backgroundColor: AppColors.pureWhite,
                selectedLabelStyle: AppTextStyle.mediumText10(context)
                    .copyWith(color: AppColors.blueOcean),
                unselectedLabelStyle: AppTextStyle.mediumText10(context)
                    .copyWith(color: AppColors.textBlack),
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/dashboard/home.svg',
                      ),
                      label: 'HOME'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/dashboard/wishlist.svg',
                      ),
                      label: 'WISHLIST'),
                  BottomNavigationBarItem(
                      icon:
                          SvgPicture.asset('assets/icons/dashboard/orders.svg'),
                      label: 'ORDER'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/dashboard/profile.svg'),
                      label: 'LOGIN'),
                ],
                onTap: (i) => model.updateSelectedTab(i),
                currentIndex: model.selectedTab,
                selectedItemColor: AppColors.blueOcean,
                unselectedItemColor: AppColors.textBlack,
              ),
            ),
          ),
        );
      },
    );
  }
}
