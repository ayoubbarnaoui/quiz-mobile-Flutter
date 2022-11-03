import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomeUser.dart';

import 'package:quiz_app/controllers/constants.dart';
import '../models/Question.dart';
import 'widgets/question_widget.dart';
import 'widgets/nextButton.dart';

import 'widgets/optionCard.dart';

import 'widgets/resultBox.dart';

import '../controllers/dbConnect.dart';


class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

var db = DbConnect();

  // List<Question> qst = [
  //   Question(
  //     id: '10',
  //     title: 'what is 2+2 ?',
  //     options: {'5': false, '30':false,'4':true,'10':false},

  //   ),
  //    Question(
  //     id: '11',
  //     title: 'what is 10+20 ?',
  //     options: {'50': false, '30':true,'40':false,'100':false},

  //   )
  // ];

late Future qst;
Future<List<Question>> getData() async{
  return db.fetchQuestions();
}

@override
  void initState() {
    super.initState();
    qst = getData();
  }

int index = 0;

int score = 0;

bool isPressed = false;

bool isAlreadySelected = false;

void nextQuestion( int questionLength){
  if(index == questionLength - 1){
    //return;
    showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (ctx) => ResultBox(
      result: score,
      questionLength: questionLength,
      onPressed: startOver,
      ));
    //  print('whatttttttttttt');
       //Navigator.pop(context, true);
       //Navigator.of(context).pop();
      
  }
  else{
    if(isPressed){
      setState(() {
      index++;
      isPressed = false;
      isAlreadySelected = false;
    });
    
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar( content: Text('Please select any option'),
        behavior: SnackBarBehavior.floating, 
        margin: EdgeInsets.symmetric(vertical: 20.0),
        
        )
      );
    }


  }


}

// fonction pour changer le couleur
/*
void changeColor(){
  setState(() {
    isPressed = true;
  });
  
}*/

void checkAnswerAndUpdate(bool value){
  if(isAlreadySelected){
    return;
  }else{
    if(value == true){
    score++;
      }    
  setState(() {
      isPressed = true;
      isAlreadySelected = true;
    });
  }
  }
void startOver(){

  setState(() {
    index = 0;
    score = 0;
    isPressed = false;
    isAlreadySelected = false;
  });
  Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: qst as Future<List<Question>>,

      builder: (ctx, snapshot){

        if(snapshot.connectionState ==
         ConnectionState.done){
           if(snapshot.hasError){
             return Center(child: Text('${snapshot.error}'),);
           }else if(snapshot.hasData){
             var extracterData = snapshot.data as 
              List<Question>;
            return  Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          shadowColor: Colors.transparent,
          actions: [
            Padding(padding: const EdgeInsets.all(18.0),
            child: Text(
              'score: $score',
              style: const TextStyle(fontSize: 18.0),
              ),
    
            )
          ],
          title : const Text('Quiz App'),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10.0 ),
          child: Column(
            children: [
              QuestionWidget(question: extracterData[index].title,
               indexAction: index, 
               totalQuestions: extracterData.length
               ),
              const Divider(color: neutral,),
    
              const SizedBox(height: 25,),
              for (int i=0; i < extracterData[index].options.length;i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                  extracterData[index].options.values.toList()[i]) ,
    
                child: OptionCard(option: extracterData[index].options.keys.toList()[i],
                color: isPressed 
                    ? extracterData[index].options.values.toList()[i] == true
                      ? correct
                      : incorrect
                    : neutral,
                       //   onTap: changeColor,
                ),
              ),
           
            ],
          ),
        ),
    
    
        floatingActionButton: GestureDetector(
          onTap: () => nextQuestion(extracterData.length),
          child:const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: NextButton(
            //  nextQuestion: nextQuestion,
              ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
           }
          
         }
         else {
           return const Center(
             child: CircularProgressIndicator(),
             );
         }
         return const Center(
           child: Text('No Data') ,);

      },
      
    ); 
  }
}