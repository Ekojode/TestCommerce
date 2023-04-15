import 'package:flutter/material.dart';

import '../data/models/product_model.dart';
import '../utilities/dimension_utils.dart';
import 'product_widget.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppDimensions.width(context) * 0.4,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: AppDimensions.width(context) * 0.02,
            mainAxisSpacing: AppDimensions.height(context) * 0.01),
        itemBuilder: (context, i) {
          final product = products[i];
          return ProductWidget(product: product);
        });
  }
}
