import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/pages/Admin/controller/admin_controller.dart';
import 'package:freshfood/src/pages/discount/controllers/discount_controlller.dart';
import 'package:freshfood/src/pages/products/controllers/group_product_controller.dart';
import 'package:freshfood/src/pages/question/controllers/group_question_controller.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/repository/admin_repository.dart';
import 'package:freshfood/src/repository/discount_repository.dart';
import 'package:freshfood/src/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String grQuestion;
  final _groupQuestion = Get.put(GroupQuestionController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _groupQuestion.initialController();
    _groupQuestion.getGroupQuestion();
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
          'Danh sách câu hỏi',
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
              Image(
                image: AssetImage('assets/images/quizz.png'),
                height: 30.h,
                fit: BoxFit.fill,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.sp, bottom: 10.sp, right: 60.w),
                child: Text(
                  "Các bộ câu hỏi: ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              StreamBuilder(
                  stream: _groupQuestion.listGroupQuestion,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Material(
                          elevation: 20.0,
                          shadowColor: kPrimaryColor.withOpacity(0.38),
                          child: DropdownSearch<dynamic>(
                            mode: Mode.MENU,
                            label: "Bộ câu hỏi",
                            onChanged: print,
                          ));
                    }

                    List<String> listOption = (snapshot.data as List<dynamic>)
                        .map((e) => e['title'].toString())
                        .toList();

                    return Container(
                      width: 100.w,
                      child: Material(
                          elevation: 20.0,
                          shadowColor: kPrimaryColor.withOpacity(0.38),
                          child: DropdownSearch(
                            items: listOption,
                            onChanged: (val) {
                              List<dynamic> data = snapshot.data;
                              int index = data.indexWhere(
                                  (element) => element['title'] == val);
                              if (index != -1) {
                                grQuestion = data[index]['id'];
                              }
                            },
                            label: "Bộ câu hỏi",
                          )),
                    );
                  }),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.sp, bottom: 3.sp),
                    child: Text(
                      "Tổng số câu hỏi: ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.sp, right: 10.sp),
                    width: 20.w,
                    child: Text(
                      "20",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 23.w, top: 4.sp),
                    child: IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        PhosphorIcons.plus_circle,
                        color: Color(0xFF2C3D50),
                        size: _size.width / 12,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
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
                        child: const Text(
                          'Đố bạn con gì?',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                        child: const Text('Đố bạn con gì?',
                            maxLines: 1, overflow: TextOverflow.ellipsis),
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
                        child: const Text('Đố bạn con gì?',
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
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
}
