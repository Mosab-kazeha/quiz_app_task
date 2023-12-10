import 'package:flutter/material.dart';
import 'package:flutter_demo/component/utility_component.dart';
import 'package:flutter_demo/config/router.dart';
import 'package:flutter_demo/screen/all_question_bage.dart';
import 'package:flutter_demo/screen/login_bage.dart';
import '../model/base/answer_model.dart';
import '../model/request/create_question_model.dart';
import '../service/question_service.dart';

class AddOrUpdateQuestionScreen extends StatefulWidget {
  const AddOrUpdateQuestionScreen({Key? key}) : super(key: key);

  @override
  _AddOrUpdateQuestionScreenState createState() =>
      _AddOrUpdateQuestionScreenState();
}

TextEditingController questionController = TextEditingController();
TextEditingController firstAnswerController = TextEditingController();
TextEditingController secondAnswerController = TextEditingController();
TextEditingController thirdAnswerController = TextEditingController();
TextEditingController fourthAnswerController = TextEditingController();
TextEditingController timeAnswerController = TextEditingController();

bool? isFirstAnswerTrue = false;
bool? isSecondAnswerTrue = false;
bool? isThirdAnswerTrue = false;
bool? isFourthAnswerTrue = false;

class _AddOrUpdateQuestionScreenState extends State<AddOrUpdateQuestionScreen>
    with UtilityComponent {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF3BD6B),
      ),
      body: ListView(
        children: [
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.00, -0.02),
                end: Alignment(-1, 0.02),
                colors: [Color(0xFFDA8BD9), Color(0xFFF3BD6B)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 65,
                  child: TextField(
                    controller: questionController,
                    decoration: InputDecoration(
                      label: Text(
                        'Add Question',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.800000011920929),
                          fontSize: 15,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.white.withOpacity(0.4000000059604645),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.4000000059604645),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x11000000),
                        blurRadius: 15,
                        offset: Offset(0, 4),
                        spreadRadius: 4,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 32),
                        Row(
                          children: [
                            Checkbox(
                              value: isFirstAnswerTrue,
                              onChanged: (value) {
                                setState(() {
                                  isFirstAnswerTrue = !isFirstAnswerTrue!;
                                });
                              },
                            ),
                            textFieldAnswer(
                              controller: firstAnswerController,
                              title: "First Answer",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isSecondAnswerTrue,
                              onChanged: (value) {
                                setState(() {
                                  isSecondAnswerTrue = !isSecondAnswerTrue!;
                                });
                              },
                            ),
                            textFieldAnswer(
                              controller: secondAnswerController,
                              title: "Second Answer",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isThirdAnswerTrue,
                              onChanged: (value) {
                                setState(() {
                                  isThirdAnswerTrue = !isThirdAnswerTrue!;
                                });
                              },
                            ),
                            textFieldAnswer(
                              controller: thirdAnswerController,
                              title: "Third Answer",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isFourthAnswerTrue,
                              onChanged: (value) {
                                setState(() {
                                  isFourthAnswerTrue = !isFourthAnswerTrue!;
                                });
                              },
                            ),
                            textFieldAnswer(
                              controller: fourthAnswerController,
                              title: "Fourth Answer",
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 50),
                          child: Container(
                            width: 150,
                            height: 45,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: timeAnswerController,
                              decoration: InputDecoration(
                                hintText: "Time For Answer",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.white
                                        .withOpacity(0.4000000059604645),
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (addOrUpDate == true) {
                      Question().createNewQuestion(
                        newQestion: CreateQuestionModel(
                          question: questionController.text,
                          availabileTime: int.parse(timeAnswerController.text),
                          author: userNameController.text,
                          answers: [
                            AnswerModel(
                              answer: firstAnswerController.text,
                              isCorrect: isFirstAnswerTrue!,
                            ),
                            AnswerModel(
                              answer: secondAnswerController.text,
                              isCorrect: isSecondAnswerTrue!,
                            ),
                            AnswerModel(
                              answer: thirdAnswerController.text,
                              isCorrect: isThirdAnswerTrue!,
                            ),
                            AnswerModel(
                              answer: fourthAnswerController.text,
                              isCorrect: isFourthAnswerTrue!,
                            ),
                          ],
                        ),
                      );
                    } else {
                      Question().updateOldQuestion(
                        QuestionNumber!,
                        CreateQuestionModel(
                          question: questionController.text,
                          availabileTime: int.parse(timeAnswerController.text),
                          author: userNameController.text,
                          answers: [
                            AnswerModel(
                              answer: firstAnswerController.text,
                              isCorrect: isFirstAnswerTrue!,
                            ),
                            AnswerModel(
                              answer: secondAnswerController.text,
                              isCorrect: isSecondAnswerTrue!,
                            ),
                            AnswerModel(
                              answer: thirdAnswerController.text,
                              isCorrect: isThirdAnswerTrue!,
                            ),
                            AnswerModel(
                              answer: fourthAnswerController.text,
                              isCorrect: isFourthAnswerTrue!,
                            ),
                          ],
                        ),
                      );
                    }
                    router.go("/AllQuestionScreen");
                  },
                  child: Container(
                    width: 281,
                    height: 59,
                    child: Center(
                      child: Text(
                        'Coniform',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    decoration: ShapeDecoration(
                      color: Color(0xFF8D376F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
