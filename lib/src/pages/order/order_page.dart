import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/models/order.dart';
import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/pages/order/pages/first_page.dart';
import 'package:flutter_postman_application/src/pages/payment/widget/default_button.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:flutter_postman_application/src/routes/app_pages.dart';
import 'package:flutter_svg/avd.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  List<OrderModel> orders = [
    OrderModel(
      shipFee: 12000,
      orderCode: "FF-122321",
      totalMoney: 212000,
      product: [
        ProductModel(image: [
          "https://cdn.vietnambiz.vn/zoom/700_438/171464876016439296/2021/10/25/gia-thit-heo-25-thang-10-16351232233521617642329-0-0-493-740-crop-1635123229345460187675.jpg"
        ], price: 200000, name: "Thịt heo nhập khẩu từ Mỹ", quantity: 2)
      ],
    ),
    OrderModel(
      shipFee: 12000,
      orderCode: "FF-10000",
      totalMoney: 131000,
      product: [
        ProductModel(image: [
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png"
        ], price: 120000, name: "Thịt bò nhập khẩu từ Mỹ", quantity: 2),
        ProductModel(image: [
          "https://vinmec-prod.s3.amazonaws.com/images/20191112_133536_897440_thit-bo.max-1800x1800.png"
        ], price: 120000, name: "Thịt bò nhập khẩu từ Mỹ", quantity: 2)
      ],
    ),
  ];
  List<Widget> _pages = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  List<OrderModel> listOrder = [OrderModel()];
  List<String> statusOrder = [
    "Chờ xác nhận",
    "Đã xác nhận",
    "Đang giao",
    "Đã giao",
    "Đã hủy"
  ];
  int selectedStatus = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: statusOrder.length,
      initialIndex: 0,
    );
    _pages = [
      FirstPage(orders: orders),
      FirstPage(orders: orders),
      FirstPage(orders: orders),
      FirstPage(orders: orders),
      FirstPage(orders: orders),
    ];
    Future.delayed(Duration(seconds: 2), () async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            PhosphorIcons.arrow_left,
            color: Colors.white,
            size: 8.w,
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(
            left: 5.sp,
          ),
          child: Text(
            "Đơn Hàng",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              PhosphorIcons.magnifying_glass,
              size: 7.w,
            ),
          ),
          IconButton(
            onPressed: () => {Get.toNamed(Routes.CHAT)},
            icon: Icon(
              PhosphorIcons.messenger_logo,
              size: 7.w,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              labelColor: kPrimaryColor,
              indicatorColor: Colors.green[600],
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
              tabs: [
                Container(
                  width: 25.w,
                  child: Tab(
                    text: statusOrder[0],
                  ),
                ),
                Container(
                  width: 25.w,
                  child: Tab(
                    text: statusOrder[1],
                  ),
                ),
                Container(
                  width: 20.w,
                  child: Tab(
                    text: statusOrder[2],
                  ),
                ),
                Container(
                  width: 15.w,
                  child: Tab(
                    text: statusOrder[3],
                  ),
                ),
                Container(
                  width: 15.w,
                  child: Tab(
                    text: statusOrder[4],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _pages.map((Widget tab) {
                return tab;
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
