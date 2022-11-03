import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controllers/dbConnect.dart';
import '../models/Question.dart';
import 'EditPage.dart';
import 'addPage.dart';

class dashbordAdmin extends StatefulWidget {
  
  const dashbordAdmin({Key? key}) : super(key: key);

  @override
  State<dashbordAdmin> createState() => _dashbordAdminState();
}

class _dashbordAdminState extends State<dashbordAdmin> {
  var db = DbConnect();
  late Future <List<Question>> qst;
  Future<List<Question>> getData() async{
    return db.fetchQuestions();
  }

  @override
  void initState() {
    super.initState();
    qst = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello admin'),
          actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
               
              Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => const addPage()),
              );
            },
          ),
  ], 

      ),
      body: Center(
        child: FutureBuilder<List<Question>>(
          future: qst,
          builder: (context, AsyncSnapshot<dynamic> snapshot){
            if(snapshot.hasError){
              return  Text('Something went wrong! ${snapshot.error}');
            } 
            else
           if(snapshot.hasData){
            final qsts = snapshot.data!;
            return builldQst(qsts);
           }else {
            return const Center(child: CircularProgressIndicator(),);
          } 
          }
          ),
      ),
        
    ); 

  }
  Widget builldQst(List<Question> questions) => ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index){
        final question = questions[index];
        return Card(
          child: ListTile(
            title: Text(question.title),
            onTap: (){
            Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) =>  EditPage(question: question,)),
                  );
            },
          ),
          
          );
      }  ,
      );
  }
