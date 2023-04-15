import 'package:flutter/material.dart';

import '../data/models/product_model.dart';
import '../utilities/utilities.dart';
import 'widgets.dart';

class ProductRowList extends StatelessWidget {
  final List<ProductModel> products;
  const ProductRowList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.width(context) < 300
          ? AppDimensions.width(context) * 0.75
          : AppDimensions.width(context) * 0.735,
      child: Center(
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            final product = products[i];
            return ProductWidget(product: product);
          },
        ),
      ),
    );
  }
}
