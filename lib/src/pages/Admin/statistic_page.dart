import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freshfood/src/helpers/money_formatter.dart';
import 'package:freshfood/src/pages/Admin/controller/admin_controller.dart';
import 'package:freshfood/src/pages/Admin/widget/drawer_layout_admin.dart';
import 'package:freshfood/src/pages/Admin/widget/indicatior.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class StatisticAdminPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StatisticAdminPageState();
}

class StatisticAdminPageState extends State<StatisticAdminPage> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  bool isOrder = true;
  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final adminController = Get.put(AdminController());
  int touchedGroupIndex = -1;
  List<String> listTime = [];
  List<dynamic> listStatisticOrder = [];
  int touchedIndex = -1;
  DateTime dateEnd = DateTime.now();
  DateTime dateStart = DateTime.now().subtract(Duration(days: 6));

  @override
  void initState() {
    super.initState();

    for (int i = 6; i >= 0; i--) {
      var time = dateEnd.subtract(Duration(days: i));
      listTime.add('${time.day}/${time.month}');
    }
    adminController.initialController();
    adminController.statisticOrder(dateStart, dateEnd);
    adminController.statisticProduct();
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.LIGHT,
      key: _scaffoldKey,
      drawer: Container(
        width: 70.w,
        child: Drawer(
          child: DrawerLayoutAdmin(status: 7),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: Text(
          'Thống kê',
          style: TextStyle(
            color: Colors.white,
            fontSize: _size.width / 20.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 5.sp),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 30.sp,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isOrder = !isOrder;
                  });
                },
                child: Text(
                  'Đơn hàng',
                  style: isOrder
                      ? TextStyle(color: Colors.black, fontSize: 20.sp)
                      : TextStyle(color: Color(0xff77839a), fontSize: 15.sp),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '/',
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isOrder = !isOrder;
                  });
                },
                child: Text(
                  'Sản phẩm',
                  style: isOrder
                      ? TextStyle(color: Color(0xff77839a), fontSize: 15.sp)
                      : TextStyle(color: Colors.black, fontSize: 20.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          isOrder ? OrderWidget() : ProductWidget()
        ],
      ),
    );
  }

  Widget ProductWidget() {
    return GetBuilder<AdminController>(
      init: adminController,
      builder: (_) => _.listProduct.length == 0
          ? Container()
          : AspectRatio(
              aspectRatio: 0.6.sp,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50.w,
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                              pieTouchData: PieTouchData(touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection.touchedSectionIndex;
                                });
                              }),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 40,
                              sections: showingSections(_)),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.w),
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Indicator(
                            color: Color(0xff0293ee),
                            text: _.listProduct[0]['name'],
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xfff8b250),
                            text: _.listProduct[1]['name'],
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xff845bef),
                            text: _.listProduct[2]['name'],
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xff13d38e),
                            text: _.listProduct[3]['name'],
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget OrderWidget() {
    return GetBuilder<AdminController>(
        init: adminController,
        builder: (_) => Column(
              children: [
                Text(
                  'Doanh thu',
                  style: TextStyle(color: Color(0xff77839a), fontSize: 15.sp),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                dateStart == null || dateEnd == null
                    ? SizedBox()
                    : Text(
                        DateFormat("dd/MM/yyyy").format(dateStart).toString() +
                            ' - ' +
                            DateFormat("dd/MM/yyyy").format(dateEnd).toString(),
                        style: TextStyle(
                            color: Color(0xff77839a), fontSize: 15.sp),
                      ),
                _.listOrderMoney == null
                    ? Container()
                    : Container(
                        child: Stack(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 1.7,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(13.sp),
                                  ),
                                  // color: Color(0xff232d37)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 15.sp,
                                      left: 10.sp,
                                      top: 20.sp,
                                      bottom: 10.sp),
                                  child: LineChart(
                                    mainData(_),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              height: 34,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    showAvg = !showAvg;
                                  });
                                },
                                child: Text(
                                  'avg',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: showAvg
                                          ? Colors.white.withOpacity(0.5)
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 30.sp),
                _buildLineInfo('Tổng đơn hàng:', _.totalOrderNumber.toString()),
                _buildLineInfo('Tổng thu nhập:',
                    formatMoney(double.parse(_.totalOrderMoney.toString()))),
              ],
            ));
  }

  LineChartData mainData(AdminController _) {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1.sp,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 10.sp,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 13.sp),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return listTime[1];
              case 3:
                return listTime[3];
              case 5:
                return listTime[5];
            }
            return '';
          },
          margin: 5.sp,
        ),
        // leftTitles: SideTitles(
        //   showTitles: true,
        //   interval: 1,
        //   getTextStyles: (context, value) => TextStyle(
        //     color: Color(0xff67727d),
        //     fontWeight: FontWeight.bold,
        //     fontSize: 13.sp,
        //   ),
        //   getTitles: (value) {
        //     switch (value.toInt()) {
        //       case 1:
        //         return '10k';
        //       case 3:
        //         return '30k';
        //       case 5:
        //         return '50k';
        //     }
        //     return '';
        //   },
        //   reservedSize: 25.sp,
        //   margin: 10.sp,
        // ),
      ),
      // borderData: FlBorderData(
      //     show: true,
      //     border: Border.all(color: const Color(0xff37434d), width: 1.sp)),
      minX: 0,
      // maxX: 6,
      minY: 0,
      // maxY: 6,

      lineBarsData: [
        LineChartBarData(
          spots: _.listOrderMoney,
          isCurved: false,
          colors: gradientColors,
          barWidth: 2.sp,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(AdminController _) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: double.tryParse((_.listProduct[0]['sold'].toString())),
            title: _.listProduct[0]['sold'].toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: double.tryParse((_.listProduct[1]['sold'].toString())),
            title: _.listProduct[1]['sold'].toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: double.tryParse((_.listProduct[2]['sold'].toString())),
            title: _.listProduct[2]['sold'].toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: double.tryParse((_.listProduct[3]['sold'].toString())),
            title: _.listProduct[3]['sold'].toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }

  Widget _buildLineInfo(title, value) {
    return Container(
      padding: EdgeInsets.only(top: 20.sp, left: 14.sp, right: 12.sp),
      margin: EdgeInsets.only(bottom: 15.sp),
      child: Row(
        children: [
          Expanded(
            flex: 1,
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
            flex: 1,
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
