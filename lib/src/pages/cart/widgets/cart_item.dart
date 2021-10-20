import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/cart.dart';
import 'package:flutter_postman_application/src/pages/cart/widgets/cart_item_button.dart';
import 'package:flutter_postman_application/src/pages/cart/widgets/product_image.dart';
import 'package:sizer/sizer.dart';

class CartItem extends StatefulWidget {
  final CartModel cart;
  CartItem({this.cart});
  @override
  State<StatefulWidget> createState() {
    return _CartItem();
  }
}

class _CartItem extends State<CartItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Checkbox(value: null, onChanged: null),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: widget.cart.status == 0
                  ? Icon(
                      Icons.check_box_outline_blank_outlined,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.check_box_rounded,
                      color: Colors.green,
                    ),
              onPressed: () {
                setState(() {
                  if (widget.cart.status == 0)
                    widget.cart.status = 1;
                  else
                    widget.cart.status = 0;
                });
              },
            ),
            ProductImage(
              widget.cart.image[0],
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
                    widget.cart.name,
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
                        widget.cart.cost.toString() + " VNĐ",
                        style: TextStyle(
                          fontSize: 5.w,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.w),
                  Row(
                    children: <Widget>[
                      CartItemButton(PhosphorIcons.minus, () {
                        setState(() {
                          widget.cart.decrementQuantity();
                        });
                      }),
                      SizedBox(width: 1.w),
                      // Obx(
                      //   () =>
                      // GetBuilder(
                      //   builder: (_) =>
                      Text(
                        widget.cart.quantity.toString(),
                        style: TextStyle(
                          fontSize: 4.w,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // ),

                      // ),
                      SizedBox(width: 1.w),

                      CartItemButton(PhosphorIcons.plus, () {
                        setState(() {
                          widget.cart.incrementQuantity();
                        });
                      }),
                      SizedBox(width: 10.w),
                      // CartItemButton(
                      //     PhosphorIcons.trash, () => cartController.deleteItem(this.cartItem)),
                    ],
                  ),
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
