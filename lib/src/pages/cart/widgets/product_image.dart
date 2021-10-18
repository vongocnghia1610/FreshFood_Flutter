import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final double padding;
  ProductImage(
    this.image, {
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return this.image == null
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.all(this.padding ?? 0),
            child: Image.network(
              this.image,
              fit: BoxFit.cover,
              height: this.height,
              width: this.width,
            ),
          );
  }
}
