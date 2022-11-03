import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/models/Question.dart';

import '../controllers/dbConnect.dart';

class addPage extends StatefulWidget {
  const addPage({Key? key}) : super(key: key);

  @override
  State<addPage> createState() => _addPageState();
}

class _addPageState extends State<addPage> {
    final cTitle =TextEditingController();
    final resp1 =TextEditingController();
    final resp2 =TextEditingController();
    final resp3 =TextEditingController();
    final resp4 =TextEditingController();
      bool isChecked1 = false;
      bool isChecked2 = false;
      bool isChecked3 = false;
      bool isChecked4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("Add Question")),
          body: ListView(
            padding:  const EdgeInsets.all(25),
            children: <Widget> [
             const  Text('enter question'),
             const SizedBox(height: 5,),
              TextField(
                controller: cTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'title of the Question',
                ), 
              ),
              const SizedBox(height: 15),
              const  Text('enter the responses'),
              const SizedBox(height: 10,),
                Row(
                    children:   <Widget>[
                       Flexible(      
                                       
                        child:  TextField(
                          controller:resp1,
                          decoration: const InputDecoration(
                            labelText: 'response one',
                            border: OutlineInputBorder(),
                            ),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked1,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked1 = value!;
                        });
                      },
                    ),
                    ],
                  ),
                   const SizedBox(height: 10,),
                    Row(
                    children:   <Widget>[
                       Flexible(                       
                        child:  TextField(
                          controller:resp2,
                          decoration: const InputDecoration(
                            labelText: 'response two',
                            border: OutlineInputBorder(),
                            ),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked2,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked2 = value!;
                        });
                      },
                    ),
                    ],
                  ),
                   const SizedBox(height: 10,),
                    Row(
                    children:   <Widget>[
                       Flexible(                       
                        child:  TextField(
                          controller:resp3,
                          decoration: const InputDecoration(
                            labelText: 'response three',
                            border: OutlineInputBorder(),
                            ),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked3,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked3 = value!;
                        });
                      },
                    ),
                    ],
                  ),
                   const SizedBox(height: 10,),
                    Row(
                    children:   <Widget>[
                       Flexible(                       
                        child:  TextField(
                          controller:resp4,
                          decoration: const InputDecoration(
                            labelText: 'response fore',
                            border: OutlineInputBorder(),
                            ),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked4,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked4 = value!;
                        });
                      },
                    ),
                    ],
                  ),
                              const SizedBox(height: 15),
             ElevatedButton(
                child: Text('create'),
                onPressed: (){ 
                 Random r = new Random();
                 
                      final question = Question(id: r.nextInt(1000).toString() , title: cTitle.text, options: {
                        resp1.text:isChecked1,
                        resp2.text:isChecked2,
                        resp3.text:isChecked3,
                        resp4.text:isChecked4,

                      });
                   createQuestion(question);
                  Navigator.pop(context);
                  }  
                ),            
            ]
          )
    );

  }
  Future createQuestion(Question qst) async{
    var db = DbConnect();
    db.addQuestion(qst);
    print('what');
    // final docPerson = FirebaseFirestore.instance.collection('person').doc();
    //   person.id = docPerson.id;
    //   final json = person.tooJson();
    //   await docPerson.set(json); 

}
}