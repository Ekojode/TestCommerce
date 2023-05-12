import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../global_widgets/widgets.dart';
import '../../utilities/utilities.dart';

class CategoryView extends StatelessWidget {
  final String category;
  const CategoryView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarBack(
          context: context,
          title: 'Category',
          leadingAction: () => context.pop()),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppDimensions.screenPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: AppDimensions.width(context)),
                  Text(category.capitalizeFirst,
                      style: AppTextStyle.boldText24(context)),
                  SizedBox(height: AppDimensions.height(context) * 0.01),
                  const AppTextField(
                    hasIcon: true,
                    icon: 'assets/icons/search.svg',
                    hintText: 'Search Products',
                  ),
                  SizedBox(height: AppDimensions.height(context) * 0.01),
                  SizedBox(
                    height: AppDimensions.height(context) * 0.7,
                    child: Center(
                        child: Text(
                      'There are no products in this category',
                      style: AppTextStyle.mediumText16(context),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
