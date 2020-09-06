import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title:Text("Home Page") ,
        backgroundColor: Colors.black54,
        ),
        body:Container(
           decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/image3.jpg"),
            fit: BoxFit.cover,
            )
          ),
          height:double.infinity,
          width:double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
             Material(
               color: Colors.grey.shade600,
               borderRadius: BorderRadius.circular(10),
               child: MaterialButton(
                 minWidth: 200,
                 height:40,
                 child:Text('Register',
                 style: TextStyle(fontSize: 20),
                 ),
                 //elevation: 50,
                
                 onPressed:(){
                print("Button Pressed");
                Navigator.pushNamed(context, 'reg');
               }),
             ),
             SizedBox(height:10,),
              Material(
               color: Colors.grey.shade600,
               borderRadius: BorderRadius.circular(10),
               child: MaterialButton(
                 minWidth: 200,
                 height:40,
                 child:Text('Login',
                 style: TextStyle(
                   fontSize: 20,
                 ),
                 ),
                 
                 //elevation: 50,
                
                 onPressed:(){
                print("Button Pressed");
                Navigator.pushNamed(context, 'login');
               }),
             ),
            
          ],),
        )
      
    );
  }
}