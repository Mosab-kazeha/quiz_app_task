import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/component/utility_component.dart';
import 'package:flutter_demo/config/router.dart';
import 'package:flutter_demo/screen/question_bage.dart';

import 'all_question_bage.dart';

class ScoreScreen extends StatelessWidget with UtilityComponent {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            router.go("/AllQuestionScreen");
          },
          child: Image.asset("images/Vector.png"),
        ),
      ),
      backgroundColor: Color(0xFF8D376F),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 175,
              height: 175,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.25),
                shape: OvalBorder(),
              ),
              child: Center(
                child: Container(
                  width: 139,
                  height: 139,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.30000001192092896),
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: Container(
                      width: 116,
                      height: 116,
                      child: Center(
                          child: Text(
                        "YourScor \n       ${correctAnswer.toInt()}",
                        style: TextStyle(
                          color: Color(0xFF8D376F),
                          fontSize: 18,
                          fontFamily: 'Galindo',
                          fontWeight: FontWeight.bold,
                          height: 0,
                        ),
                      )),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Opacity(
              opacity: 0.80,
              child: Container(
                width: 345,
                height: 180,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFFDA8BD9), Color(0xFFF3BD6B)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        typeOfScore("Completion", "100%", Color(0xFF8D376F)),
                        typeOfScore(
                            "Correct", "${correctAnswer.toInt()}", Colors.green)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        typeOfScore("Total Question", "$NumberQuestion",
                            Color(0xFF8D376F)),
                        typeOfScore(
                            "Wrong", "${wrongAnswer.toInt()}", Colors.red)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                settingButton(
                  icon: Icons.refresh,
                  color: Color.fromRGBO(92, 17, 66, 1.0),
                  title: "Play Again",
                  onTap: () {
                    router.go("/AllQuestionScreen");
                  },
                ),
                settingButton(
                  icon: Icons.remove_red_eye,
                  color: Color(0xFFF3BD6B),
                  title: "Review Answer",
                  onTap: () {},
                ),
                settingButton(
                  icon: Icons.share,
                  color: Color(0xFFDA8BD9),
                  title: "Share Score",
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                settingButton(
                  icon: Icons.insert_drive_file,
                  color: Color(0xFFFFAD31),
                  title: "Generate PDF",
                  onTap: () {},
                ),
                settingButton(
                  icon: Icons.home_sharp,
                  color: Color(0xFFFF7EFD),
                  title: "Home",
                  onTap: () {
                    router.go("/AllQuestionScreen/ScoreScreen/HomeScreen");
                  },
                ),
                settingButton(
                  icon: Icons.settings,
                  color: Color(0xFF9F7FA6),
                  title: "Leaderboard",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
