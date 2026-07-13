import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(children:[
            Text("Welcome to Flutter", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 60),
      
           
            SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),  
              onPressed: () {
                Get.to(() => const Register());
              },
              child: const Text('Register'),
            ),
            SizedBox(height: 60),
            
          
          ],),
        )
      )
    );
  }
}