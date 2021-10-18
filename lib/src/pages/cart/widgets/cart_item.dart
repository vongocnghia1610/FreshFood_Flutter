import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/cart.dart';
import 'package:flutter_postman_application/src/pages/cart/widgets/cart_item_button.dart';
import 'package:flutter_postman_application/src/pages/cart/widgets/product_image.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ProductImage(
          widget.cart.image[0],
          height: 30.w,
          width: 30.w,
          padding: 5.w,
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
              Row(
                children: <Widget>[
                  CartItemButton(
                      PhosphorIcons.minus, widget.cart.decrementQuantity),
                  SizedBox(width: 1.w),
                  Obx(
                    () => Text(
                      widget.cart.quantity.toString(),
                      style: TextStyle(
                        fontSize: 5.w,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),

                  CartItemButton(
                      PhosphorIcons.plus, widget.cart.incrementQuantity),
                  SizedBox(width: 10.w),
                  // CartItemButton(
                  //     PhosphorIcons.trash, () => cartController.deleteItem(this.cartItem)),
                ],
              )
            ],
          ),
        ),
        // Row(
        //   children: <Widget>[
        //     CartItemButton(PhosphorIcons.minus, widget.cart.decrementQuantity),
        //     SizedBox(width: 10.w),
        //     CartItemButton(PhosphorIcons.plus, widget.cart.incrementQuantity),
        //     SizedBox(width: 10.w),
        //     // CartItemButton(
        //     //     PhosphorIcons.trash, () => cartController.deleteItem(this.cartItem)),
        //   ],
        // )
      ],
    );
  }
}
