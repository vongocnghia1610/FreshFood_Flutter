import 'dart:async';
import 'package:freshfood/src/repository/group_product_repository.dart';
import 'package:freshfood/src/repository/group_question_repository.dart';
import 'package:get/get.dart';

class GroupQuestionController extends GetxController {
  List<dynamic> groupQuestion = [];
  dynamic selected = {};
  StreamController<List<dynamic>> _listGroupQuestionController =
      StreamController<List<dynamic>>.broadcast();

  initialController() {
    groupQuestion = [];
    selected = {};
  }

  getGroupQuestion() {
    GroupQuestionRepository().getGroupQuestion().then((value) {
      print("zodiml");
      print(value);
      if (value.isNotEmpty) {
        groupQuestion.addAll(value);
        _listGroupQuestionController.add(groupQuestion);
      }
    });
  }

  Stream<List<dynamic>> get listGroupQuestion =>
      _listGroupQuestionController.stream;
}
