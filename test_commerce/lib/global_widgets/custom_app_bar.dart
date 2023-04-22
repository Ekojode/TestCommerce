import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/utilities.dart';

AppBar customAppBar(
    {required BuildContext context,
    required String title,
    Color color = AppColors.textBlack,
    List<Widget> actionWidgets = const []}) {
  return AppBar(
    backgroundColor: AppColors.pureWhite,
    elevation: 0.25,
    centerTitle: true,
    title: Text(title,
        style: AppTextStyle.boldText16(context).copyWith(color: color)),
    actions: actionWidgets,
  );
}

AppBar customAppBarBack(
    {required BuildContext context,
    required String title,
    required VoidCallback leadingAction,
    Color color = AppColors.textBlack,
    List<Widget> actionWidgets = const []}) {
  return AppBar(
    leading: InkWell(
        onTap: leadingAction,
        child: Padding(
          padding: AppDimensions.width(context) < 300
              ? EdgeInsets.all(AppDimensions.width(context) * 0.07)
              : EdgeInsets.all(AppDimensions.isMobile(context)
                  ? AppDimensions.width(context) * 0.05
                  : AppDimensions.width(context) * 0.02),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
          ),
        )),
    backgroundColor: AppColors.pureWhite,
    elevation: 0.25,
    centerTitle: true,
    title: Text(title,
        style: AppTextStyle.boldText16(context).copyWith(color: color)),
    actions: actionWidgets,
  );
}
