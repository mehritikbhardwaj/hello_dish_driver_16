import 'package:get/get.dart';

class FAQmodel {
  static final questions = [
    Question(
      que: "How to register on Mobile Applications ?",
      ans:
          "You need to click on login and verify your mobile number with OTP or Password that's it.",
    ),
    Question(
      que: "How to book oder ?",
      ans: "availble sooon",
    ),
    Question(
      que: "Get food for wedding",
      ans: "available soon",
    ),
  ];
}

class Question {
  final String que;
  final String ans;

  Question({
    required this.que,
    required this.ans,
  });
}
