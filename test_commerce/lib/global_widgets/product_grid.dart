import 'package:flutter/material.dart';

import '../data/models/product_model.dart';
import '../utilities/dimension_utils.dart';
import 'product_widget.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  final Function(String) onPressed;
  const ProductGrid(
      {super.key, required this.products, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppDimensions.width(context) * 0.5,
            childAspectRatio: 3 / 5,
            crossAxisSpacing: AppDimensions.width(context) * 0.02,
            mainAxisSpacing: AppDimensions.height(context) * 0.01),
        itemBuilder: (context, i) {
          final product = products[i];
          return ProductWidget(
            product: product,
            onPressed: () {
              onPressed(product.id ?? '');
            },
          );
        });
  }
}
