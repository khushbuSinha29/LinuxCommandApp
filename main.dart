import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_app/screens/command.dart';
import 'package:firestore_app/screens/home.dart';
import 'package:firestore_app/screens/login.dart';
import 'package:firestore_app/screens/reg.dart';
import 'package:flutter/material.dart';
import 'screens/test.dart';

void main(){
  
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes:{
         "home":(context)=>MyHome(),
         "reg":(context)=>MyReg(),
         "login":(context)=>MyLogin(),
         "command":(context)=>MyCmd(),
      }
   
    )
  );
}