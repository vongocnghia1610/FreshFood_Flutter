import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/models/order.dart';
import 'package:freshfood/src/models/product.dart';
import 'package:freshfood/src/pages/order/controller/order_controller.dart';
import 'package:freshfood/src/pages/order/pages/first_page.dart';
import 'package:freshfood/src/pages/order/pages/first_page_admin.dart';
import 'package:freshfood/src/pages/payment/widget/default_button.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:flutter_svg/avd.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OrderPageAdmin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderPageAdminState();
}

class _OrderPageAdminState extends State<OrderPageAdmin>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  final orderController = Get.put(OrderController());
  List<Widget> _pages = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
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
    orderController.getOrderByAdmin(search: '', limit: 10, skip: 1);
    // _pages = [
    //   FirstPage(orders: orderController.list0, status: statusOrder[0]),
    //   FirstPage(orders: orderController.list1, status: statusOrder[1]),
    //   FirstPage(orders: orderController.list2, status: statusOrder[2]),
    //   FirstPage(orders: orderController.list3, status: statusOrder[3]),
    //   FirstPage(orders: orderController.list4, status: statusOrder[4]),
    // ];

    // Future.delayed(Duration(seconds: 2), () async {});
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
            "Quản lý đơn hàng",
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
            child: GetBuilder(
              init: orderController,
              builder: (_) => TabBarView(
                controller: _tabController,
                children: [
                  FirstPageAdmin(
                      orders: orderController.list0, status: statusOrder[0]),
                  FirstPageAdmin(
                      orders: orderController.list1, status: statusOrder[1]),
                  FirstPageAdmin(
                      orders: orderController.list2, status: statusOrder[2]),
                  FirstPageAdmin(
                      orders: orderController.list3, status: statusOrder[3]),
                  FirstPageAdmin(
                      orders: orderController.list4, status: statusOrder[4]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
