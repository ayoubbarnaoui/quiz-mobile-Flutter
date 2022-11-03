import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/models/Question.dart';
import 'package:quiz_app/views/home.dart';
import 'package:quiz_app/views/homeSup.dart';
import 'package:quiz_app/views/loginUser.dart';

import 'controllers/dbConnect.dart';
//Future main() async {
  void main(){
    // var db=  DbConnect();
    // db.addQuestion(
    //   Question(id: '20', title: 'what is 2 x 2',
    //    options: 
    //    {
    //      '10':false,
    //      '14':false,
    //      '20':false,
    //      '4':true,
    //    }
    //    )
    // ); 
    // db.fetchQuestions();

 /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); */
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: homePage()
      home: HomeSup(),
      );
    
  }
}
