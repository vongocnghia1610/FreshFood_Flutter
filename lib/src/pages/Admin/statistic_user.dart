import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'controller/admin_controller.dart';

class StatisticUser extends StatefulWidget {
  final String id;
  StatisticUser({this.id});

  @override
  State<StatefulWidget> createState() => _StatisticUserState();
}

class _StatisticUserState extends State<StatisticUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final adminController = Get.put(AdminController());

  @override
  void initState() {
    super.initState();
    adminController.statisticUser(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            "Thống kê khách hàng",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.sp),
          child: Column(
            children: [
              Container(
                child: Image.network(
                  "https://vanchuyentrungquoc247.com/wp-content/uploads/2015/04/icon-3.png",
                  fit: BoxFit.cover,
                  width: 250.sp,
                  height: 250.sp,
                ),
              ),
              _buildLineInfo(
                'Tổng đơn hàng đã đặt: ',
                adminController.resultStatisticUser['totalOrder'] == null
                    ? 0.toString()
                    : adminController.resultStatisticUser['totalOrder']
                        .toString(),
              ),
              _buildLineInfo(
                'Tổng tiền tất cả đơn hàng: ',
                adminController.resultStatisticUser['totalMoney'] == null
                    ? 0.toString()
                    : adminController.resultStatisticUser['totalMoney']
                        .toString(),
              ),
            ],
          ),
        ));
  }

  Widget _buildLineInfo(title, value) {
    return Container(
      padding: EdgeInsets.only(top: 20.sp, left: 14.sp, right: 12.sp),
      margin: EdgeInsets.only(bottom: 15.sp),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              title,
              style: TextStyle(
                color: colorPrimary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: colorTitle,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
