
import 'package:http/http.dart' as http;

import '../models/Question.dart';
import 'dart:convert';

class DbConnect {
  final url = Uri.parse('https://quiz-112fd-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question qst) async{
//add await
  http.post(url, 
    body: json.encode({
      'title': qst.title,
      'options': qst.options,
    }) );
  }
    Future<List<Question>> fetchQuestions() async{
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQst = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'],
          options: Map.castFrom(value['options']),
        );
        newQst.add(newQuestion);
      });
      //print(newQst);
      return newQst;
      // var data = json.decode(response.body);
      // print(data);
    });
  }





}