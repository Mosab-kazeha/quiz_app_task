import 'package:dio/dio.dart';
import 'package:flutter_demo/model/request/create_question_model.dart';
import 'package:flutter_demo/service/base_service.dart';

abstract class QuestionService extends BaseService {
  /*Future<List<QuestionModel>>*/ getAllQuestion();
  /*Future<QuestionModel>*/ getOneQuestion(String id);
  createNewQuestion({required CreateQuestionModel newQestion});
  updateOldQuestion(String id, CreateQuestionModel newQestion);
  deleteQuestion(String id);
}

class Question extends QuestionService {
  @override
  createNewQuestion({required CreateQuestionModel newQestion}) async {
    Response response = await dio.post(
        "https://653e6cc99e8bd3be29df4853.mockapi.io/question",
        data: newQestion.toJson());
  }

  @override
  deleteQuestion(String id) async {
    Response response = await dio
        .delete("https://653e6cc99e8bd3be29df4853.mockapi.io/question/$id");

    return response.statusCode;
  }

  @override
  getAllQuestion() async {
    Response response =
        await dio.get("https://653e6cc99e8bd3be29df4853.mockapi.io/question");

    return response;
  }

  @override
  getOneQuestion(String id) async {
    Response response = await dio
        .get("https://653e6cc99e8bd3be29df4853.mockapi.io/question/$id");

    return response.data;
  }

  @override
  updateOldQuestion(String id, CreateQuestionModel newQestion) async {
    Response response = await dio.post(
        "https://653e6cc99e8bd3be29df4853.mockapi.io/question/$id",
        data: newQestion.toJson());
  }
}
