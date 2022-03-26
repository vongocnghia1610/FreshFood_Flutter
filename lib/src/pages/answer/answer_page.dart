import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/pages/Admin/controller/admin_controller.dart';
import 'package:freshfood/src/pages/discount/controllers/discount_controlller.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/repository/admin_repository.dart';
import 'package:freshfood/src/repository/discount_repository.dart';
import 'package:freshfood/src/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AnswerPage extends StatefulWidget {
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  final _formKey = GlobalKey<FormState>();
  FocusNode textFieldFocus = FocusNode();
  final discountController = Get.put(DiscountController());

  bool hidePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    discountController.initDateTime();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: .0,
        backgroundColor: Colors.green.shade50,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            PhosphorIcons.arrow_left,
            color: Color(0xFF2C3D50),
            size: _size.width / 15.0,
          ),
        ),
        title: Text(
          'Câu đố',
          style: TextStyle(
            color: Color(0xFF2C3D50),
            fontSize: _size.width / 20.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
              .95,
              .0,
            ), // 10% of the width, so there are ten blinds.
            colors: [
              Colors.green.shade50,
              Colors.white,
            ], // red to yellow
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.all(3),
          height: 10.h,
          width: 18.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.transparent)),
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage('images/board.jpg'),
                    height: 30.h,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: 60.w,
                    margin: EdgeInsets.only(top: 4.h, left: 17.w),
                    child: Center(
                        child: Text(
                      "Câu hỏi 1/7 ",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    width: 60.w,
                    margin: EdgeInsets.only(top: 10.h, left: 20.w),
                    child: Center(
                      child: Text(
                        "Nơi nào đẹp nhất việt nam? ",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.sp, bottom: 3.sp),
                        child: Text(
                          "Trả lời: ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3.sp),
                        child: Text(
                          "Đúng: 100 xu | Sai: 50 xu",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.sp),
                    margin: EdgeInsets.only(left: 20.sp, bottom: 3.sp),
                    child: Image(
                      image: AssetImage('images/icon-money.png'),
                      height: 7.h,
                      width: 7.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.sp, right: 10.sp),
                    width: 20.w,
                    child: Text(
                      "10000 xu",
                      style: TextStyle(fontSize: 14.sp, color: Colors.green),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border(
                      left: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      top: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      right: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                    )),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {},
                  child: const Text('A. Gradient'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border(
                      left: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      top: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      right: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                    )),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {},
                  child: const Text('B. Gradient'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border(
                      left: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      top: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      right: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                    )),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {},
                  child: const Text('C. Gradient'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border(
                      left: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      top: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                      right: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                    )),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {},
                  child: const Text('D. Gradient'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
