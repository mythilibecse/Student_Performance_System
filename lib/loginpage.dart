import 'package:flutter/material.dart';
import 'package:internal/sub.dart';
import 'package:internal/subjects.dart';
import 'package:internal/user.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formkey = GlobalKey<FormState>();
  TextEditingController name=TextEditingController(text: "");
  TextEditingController regno=TextEditingController(text: "");
  var _hide = true;

  User? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Stack(
        children: [
          Image.asset("images/20221225_185618_0000.png",
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,

          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome Back!",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,color: Colors.orange[900]

                    ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(" Login",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.indigo[900]
                    ),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("  Please Sign in to continue",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.indigo[900]
                    ),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: formkey,
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return'Please Enter the user name';
                          }
                        },
                        controller: name,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle,color: Colors.orange[900],),
                            labelText: "USERNAME",
                            hintText: "Enter your name in Uppercase",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            labelStyle: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.indigo[900]
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return'Please Enter the password';
                          }
                        },
                        controller: regno,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock,color: Colors.orange[900],),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                _hide = ! _hide;
                              });
                            }, icon: Icon(Icons.remove_red_eye,color: Colors.white,)),
                            labelText: "PASSWORD",
                            hintText: "ACXXUCSXXX",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            labelStyle: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            filled: true,
                            fillColor: Colors.indigo[900]
                        ),
                        obscureText: _hide,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("SIGN IN",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.orange[900]
                            ),),
                            TextButton(onPressed: () async {

                              if(formkey.currentState!.validate()){
                                formkey.currentState?.save();
                                final user = await Userspread.getById(regno.text);
                                print(user!.toJson());
                                setState(() {
                                  this.data = user;
                                });
                                if(name.text == data!.name){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return Subjects(no: regno.text);
                                  }));
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Container(
                                      padding: EdgeInsets.all(16),
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                      child: Text("Your username or passwork is incorrect "
                                          "Please enter it correctly!!!"),
                                    ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                    )
                                  );
                                }
                              }

                            },
                              child:
                              Icon(Icons.arrow_circle_right_sharp,
                                size: 60,
                                color: Colors.orange[900],),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ))

                ],
              ),
            ),
          )
        ],
      ),
    );

  }
}
