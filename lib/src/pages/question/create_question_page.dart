import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:freshfood/src/pages/home/controllers/product_controller.dart';
import 'package:freshfood/src/pages/products/controllers/group_product_controller.dart';
import 'package:freshfood/src/pages/products/widget/drawer_layout.dart';
import 'package:freshfood/src/pages/question/controllers/question_controller.dart';
import 'package:freshfood/src/public/styles.dart';
import 'package:freshfood/src/repository/question_repository.dart';
import 'package:freshfood/src/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'controllers/group_question_controller.dart';

class CreateQuestionPage extends StatefulWidget {
  String idGroup;
  dynamic question;
  CreateQuestionPage({this.idGroup, this.question});
  @override
  State<StatefulWidget> createState() => _CreateQuestionPageState();
}

class _CreateQuestionPageState extends State<CreateQuestionPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final productController = Get.put(ProductController());
  ScrollController scrollController = ScrollController();
  TextEditingController _timeController = new TextEditingController();
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _answerAController = new TextEditingController();
  TextEditingController _answerBController = new TextEditingController();
  TextEditingController _answerCController = new TextEditingController();
  TextEditingController _answerDController = new TextEditingController();
  final _groupQuestionController = Get.put(GroupQuestionController());
  final _questionController = Get.put(QuestionController());

  int time;
  String title;
  String answerA;
  String answerB;
  String answerC;
  String answerD;
  bool isCorrectA = false;
  bool isCorrectB = false;
  bool isCorrectC = false;
  bool isCorrectD = false;

  @override
  initState() {
    super.initState();
    if (widget.question != null) {
      _timeController.text = widget.question['time'].toString();
      _titleController.text = widget.question['title'];
      _answerAController.text = widget.question['answerA'];
      _answerBController.text = widget.question['answerB'];
      _answerCController.text = widget.question['answerC'];
      _answerDController.text = widget.question['answerD'];
      isCorrectA = widget.question['isTrueA'];
      isCorrectB = widget.question['isTrueB'];
      isCorrectC = widget.question['isTrueC'];
      isCorrectD = widget.question['isTrueD'];
    }
  }

  Future<void> updateListQuestion() {
    _groupQuestionController.initialController();
    _groupQuestionController.getGroupQuestion();

    _questionController.initialController();
    _questionController.getAllQuestionByGroup(widget.idGroup);
  }

  Future<void> createQuestion() async {
    QuestionRepository()
        .createQuestion(
      time: time,
      groupQuestion: widget.idGroup,
      title: title,
      answerA: answerA,
      answerB: answerB,
      answerC: answerC,
      answerD: answerD,
      isCorrectA: isCorrectA,
      isCorrectB: isCorrectB,
      isCorrectC: isCorrectC,
      isCorrectD: isCorrectD,
    )
        .then((value) {
      Get.back();
      if (value == null) {
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'T???o th???t b???i',
          subTitle: 'Vui l??ng ki???m tra ????? c??c tr?????ng',
        );
        getSnackBar.show();
      } else {
        updateListQuestion();
        Get.back();
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'T???o th??nh c??ng',
          subTitle: 'T???o th??nh c??ng c??u h???i',
        );
        getSnackBar.show();
      }
    });
  }

  Future<void> updateQuestion() async {
    QuestionRepository()
        .updateQuestion(
      id: widget.question['_id'],
      time: int.parse(_timeController.text),
      groupQuestion: widget.idGroup,
      title: _titleController.text,
      answerA: _answerAController.text,
      answerB: _answerBController.text,
      answerC: _answerCController.text,
      answerD: _answerDController.text,
      isCorrectA: isCorrectA,
      isCorrectB: isCorrectB,
      isCorrectC: isCorrectC,
      isCorrectD: isCorrectD,
    )
        .then((value) {
      Get.back();
      if (value == null) {
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'C???p nh???t th???t b???i',
          subTitle: 'Vui l??ng ki???m tra ????? c??c tr?????ng',
        );
        getSnackBar.show();
      } else {
        updateListQuestion();
        Get.back();
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'C???p nh???t th??nh c??ng',
          subTitle: 'C???p nh???t th??nh c??ng c??u h???i',
        );
        getSnackBar.show();
      }
    });
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
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              PhosphorIcons.arrow_left,
              color: Colors.white,
              size: 7.w,
            ),
          ),
          title: Text(
            "T???o C??u h???i",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            height: 100.h,
            width: 100.w,
            child: ListView(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                      'Vui l??ng ??i???n ti??u ????? c??u h???i!',
                      "title",
                      '??i???n chi ti???t c??u h???i',
                      'Ti??u ????? c??u h???i',
                      PhosphorIcons.question,
                      _titleController,
                      false,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextFieldCheckBox(
                        'Vui l??ng ??i???n ????p ??n c??u A!',
                        "answerA",
                        '??i???n ????p ??n c???a c??u A',
                        '????p ??n A',
                        PhosphorIcons.book_open,
                        _answerAController,
                        isCorrectA),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextFieldCheckBox(
                        'Vui l??ng ??i???n ????p ??n c??u B!',
                        "answerB",
                        '??i???n ????p ??n c???a c??u B',
                        '????p ??n B',
                        PhosphorIcons.book_open,
                        _answerBController,
                        isCorrectB),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextFieldCheckBox(
                        'Vui l??ng ??i???n ????p ??n c??u C!',
                        "answerC",
                        '??i???n ????p ??n c???a c??u C',
                        '????p ??n C',
                        PhosphorIcons.book_open,
                        _answerCController,
                        isCorrectC),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextFieldCheckBox(
                        'Vui l??ng ??i???n ????p ??n c??u D!',
                        "answerD",
                        '??i???n ????p ??n c???a c??u D',
                        '????p ??n D',
                        PhosphorIcons.book_open,
                        _answerDController,
                        isCorrectD),
                    SizedBox(
                      height: 30.0,
                    ),
                    BuildTextField(
                        'Vui l??ng ??i???n th???i gian tr??? l???i c??u h???i!',
                        "time",
                        '??i???n th???i gian tr??? l???i',
                        'Th???i gian (gi??y)',
                        PhosphorIcons.timer,
                        _timeController,
                        true),
                    SizedBox(
                      height: 30.0,
                    ),
                    FlatButton(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (!isCorrectA &&
                                !isCorrectB &&
                                !isCorrectC &&
                                !isCorrectD) {
                              GetSnackBar getSnackBar = GetSnackBar(
                                title: 'T???o c??u h???i th???t b???i',
                                subTitle: 'Vui l??ng ch???n ????p ??n ????ng',
                              );
                              getSnackBar.show();
                              return;
                            }
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  );
                                },
                                barrierColor: Color(0x80000000),
                                barrierDismissible: false);
                            widget.question == null
                                ? createQuestion()
                                : updateQuestion();
                          }
                        },
                        child: Text(
                          widget.question == null ? 'T???o C??u h???i' : 'S???a',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  Material BuildTextField(
    String vali,
    dynamic type,
    String placeholder,
    String lable_text,
    IconData iconData,
    name_controller,
    bool number,
  ) {
    return Material(
      elevation: 20.0,
      shadowColor: kPrimaryColor.withOpacity(0.38),
      child: TextFormField(
        controller: name_controller == false ? null : name_controller,
        validator: (val) => val.trim().length == 0 ? vali : null,
        inputFormatters: [
          type != 'title'
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        onChanged: (val) {
          setState(() {
            if (type == "title")
              title = val.trim();
            else if (type == "time") time = int.tryParse(val.trim());
          });
        },
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        keyboardType: number ? TextInputType.number : null,
        decoration: InputDecoration(
          fillColor: Colors.black,
          hintText: placeholder,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          labelText: lable_text,
          prefixIcon: Container(
              child: new Icon(
            iconData,
            color: Colors.black,
          )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.black, width: 1)),
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Material BuildTextFieldCheckBox(String vali, dynamic type, String placeholder,
      String lable_text, IconData iconData, name_controller, bool isCorrect) {
    final _size = MediaQuery.of(context).size;

    return Material(
      elevation: 20.0,
      shadowColor: kPrimaryColor.withOpacity(0.38),
      child: Row(children: [
        Expanded(
          flex: 6,
          child: TextFormField(
            controller: name_controller == false ? null : name_controller,
            validator: (val) => val.trim().length == 0 ? vali : null,
            onChanged: (val) {
              setState(() {
                if (type == "answerA")
                  answerA = val.trim();
                else if (type == "answerB")
                  answerB = val.trim();
                else if (type == "answerC")
                  answerC = val.trim();
                else if (type == "answerD") answerD = val.trim();
              });
            },
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              fillColor: Colors.black,
              hintText: placeholder,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
              labelText: lable_text,
              prefixIcon: Container(
                  child: new Icon(
                iconData,
                color: Colors.black,
              )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black, width: 1)),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              child: isCorrect
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          if (type == 'answerA') {
                            isCorrectA = false;
                            isCorrect = false;
                          } else if (type == 'answerB') {
                            isCorrectB = false;
                            isCorrect = false;
                          } else if (type == 'answerC') {
                            isCorrectC = false;
                            isCorrect = false;
                          } else if (type == 'answerD') {
                            isCorrectD = false;
                            isCorrect = false;
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 6.sp),
                        child: Icon(
                          PhosphorIcons.check_circle,
                          size: _size.width / 6.5,
                          color: Colors.green,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          if (type == 'answerA') {
                            isCorrectA = true;
                            isCorrect = true;
                          } else if (type == 'answerB') {
                            isCorrectB = true;
                            isCorrect = true;
                          } else if (type == 'answerC') {
                            isCorrectC = true;
                            isCorrect = true;
                          } else if (type == 'answerD') {
                            isCorrectD = true;
                            isCorrect = true;
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 6.sp),
                        child: Icon(
                          PhosphorIcons.circle,
                          size: _size.width / 6.5,
                          color: Colors.green,
                        ),
                      ),
                    )),
        )
      ]),
    );
  }
}
