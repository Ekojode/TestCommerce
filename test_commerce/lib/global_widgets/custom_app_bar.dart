import 'package:flutter/material.dart';

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
