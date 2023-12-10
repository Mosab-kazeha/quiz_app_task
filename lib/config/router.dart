import 'package:flutter_demo/screen/all_question_bage.dart';
import 'package:flutter_demo/screen/login_bage.dart';
import 'package:flutter_demo/screen/question_bage.dart';
import 'package:flutter_demo/screen/score_page.dart';
import 'package:flutter_demo/screen/home_bage.dart';
import 'package:go_router/go_router.dart';

import '../screen/add_or_update_Question_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
      routes: [
        GoRoute(
          path: 'AllQuestionScreen',
          builder: (context, state) => AllQuestionScreen(),
          routes: [
            GoRoute(
              path: "QuestionScreen",
              builder: (context, state) => QuestionScreen(),
              routes: [
                GoRoute(
                  path: "AddOrUpdateQuestionScreen",
                  builder: (context, states) => AddOrUpdateQuestionScreen(),
                ),
              ],
            ),
            GoRoute(
              path: "ScoreScreen",
              builder: (context, state) => ScoreScreen(),
              routes: [
                GoRoute(
                  path: "HomeScreen",
                  builder: (context, state) => HomeScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    )
  ],
);
