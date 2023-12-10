import 'package:flutter/material.dart';
import 'package:flutter_demo/model/response/question_model.dart';
import 'package:flutter_demo/service/question_service.dart';
import 'package:go_router/go_router.dart';

String? QuestionNumber;
int? NumberQuestion;

class AllQuestionScreen extends StatelessWidget {
  AllQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8D376F),
      body: FutureBuilder(
        future: Question().getAllQuestion(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            List<QuestionModel> result =
                List.generate(temp.data.length, (index) {
              return QuestionModel.fromMap(
                temp.data[index],
              );
            });
            return Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 700,
                  child: ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          QuestionNumber = result[index].id;
                          context.go("/AllQuestionScreen/QuestionScreen");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 30, right: 30),
                          child: Container(
                            width: 281,
                            height: 55,
                            decoration: ShapeDecoration(
                              color:
                                  Colors.white.withOpacity(0.4000000059604645),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x11000000),
                                  blurRadius: 15,
                                  offset: Offset(0, 4),
                                  spreadRadius: 4,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(result[index].question),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go("/AllQuestionScreen/ScoreScreen");
                    NumberQuestion = result.length;
                  },
                  child: Container(
                    width: 320,
                    height: 60,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, -0.00),
                        end: Alignment(-1, 0),
                        colors: [Color(0xFFF3BD6B), Color(0xFFDA8BD9)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'SHOW MY THE RESULT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
