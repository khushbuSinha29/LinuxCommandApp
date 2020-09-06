import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

   @override
  void initState() {
    // TODO: implement initState
    print("Landed to chat screen");
      super.initState();
  }
  
  var authc = FirebaseAuth.instance;
  String email;
  String password;

 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(icon: Icon(Icons.close), 
          onPressed:()async {
             print("sign off");
             await authc.signOut();
             Navigator.pushNamed(context, 'home');
          }),
        ],
      ),
      body:Container(
         decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/backgroundimage3.jpg"),
                fit: BoxFit.fill,
                )
              ),
        child: Center(
          child: Container(
            color: Colors.transparent,
            width: 300,
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
                    icon: Icon(Icons.lock),
                    ),
                    
              ),
              SizedBox(height:20),

              Material(
                 color: Colors.greenAccent,
                 borderRadius: BorderRadius.circular(10),
                 child: MaterialButton(
                   minWidth: 150,
                   height:40,
                   child:Text('Login'),
                   //elevation: 50,
                  
                   onPressed:() async{
                    try{ 
                     var userSignIn = await authc.signInWithEmailAndPassword(
                       email: email, 
                       password: password);
                       print(userSignIn);
                       if(userSignIn != null){
                         Navigator.pushNamed(context, 'command');
                       }
                    }catch(e){
                      print(e);
                      var output="Email or Password is wrong ";
                      Fluttertoast.showToast(
                msg: output,
                toastLength:Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0
             
    );
                    }
                        }
                 
                 ),
               ),
              
            ],),
          ),
        ),
      )
    );
  }
  }
