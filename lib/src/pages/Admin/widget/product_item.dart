import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/models/cart_model.dart';
import 'package:freshfood/src/models/product.dart';
import 'package:freshfood/src/pages/cart/controller/cart_controller.dart';
import 'package:freshfood/src/pages/cart/widgets/cart_item_button.dart';
import 'package:freshfood/src/pages/cart/widgets/product_image.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductItem extends StatefulWidget {
  ProductModel product;
  ProductItem({this.product});
  @override
  State<StatefulWidget> createState() {
    return _ProductItem();
  }
}

class _ProductItem extends State<ProductItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ProductImage(
              widget.product.image[0],
              height: 30.w,
              width: 30.w,
              padding: 3.w,
            ),
            // SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 5.w,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.w),
                  Row(
                    children: <Widget>[
                      Text(
                        widget.product.price.toString() + " VNĐ",
                        style: TextStyle(
                          fontSize: 5.w,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.w),
                ],
              ),
            ),
          ],
        ),
        Divider(color: Colors.grey)
      ]),
    );
  }
}
