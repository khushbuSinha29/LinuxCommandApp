import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form '),
        actions: [
          IconButton(icon: Icon(Icons.close), 
          onPressed:()async {
             print("sign off");
             await authc.signOut();
             Navigator.pushNamed(context, 'home');
          }),
        
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        //color: Colors.orange,
        decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/b.jpg"),
                fit: BoxFit.fill,
                )
              ),
        child: Center(
          child: Container(
             
              color: Colors.transparent,
              width: 300,
              
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged:(value){
                    email=value;
                  },
                    decoration:InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter  Name ",
                      icon: Icon(Icons.person)
                      ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged:(value){
                    email=value;
                  },
                    decoration:InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter Email",
                      icon: Icon(Icons.email),
                      ),
                ),

                SizedBox(height:10),
               
                 TextField(
                  obscureText: true,
                  onChanged:(value){
                    password=value;
                  },
                    decoration:InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter your password",
                      icon: Icon(Icons.lock)
                      ),
                ),
                SizedBox(height:20),

                Material(
                   color: Colors.white38,
                   borderRadius: BorderRadius.circular(10),
                   child: MaterialButton(
                     minWidth: 150,
                     height:40,
                     child:Text('Register',
                     style: TextStyle(fontSize: 20),
                     ),
                     //elevation: 50,
                    
                     onPressed:() async{
                       try{
                       var user = await authc.createUserWithEmailAndPassword(
                         email: email, 
                         password: password);

                       print(email);
                       print(password);
                       print(user);
                   
                       if(user.additionalUserInfo.isNewUser == true)
                       {
                         Navigator.pushNamed(context, 'login');
                       }
                   }catch (e) {
                       print(e);
                      
                   }
                     }
                   
                   ),
                 ),
                
              ],),
            ),
        ),
      ),
      
    );
  }
}