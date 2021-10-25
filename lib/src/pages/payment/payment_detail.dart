import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/pages/payment/widget/default_button.dart';
import 'package:flutter_postman_application/src/pages/products/widget/drawer_layout.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class PaymentDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
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
            icon: const Icon(
              PhosphorIcons.arrow_circle_left_bold,
              color: Colors.white,
            ),
            onPressed: () => {},
            iconSize: 30,
          ),
          title: Text(
            "Thanh Toán",
            style: TextStyle(fontSize: 20),
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
                      bottom: 12.0,
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
                // cart image
                Container(
                  height: 150.sp,
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
