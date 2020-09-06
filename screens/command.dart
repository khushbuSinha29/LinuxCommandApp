import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
class MyCmd extends StatefulWidget {
  @override
  _MyCmdState createState() => _MyCmdState();
}

class _MyCmdState extends State<MyCmd> {
  var authc=FirebaseAuth.instance;
  String cmd;
  String changedoutput="";
  web(cmd)async{
    var url="http://192.168.43.234/cgi-bin/linuxcmd.py?x=${cmd}";
    var response = await http.get(url);
    setState(() {
      changedoutput=response.body;
    });
      var user= authc.currentUser;
    fsconnect.collection("LinuxCommands").add({ 
       'command':cmd,
       'cmdoutput':changedoutput,
       'user':user.email,
       });
      
     print(changedoutput);
  }
  var fsconnect = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title:Text("Run Linux Commands "),
        backgroundColor: Colors.orangeAccent,

        actions: [
           IconButton(icon: Icon(Icons.person), onPressed:(){
             var user= authc.currentUser;
         
            try{
            var user= authc.currentUser;
            print(user.email);
              Fluttertoast.showToast(
                msg: user.email,
                toastLength:Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0
             
    );
            }catch(e){
              print(e);
            }
          
           }),
          IconButton(icon: Icon(Icons.close), 
          onPressed:()async {
             print("sign off");
             await authc.signOut();
             Navigator.pushNamed(context, 'home');
          }),
         
        ],
        ),
      body:Container(
      // color: Colors.orange,
      decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/image1.jpg"),
            fit: BoxFit.cover,
            )
          ),
       width: double.infinity,
        child: Center(
          child: Container(
              width:300,
              
              color: Colors.white12,
              child: ListView(
                children: [
                   Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.only(top:150),
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged:(value){
                          cmd=value;
                        },
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Enter Command",
                            
                            ),
                      ),
                      
                    ),
                   
                      SizedBox(height:20),
                     
                      ListTile(title: Text("$changedoutput"),),
                       Material(
                         color: Colors.lightBlueAccent,
                         borderRadius: BorderRadius.circular(10),
                         child: MaterialButton(
                           minWidth: 150,
                           height:40,
                           child:Text('Run',
                           style: TextStyle(fontSize: 22),
                           ),
                          onPressed: (){
                            web(cmd);
                            print("Button Pressed");
                          },
                           ),
                       ),
                  ],
                ),
                ],
              ),
            ),
        ),
        
      )
    );
  }
}

