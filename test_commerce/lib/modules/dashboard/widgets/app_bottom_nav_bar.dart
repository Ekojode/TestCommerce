import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utilities/utilities.dart';
import '../dashboard_view_model.dart';

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: AppDimensions.height(context) * 0.1,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 8.0,
        backgroundColor: AppColors.pureWhite,
        selectedLabelStyle: AppTextStyle.mediumText10(context)
            .copyWith(color: AppColors.blueOcean),
        unselectedLabelStyle: AppTextStyle.mediumText10(context),
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/dashboard/home_active.svg',
                width: AppDimensions.width(context) * 0.06,
                height: AppDimensions.width(context) * 0.06,
              ),
              icon: SvgPicture.asset(
                'assets/icons/dashboard/home.svg',
                width: AppDimensions.width(context) * 0.06,
                height: AppDimensions.width(context) * 0.06,
              ),
              label: 'HOME'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/dashboard/wishlist_active.svg',
                width: AppDimensions.width(context) * 0.06,
                height: AppDimensions.width(context) * 0.06,
              ),
              icon: SvgPicture.asset(
                'assets/icons/dashboard/wishlist.svg',
                width: AppDimensions.width(context) * 0.06,
                height: AppDimensions.width(context) * 0.06,
              ),
              label: 'WISHLIST'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/dashboard/orders_active.svg',
                width: AppDimensions.width(context) * 0.06,
                height: AppDimensions.width(context) * 0.06,
              ),
              icon: SvgPicture.asset(
                'assets/icons/dashboard/orders.svg',
                width: AppDimensions.width(context) * 0.06,
                height: AppDimensions.width(context) * 0.06,
              ),
              label: 'ORDER'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/dashboard/profile_active.svg',
                width: AppDimensions.width(context) * 0.06,
                height: AppDimensions.width(context) * 0.06,
              ),
              icon: SvgPicture.asset(
                'assets/icons/dashboard/profile.svg',
                width: AppDimensions.width(context) * 0.06,
                height: AppDimensions.width(context) * 0.06,
              ),
              label: 'LOGIN'),
        ],
        onTap: (i) {
          ref.read(dashboardProvider.notifier).updateIndex(i);
        },
        currentIndex: ref.watch(dashboardProvider).pageIndex,
        selectedItemColor: AppColors.blueOcean,
        unselectedItemColor: AppColors.textBlack,
      ),
    );
  }
}
