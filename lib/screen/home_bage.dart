import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/component/utility_component.dart';
import 'package:flutter_demo/config/router.dart';
import 'package:flutter_demo/screen/login_bage.dart';
import 'package:flutter_demo/screen/question_bage.dart';

class HomeScreen extends StatelessWidget with UtilityComponent {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8D376F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InkWell(
                  onTap: () {
                    router.go("/AllQuestionScreen/ScoreScreen");
                  },
                  child: Image.asset("images/Vector.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: CircleAvatar(
                  radius: 19,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: Container(
              width: 243,
              height: 33,
              child: Row(
                children: [
                  Container(
                    width: 81,
                    height: 33,
                    child: Center(
                      child: Text(
                        'Today',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF2B252C),
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Container(
                    width: 81,
                    height: 33,
                    child: Center(
                      child: Text(
                        'Month',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF2B252C),
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, 0.01),
                        end: Alignment(-1, -0.01),
                        colors: [Color(0xFFDA8BD9), Color(0xFFF3BD6B)],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Container(
                    width: 81,
                    height: 33,
                    child: Center(
                      child: Text(
                        'year',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF2B252C),
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.8199999928474426),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              highScoreContainer(
                leftPadding: 4,
                rightPadding: 4,
                containerHeight: 141,
                rank: "2",
                score: 0,
              ),
              highScoreContainer(
                leftPadding: 4,
                rightPadding: 4,
                containerHeight: 202,
                rank: "1",
                score: correctAnswer,
              ),
              highScoreContainer(
                leftPadding: 4,
                rightPadding: 4,
                containerHeight: 85,
                rank: "3",
                score: 0,
              ),
            ],
          ),
          Container(
            width: double.maxFinite,
            height: 333,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: ((BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ListTile(
                          leading: Container(
                            width: 100,
                            height: 50,
                            child: Row(
                              children: [
                                Text(
                                  index < 9 ? '0${index + 1}' : "${index + 1}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF2B252C),
                                    fontSize: 15,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                CircleAvatar(
                                  radius: 28,
                                ),
                              ],
                            ),
                          ),
                          title: Text("name"),
                          trailing: Container(
                            width: 60,
                            height: 26,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFBEBFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '1${index}pt',
                                style: TextStyle(
                                  color: Color(0xFF2B252C),
                                  fontSize: 15,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Container(
                    width: 100,
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          "01",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF2B252C),
                            fontSize: 15,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        CircleAvatar(
                          radius: 28,
                        ),
                      ],
                    ),
                  ),
                  title: Text(userNameController.text),
                  trailing: Container(
                    width: 60,
                    height: 26,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFBEBFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${correctAnswer.toInt()}pt',
                        style: TextStyle(
                          color: Color(0xFF2B252C),
                          fontSize: 15,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
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
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
