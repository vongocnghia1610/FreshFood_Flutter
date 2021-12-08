import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:freshfood/src/models/address.dart';
import 'package:freshfood/src/models/user.dart';
import 'package:freshfood/src/repository/admin_repository.dart';
import 'package:freshfood/src/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminController extends GetxController {
  List<UserModel> listUser = [];
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  List<BarChartGroupData> listOrderNumber = [];
  List<FlSpot> listOrderMoney = [];
  List<dynamic> listProduct = [];
  getAllUser({String search, int skip, int limit}) {
    AdminRepository().getAllUser(search, skip, limit).then((value) {
      if (value.isNotEmpty) {
        listUser = value.map((data) => UserModel.fromMap(data)).toList();
        update();
      }
    });
  }

  statisticOrder(dateStart, dateEnd) {
    String timeStart = '${dateStart.year}-${dateStart.month}-${dateStart.day}';
    String timeEnd = '${dateEnd.year}-${dateEnd.month}-${dateEnd.day}';
    AdminRepository().getstatisticOrder(timeStart, timeEnd).then((value) {
      if (value.isNotEmpty) {
        print(value.length);
        // listOrderNumber = makeGroupData(value);
        // print(listOrderNumber.length);
        // update();
        final Color leftBarColor = const Color(0xff53fdd7);
        final Color rightBarColor = const Color(0xffff5182);
        int i = 0;
        for (i = 0; i < 7; i++) {
          listOrderNumber.add(makeGroupData(
              i, double.parse(value[i]['totalOrder'].toString())));
          listOrderMoney.add(
            FlSpot(double.parse(i.toString()),
                double.parse(value[i]['totalMoney'].toString())),
          );
          print('otrongne');
          update();
        }
        // value.forEach((element) {});
        print(listOrderNumber.length);
        update();
        print('end');
      }
    });
  }

  statisticProduct() {
    AdminRepository().getstatisticProduct().then((value) {
      listProduct = value;
      update();
    });
  }

  // List<BarChartGroupData> makeGroupData(List<dynamic> listData) {
  //   List<BarChartGroupData> result = [];
  //   final Color leftBarColor = const Color(0xff53fdd7);
  //   final Color rightBarColor = const Color(0xffff5182);
  //   listData.asMap().forEach((index, element) {
  //     result.add(BarChartGroupData(barsSpace: 4, x: index, barRods: [
  //       BarChartRodData(
  //         y: double.tryParse(element['totalOrder'].toString()),
  //         colors: [leftBarColor],
  //         width: 20.sp,
  //       ),
  //     ]));
  //     return result;
  //   });
  // }
  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: 20.sp,
      ),
    ]);
  }
}
