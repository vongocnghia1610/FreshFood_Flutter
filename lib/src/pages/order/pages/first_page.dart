import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/helpers/money_formatter.dart';
import 'package:freshfood/src/models/cart_model.dart';
import 'package:freshfood/src/models/order.dart';
import 'package:freshfood/src/pages/payment/widget/default_button.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FirstPage extends StatefulWidget {
  final List<OrderModel> orders;
  String status;
  FirstPage({this.orders, this.status});

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
              status: widget.status,
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
  String status;
  WidgetOrder({this.order, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.sp),
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
                      Get.toNamed(Routes.DETAIL_ORDER,
                          arguments: {"order": order});

                      print(order);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.sp,
                        ),
                        Image.network(
                          order.product[0].image[0],
                          height: 70.sp,
                          width: 70.sp,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20.sp,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(top: 5.sp),
                                child: Text(
                                  "[${order.orderCode}] ${order.product[0].name}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding:
                                    EdgeInsets.only(top: 5.sp, right: 5.sp),
                                child: Text(
                                  "x${order.product[0].quantity}",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding:
                                    EdgeInsets.only(top: 5.sp, right: 5.sp),
                                child: Text(
                                  formatMoney(order.product[0].price),
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
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
                        PhosphorIcons.money,
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
                        formatMoney(order.totalMoney),
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
                                  child: Text(status,
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
          status == "Đã giao" || status == "Đã hủy"
              ? SizedBox(
                  height: 5.sp,
                )
              : SizedBox(),
          status == "Đã giao"
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                        child: FlatButton(
                          height: 35.sp,
                          minWidth: 120.sp,
                          padding: EdgeInsets.symmetric(vertical: 3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            Get.toNamed(Routes.EVELUATE_PRODUCT);
                            // arguments: {"list": product});
                          },
                          child: Text("Đánh giá"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                        child: FlatButton(
                          height: 35.sp,
                          minWidth: 120.sp,
                          padding: EdgeInsets.symmetric(vertical: 3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            print(order.product.length);
                            List<CartModel> product = [];
                            product.addAll((order.product
                                .map((e) => CartModel.fromMap1(e.toMap1()))
                                .toList()));
                            Get.toNamed(Routes.DETAIL_PAYMENT,
                                arguments: {"list": product});
                          },
                          child: Text("Mua lại"),
                        ),
                      ),
                    ),
                  ],
                )
              : status == "Đã hủy"
                  ? Container(
                      padding: EdgeInsets.only(left: 140.sp),
                      child: FlatButton(
                        height: 35.sp,
                        minWidth: 120.sp,
                        padding: EdgeInsets.symmetric(vertical: 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          List<CartModel> product = [];
                          product.addAll((order.product
                              .map((e) => CartModel.fromMap1(e.toMap1()))
                              .toList()));
                          Get.toNamed(Routes.DETAIL_PAYMENT,
                              arguments: {"list": product});
                        },
                        child: Text("Mua lại"),
                      ),
                    )
                  : Container(),
        ],
      ),
    );
  }
}
