import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/user.dart';
import 'package:flutter_postman_application/src/pages/payment/widget/default_button.dart';
import 'package:flutter_postman_application/src/pages/products/widget/drawer_layout.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class ManagerUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ManagerUserState();
}

class _ManagerUserState extends State<ManagerUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int value = 0;
  final paymentLables = [
    'Thanh toán bằng PayPal',
    'Thanh toán bằng VNPay',
    'Thanh toán khi nhận hàng'
  ];
  final paymentIconss = [
    'assets/icons/paypal-logo.png',
    'assets/icons/vn-pay.jpg',
    'assets/icons/COD.png'
  ];
  List<UserModel> listCustomer = [
    UserModel(
        id: "abc",
        email: "duynao4",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg"),
    UserModel(
        id: "bdf",
        email: "duynao5",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg"),
    UserModel(
        id: "glh",
        email: "duynao6",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg"),
    UserModel(
        id: "glh",
        email: "duynao7",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg"),
    UserModel(
        id: "glh",
        email: "duynao8",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg"),
    UserModel(
        id: "glh",
        email: "duynao9",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg"),
    UserModel(
        id: "glh",
        email: "duynao10",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg"),
    UserModel(
        id: "glh",
        email: "duynao11",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg"),
    UserModel(
        id: "glh",
        email: "duynao12",
        phone: "0968356159",
        avatar:
            "https://vtv1.mediacdn.vn/zoom/550_339/2019/7/16/spider-man-far-from-home-og-size-imagecmti-15632378070951222687900.jpg")
  ];
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
            "Quản Lý người dùng",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25.sp, top: 20.sp),
                  child: FlatButton(
                    height: 30.sp,
                    minWidth: 120.sp,
                    padding: EdgeInsets.symmetric(vertical: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    child: Text("Khách Hàng"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 18.sp, top: 20.sp),
                  child: FlatButton(
                    height: 30.sp,
                    minWidth: 120.sp,
                    padding: EdgeInsets.symmetric(vertical: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    child: Text("Nhân Viên"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: listCustomer.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(children: [
                    SizedBox(height: 60.sp),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(listCustomer[index].avatar),
                    ),
                    SizedBox(width: 10.sp),
                    Container(
                      child: Text(
                        listCustomer[index].email,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      width: 100.sp,
                    ),
                    SizedBox(width: 30.sp),
                    Icon(
                      PhosphorIcons.notepad,
                      size: 25.sp,
                    ),
                    SizedBox(width: 30.sp),
                    Icon(
                      PhosphorIcons.chart_line,
                      size: 25.sp,
                    )
                  ]);
                },
              ),
            ),
          ],
        ));
  }
}
