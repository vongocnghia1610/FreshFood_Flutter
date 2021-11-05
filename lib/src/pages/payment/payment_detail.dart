import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/models/cart.dart';
import 'package:freshfood/src/models/order.dart';
import 'package:freshfood/src/models/product.dart';
import 'package:freshfood/src/pages/payment/widget/default_button.dart';
import 'package:freshfood/src/pages/products/widget/drawer_layout.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PaymentDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();

  List<CartModel> listCart = [
    CartModel(
        image: [
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png",
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png"
        ],
        quantity: 2,
        cost: 130000,
        name: "Thịt heo nhập khẩu từ Mỹ",
        nameGroup: "Đồ tươi sống"),
    CartModel(
        image: [
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png",
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png"
        ],
        quantity: 2,
        cost: 130000,
        name: "Thịt bò nhập khẩu từ Mỹ",
        nameGroup: "Đồ tươi sống"),
    CartModel(
        image: [
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png",
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png"
        ],
        quantity: 2,
        cost: 130000,
        name: "Thịt bò nhập khẩu từ Mỹ",
        nameGroup: "Đồ tươi sống"),
    CartModel(
        image: [
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png",
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png"
        ],
        quantity: 2,
        cost: 130000,
        name: "Thịt bò nhập khẩu từ Mỹ",
        nameGroup: "Đồ tươi sống"),
  ];
  double heighContainer;
  @override
  void initState() {
    super.initState();
    heighContainer = 95.sp * listCart.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: 70.w,
          child: Drawer(
            child: DrawerLayout(),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              PhosphorIcons.arrow_left,
              color: Colors.white,
              size: 7.w,
            ),
          ),
          title: Text(
            "Thanh Toán",
            style: TextStyle(fontSize: 17.sp),
          ),
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.greenAccent,
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(
                      top: 25.0,
                    ),
                    child: Row(children: [
                      Icon(
                        PhosphorIcons.map_pin_line,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 16.sp,
                      ),
                      Expanded(
                        child: Text(
                          'Địa Chỉ: Chung cư opal garden đường số 20 - Phường hiệp bình chánh - Thủ đức',
                          style: TextStyle(
                            // color: colorTitle,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  height: heighContainer,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: listCart.length,
                    itemBuilder: (context, index) {
                      return CartDetail(
                        cartModel: listCart[index],
                      );
                    },
                  ),
                ),

                // cart image
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    top: 25.0,
                    bottom: 12.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.note,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        'Tin nhắn:',
                        style: TextStyle(
                          // color: colorTitle,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Expanded(
                          child: TextField(
                        textAlign: TextAlign.end,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Nhập ghi chú cho đơn hàng',
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      )),
                      SizedBox(
                        width: 10.sp,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    top: 25.0,
                    bottom: 12.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.money,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        'Tổng Số tiền:',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        'đ425000',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    top: 25.0,
                    bottom: 12.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            PhosphorIcons.currency_circle_dollar,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Text(
                            'Phương thức thanh toán:',
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(fontSize: 12.sp),
                              ),
                              child: Text(
                                'Phương thức thanh toán',
                                maxLines: 3,
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Row(
                        children: [
                          Text(
                            'Tổng tiền hàng:',
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 110.sp,
                          ),
                          Text(
                            'đ225000',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Row(children: [
                        Text(
                          'Tổng phí vận chuyển:',
                          style: TextStyle(
                            // color: colorTitle,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 80.sp,
                        ),
                        Text(
                          'đ200000',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Row(children: [
                        Text(
                          'Tổng thanh toán:',
                          style: TextStyle(
                            // color: colorTitle,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 80.sp,
                        ),
                        Text(
                          'đ425000',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
                DefaultButton(
                  btnText: 'Đồng ý',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ));
  }
}

class CartDetail extends StatelessWidget {
  CartModel cartModel;
  CartDetail({Key key, this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.sp,
      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
      margin: EdgeInsets.only(
        top: 20.sp,
      ),
      child: Container(
        padding: EdgeInsets.only(bottom: 5.sp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border:
              Border(bottom: BorderSide(color: Colors.black45, width: 1.sp)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.sp,
            ),
            Container(
              child: Image.network(
                cartModel.image[0],
                height: 60.sp,
                width: 60.sp,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
              child: Column(
                children: [
                  Text("[FF-0000012] Thịt heo nhập khẩu",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.only(left: 170.sp, top: 5.sp),
                    child: Text(
                      "x2",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 120.sp, top: 5.sp),
                    child: Text(
                      "đ120000",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
