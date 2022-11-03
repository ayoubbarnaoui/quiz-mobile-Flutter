import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/views/dashbordAdmin.dart';
import 'package:quiz_app/views/home.dart';

class HomeSup extends StatefulWidget {
  const HomeSup({Key? key}) : super(key: key);

  @override
  State<HomeSup> createState() => _HomeSupState();
}

class _HomeSupState extends State<HomeSup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Quiz Application '),
        backgroundColor: Color.fromARGB(182, 4, 4, 4),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
            'assets/image1.jpg'
          ),
          fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            //  const SizedBox(
            //     height: 50,
            //     child:  Text(' vous ete joueur? click au dessus'),
            //   ),
           const  Text(' vous ete joueur? click en dessous',
                  style: TextStyle(
                  color: Colors.white,
                ), ),
           const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(
                  context,
                 MaterialPageRoute(builder: (context) => const homePage()),
                );
                  },
                  color: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)) ),
                    child: const Text(
                      "Player",
                      style: TextStyle(color: Colors.white)
                    ),
                ),
              ),
             const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 50,
                // child:  Text(' vous ete administrateur? click au dessus'),
              ),
             const Text(' vous ete administrateur? click en dessous',
                  style: TextStyle(
                  color: Colors.white,
                ),),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(
                  context,
                 MaterialPageRoute(builder: (context) => const dashbordAdmin()),
                );
                  },
                  color: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)) ),
                    child:const Text(
                      "Admin",
                      style: TextStyle(color: Colors.white)
                    ),
                ),
              ),
            ]
          )),
      ),
    );
  }
}