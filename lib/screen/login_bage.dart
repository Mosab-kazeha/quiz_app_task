import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/question_bage.dart';
import 'package:go_router/go_router.dart';

TextEditingController userNameController = TextEditingController();

///make more than one player///

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 200),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color(0xFF914576),
                      fontSize: 32,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Container(
                    width: 320,
                    height: 60,
                    child: TextField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: TextStyle(
                          color: Color(0xFF914576),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                        prefix: Icon(
                          Icons.email,
                          color: Color(0xFF914576),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xFF914576),
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xFF914576),
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: InkWell(
                    onTap: () {
                      if (userNameController.text.length >= 3) {
                        correctAnswer = 0;
                        context.go("/AllQuestionScreen");
                      }
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
                          'LOGIN',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
