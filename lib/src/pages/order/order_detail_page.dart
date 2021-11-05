import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/pages/payment/widget/default_button.dart';
import 'package:freshfood/src/pages/products/widget/drawer_layout.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
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
            "Thông tin đơn hàng",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.teal[300],
                  margin: EdgeInsets.only(
                    bottom: 15.0,
                  ),
                  child: Row(children: [
                    Column(children: [
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        'Đơn hàng đã hoàn thành',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        height: 60.sp,
                        width: 200.sp,
                        padding: EdgeInsets.only(left: 30.sp),
                        child: Text(
                          'Cảm ơn bạn đã lựa chọn FreshFood. Chúc bạn một ngày tốt lành và nhớ đánh giá nhé!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                    SizedBox(
                      width: 30.sp,
                    ),
                    Container(
                      child: Icon(
                        Icons.checklist_outlined,
                        size: 40.sp,
                        color: Colors.white,
                      ),
                    )
                  ]),
                ),
                // cart image
                Container(
                  padding: EdgeInsets.only(top: 5.sp, left: 17.sp),
                  child: Row(
                    children: [
                      Icon(PhosphorIcons.truck),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text("Thông tin vận chuyển",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 72.sp,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(fontSize: 14.sp),
                        ),
                        child: Text(
                          'Xem',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
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
                        'Địa chỉ nhận hàng',
                        style: TextStyle(
                          // color: colorTitle,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(children: [
                    SizedBox(
                      width: 35.sp,
                    ),
                    Column(children: [
                      Container(
                        width: 210.sp,
                        child: Text(
                          'Nguyễn Phan Nhật Tú',
                          style: TextStyle(
                            // color: colorTitle,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        width: 210.sp,
                        child: Text(
                          '(+84) 0968356159',
                          style: TextStyle(
                            // color: colorTitle,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: 210.sp,
                        child: Text(
                          'Chung cư opal garden đường số 20 - Phường hiệp bình chánh - Thủ đức',
                          style: TextStyle(
                            // color: colorTitle,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ]),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                  margin: EdgeInsets.only(
                    top: 25.0,
                  ),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        // print(order);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5.sp),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black45, width: 1.sp)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.sp,
                            ),
                            Image.network(
                              "https://cdn.tgdd.vn/2021/07/content/100gr-thit-heo-bao-nhieu-calo-an-thit-heo-co-tot-khong-va-luu-y-khi-an-2-800x467.jpg",
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
                                  Text("[FF-0000012] Thịt heo nhập khẩu",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 170.sp, top: 5.sp),
                                    child: Text(
                                      "x2",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 120.sp, top: 5.sp),
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
                            Icon(PhosphorIcons.caret_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Thành Tiền:',
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 125.sp,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10.sp),
                            child: Text(
                              'đ2000000',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.wallet_bold,
                        size: 20.sp,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 55.sp,
                      ),
                      Text(
                        'Phương thức thanh toán: PayPal',
                        style: TextStyle(
                          // color: colorTitle,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mã Đơn Hàng:',
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 100.sp,
                          ),
                          Text(
                            'FF-0000001',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 5.sp,
                      ),
                      Row(
                        children: [
                          Text(
                            'Thời gian đặt hàng:',
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Text(
                            '12-10-2021 16:32',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 5.sp,
                      ),
                      Row(
                        children: [
                          Text(
                            'Thời gian thanh toán:',
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 40.sp,
                          ),
                          Text(
                            '12-10-2021 16:32',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              // color: colorTitle,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DefaultButton(
                  btnText: 'Mua Lại',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ));
  }
}
