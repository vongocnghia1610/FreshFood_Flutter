import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/order.dart';
import 'package:flutter_postman_application/src/pages/payment/widget/default_button.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class FirstPage extends StatefulWidget {
  final List<OrderModel> orders;
  FirstPage({this.orders});

  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.orders.length,
        itemBuilder: (context, index) {
          return Column(children: [
            WidgetOrder(
              order: widget.orders[index],
            ),
          ]);
        },
      ),
      // Column(
      //   children: [

      //     pageDetailOrder(widget: widget, orders: widget.orders),
      //   ],
      // ),
    );
  }
}

class WidgetOrder extends StatelessWidget {
  OrderModel order;
  WidgetOrder({
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
      width: 100.w,
      height: 68.w,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20.sp),
            child: Column(
              children: [
                Material(
                  child: InkWell(
                    onTap: () {
                      print(order);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.sp,
                        ),
                        Image.network(
                          order.product[0].image[0],
                          height: 50.sp,
                          width: 50.sp,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                  "[${order.orderCode}] ${order.product[0].name}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 170.sp, top: 5.sp),
                                child: Text(
                                  "x${order.product[0].quantity}",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 120.sp, top: 5.sp),
                                child: Text(
                                  "đ${order.product[0].price}",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(PhosphorIcons.caret_right),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.sp),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                    top: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                  )),
                  padding:
                      EdgeInsets.only(top: 5.sp, left: 10.sp, bottom: 5.sp),
                  child: Row(
                    children: [
                      Text("${order.product.length} sản phẩm",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w300)),
                      SizedBox(
                        width: 42.sp,
                      ),
                      Icon(
                        PhosphorIcons.money_bold,
                        size: 28,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Text("Thành tiền:",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 3.sp,
                      ),
                      Text(
                        "đ${order.totalMoney}",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.sp),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                  )),
                  padding:
                      EdgeInsets.only(top: 5.sp, left: 10.sp, bottom: 5.sp),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            PhosphorIcons.truck,
                            size: 28,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("Lịch sử đơn hàng",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Icon(PhosphorIcons.caret_right)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 3.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Container(
            padding: EdgeInsets.only(left: 150.sp),
            child: FlatButton(
              height: 35.sp,
              minWidth: 120.sp,
              padding: EdgeInsets.symmetric(vertical: 3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: kPrimaryColor,
              textColor: Colors.white,
              highlightColor: Colors.transparent,
              onPressed: () {},
              child: Text("Mua Tiếp"),
            ),
          )
        ],
      ),
    );
  }
}
