import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/component/utility_component.dart';
import 'package:flutter_demo/config/router.dart';
import 'package:flutter_demo/model/response/question_model.dart';
import 'package:flutter_demo/screen/all_question_bage.dart';
import 'package:flutter_demo/service/question_service.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

num answerTime = 0;
double correctAnswer = 0;
double wrongAnswer = 0;

class _QuestionScreenState extends State<QuestionScreen> with UtilityComponent {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        answerTime++;

        ///problem whit stateful it start before the screen build AND future builder can not be with stateful///
      });
    });
  }

  @override
  void dispose() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        answerTime = 0;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Question().getOneQuestion("$QuestionNumber"),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              dynamic temp = snapshot.data;
              QuestionModel question = QuestionModel.fromMap(temp);
              question.availabileTime = answerTime;

              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: Color(0xFF8D376F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 70),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  router.go("/AllQuestionScreen");
                                },
                                child: Image.asset('images/Vector.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      Expanded(
                        child: ListView.builder(
                            itemCount: question.answers.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 48,
                                  vertical: 11,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    checkoutAnswer(
                                      question.answers[index].isCorrect,
                                      context,
                                      question.availabileTime,
                                      answerTime,
                                    );
                                  },
                                  child: Container(
                                    width: 240,
                                    height: 48,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 2.5,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside,
                                          color: Color(0xFF8D376F),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 21),
                                          child: Text(
                                            question.answers[index].answer,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF2B252C),
                                              fontSize: 20,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 190,
                    left: 28,
                    child: Container(
                      width: 340,
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        correctAnswer <= 9
                                            ? '0${correctAnswer.toInt()}'
                                            : '${correctAnswer.toInt()}',
                                        style: TextStyle(
                                          color: Color(0xFF1E8334),
                                          fontSize: 14,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    AnimatedContainer(
                                      width: 3 * correctAnswer,
                                      height: 10,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF1E8334),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      duration: Duration(seconds: 1),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                      width: 3 * wrongAnswer,
                                      height: 10,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFD05904),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      duration: Duration(seconds: 1),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        wrongAnswer <= 9
                                            ? '0${wrongAnswer.toInt()}'
                                            : '${wrongAnswer.toInt()}',
                                        style: TextStyle(
                                          color: Color(0xFFD05904),
                                          fontSize: 14,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Question $QuestionNumber',
                            style: TextStyle(
                              color: Color(0xFFA32EC1),
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            question.question,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF2B252C),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.00, -0.02),
                          end: Alignment(-1, 0.02),
                          colors: [Color(0xFFDA8BD9), Color(0xFFF3BD6B)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 153,
                    left: 165,
                    child: Container(
                      width: 67,
                      height: 67,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Color(0xFF8D376F),
                        ),
                      ),
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-0.01, -1.00),
                          end: Alignment(0.01, 1),
                          colors: [Color(0xFFDA8BD9), Color(0xFFF3BD6B)],
                        ),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 172,
                    left: 185,
                    child: Text(
                      question.availabileTime <= 9
                          ? "0${question.availabileTime.toString()}"
                          : question.availabileTime <= 99
                              ? question.availabileTime.toString()
                              : "Out",
                      style: TextStyle(
                        color: Color(0xFF8D376F),
                        fontSize: 20,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF8D376F),
                ),
              );
            }
          }),
    );
  }
}
