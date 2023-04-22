import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../data/models/product_model.dart';
import '../../global_widgets/widgets.dart';
import '../../utilities/dimension_utils.dart';
import 'product_view_model.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;
  const ProductView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.nonReactive(
      viewModelBuilder: () => ProductViewModel(),
      builder: (
        BuildContext context,
        ProductViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: customAppBarBack(
              context: context,
              title: 'Product Details',
              leadingAction: () => model.navigationService.back()),
          body: Column(
            children: [
              SizedBox(width: AppDimensions.width(context)),
              AppNetworkImageWidget(
                imgUrl: product.image,
                width: AppDimensions.width(context) * 0.92,
                height: AppDimensions.width(context) * 0.92,
              )
            ],
          ),
        );
      },
    );
  }
}
