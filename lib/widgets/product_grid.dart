
import 'package:flutter/material.dart';
import 'package:grocery_admin/consts/constants.dart';
import 'package:grocery_admin/widgets/product_widget.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget(
      {Key? key, this.crossAxisCount = 4, this.childAspectRatio = 1,required this.isInMain})
      : super(key: key);
  final int crossAxisCount;
  final double childAspectRatio;
  final bool isInMain;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: isInMain?4:20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
        ),
        itemBuilder: (context, index) {
          return const ProductWidget();
        });
  }
}