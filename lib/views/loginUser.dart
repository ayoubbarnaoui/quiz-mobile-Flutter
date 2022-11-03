import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class loginUser extends StatefulWidget {
  const loginUser({Key? key}) : super(key: key);

  @override
  State<loginUser> createState() => _loginUserState();
}

class _loginUserState extends State<loginUser>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text("salam")),
    
     body:  Form(

      //  key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            TextFormField(
                keyboardType: TextInputType.emailAddress,
               decoration: const InputDecoration(
                  hintText: 'Email',
                 labelText: 'Email',
                 contentPadding: EdgeInsets.all(10),
                 border: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.black))
              
               ),
            //  controller: _emailController,
              validator: (value) => value!.isEmpty ? 'please enter valid email' : null,
            ),
             TextFormField(
               keyboardType: TextInputType.emailAddress,
               decoration: const InputDecoration(
                  hintText: 'Password',
                 labelText: 'Password',
                 contentPadding: EdgeInsets.all(10),
                 border: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.black))
               ),
           //   controller: _passwordController,
              validator: (value) => value!.isEmpty ? 'please enter valid password' : null
            ),
            const SizedBox(
              height: 10,
            ),
            FlatButton(
              minWidth: double.infinity,
              color: Colors.blue,
              child: Text("Login", style:TextStyle(color: Colors.white)),
              
              onPressed: (){
                Map creds = {
                 // 'email' : _emailController.text,
                 // 'password' : _passwordController,
                  'device_name' : 'mobile',
                };
            /*    if(_formKey.currentState!.validate()){
                    print('ok');
                } */
              }
            ),
          ],
        ),
      ), 
    );
  }
}