import 'package:freshfood/src/repository/question_repository.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  List<dynamic> listQuestion = [];
  String currentGroup;
  initialController() {
    listQuestion = [];
    currentGroup = '';
  }

  getAllQuestionByGroup(String id) {
    listQuestion = [];
    QuestionRepository().getAllQuestionByGroup(id).then((value) {
      if (value.isNotEmpty) {
        listQuestion.addAll(value);
        update();
        // question.addAll(value);
        // _listGroupQuestionController.add(groupQuestion);
      }
    });
  }
}
