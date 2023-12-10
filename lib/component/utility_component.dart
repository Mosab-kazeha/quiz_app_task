import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/router.dart';
import '../screen/question_bage.dart';

bool? addOrUpDate;

mixin UtilityComponent {
  addNewQuestion({required BuildContext context}) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.maxFinite,
            height: 150,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.00, -0.02),
                end: Alignment(-1, 0.02),
                colors: [Color(0xFFDA8BD9), Color(0xFFF3BD6B)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    addOrUpDate = true;

                    router.go(
                        "/AllQuestionScreen/QuestionScreen/AddOrUpdateQuestionScreen");
                  },
                  child: Container(
                    width: 250,
                    height: 59,
                    child: Center(
                      child: Text(
                        'Add New Question',
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
                InkWell(
                  onTap: () {
                    addOrUpDate = false;

                    router.go(
                        "/AllQuestionScreen/QuestionScreen/AddOrUpdateQuestionScreen");
                  },
                  child: Container(
                    width: 250,
                    height: 59,
                    child: Center(
                      child: Text(
                        'Up Date This Question',
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
          );
        });
  }

  typeOfScore(String title, String score, Color? color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: ShapeDecoration(
                color: color,
                shape: OvalBorder(),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              score,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )
          ],
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  settingButton(
      {required IconData? icon,
      required Color? color,
      required String title,
      required void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: 45,
              height: 45,
              child: Icon(
                icon,
                color: Colors.white,
              ),
              decoration: ShapeDecoration(
                color: color,
                shape: OvalBorder(),
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  checkoutAnswer(
      bool isCorrect, BuildContext context, num time, num answerTime) {
    if (time < answerTime) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Time Out'),
        backgroundColor: Colors.blue,
      ));
      router.go("/AllQuestionScreen");
    } else {
      if (isCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Success'),
          backgroundColor: Colors.green,
        ));
        addNewQuestion(
          context: context,
        );
        correctAnswer++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Failed'),
          backgroundColor: Colors.red,
        ));
        router.go("/AllQuestionScreen");
        wrongAnswer++;
      }
    }
  }

  textFieldAnswer({
    required TextEditingController controller,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        width: 290,
        height: 50,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: title,
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
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  highScoreContainer({
    required double leftPadding,
    required double rightPadding,
    required double containerHeight,
    required String rank,
    required double score,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 68,
            height: containerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rank,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Text(
                  '${score.toInt()} pt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            decoration: ShapeDecoration(
              color: Color(0x7FDF83BF),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFDF83BF)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
