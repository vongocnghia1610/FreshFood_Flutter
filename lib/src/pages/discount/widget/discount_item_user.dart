import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/helpers/money_formatter.dart';
import 'package:freshfood/src/models/discount.dart';
import 'package:freshfood/src/pages/cart/widgets/product_image.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class DiscountItemUser extends StatefulWidget {
  DiscountModel discount;
  DiscountItemUser({this.discount});
  @override
  State<StatefulWidget> createState() {
    return _DiscountItemUser();
  }
}

class _DiscountItemUser extends State<DiscountItemUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.UPDATE_PRODUCT,
        //     arguments: {"productCurrent": widget.product});
      },
      splashColor: Colors.grey,
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ProductImage(
                'https://cdn4.vectorstock.com/i/1000x1000/71/83/sign-board-discount-vector-1947183.jpg',
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
                      'Giảm ${widget.discount.percentDiscount}%',
                      style: TextStyle(
                        fontSize: 5.w,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3.w),
                    Text(
                      'Đơn tối thiểu ' +
                          formatMoney(
                              widget.discount.minimumDiscount.toDouble()) +
                          ' Giảm tối đa ' +
                          formatMoney(widget.discount.maxDiscount.toDouble()),
                      style: TextStyle(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    LinearProgressIndicator(
                      value: 0.5,
                      semanticsLabel: 'Linear progress indicator',
                      color: Colors.green,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Số lượng sản phẩm còn ",
                    //       style: TextStyle(
                    //         fontSize: 4.w,
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.product.quantity.toString(),
                    //       style: TextStyle(
                    //         fontSize: 4.w,
                    //         color: Colors.red,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Row(
                      children: [
                        Text(
                          "Hết hạn: " +
                              DateFormat("dd-MM-yyyy")
                                  .format(widget.discount.duration.toLocal())
                                  .toString(),
                          style: TextStyle(
                            fontSize: 3.5.w,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(
                        //   widget.product.sold.toString(),
                        //   style: TextStyle(
                        //     fontSize: 4.w,
                        //     color: Colors.red,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 1.w),
                  ],
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    PhosphorIcons.circle,
                    // color: title == widget.status ? kPrimaryColor : colorTitle,
                    size: 17.25.sp,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey)
        ]),
      ),
    );
  }
}
