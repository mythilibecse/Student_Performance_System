import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internal/loginpage.dart';
import 'package:lottie/lottie.dart';
class Slash extends StatefulWidget {
  const Slash({Key? key}) : super(key: key);

  @override
  State<Slash> createState() => _SlashState();
}

class _SlashState extends State<Slash> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
       MaterialPageRoute(builder: (context){
         return Login();
       })
      );
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Internal Mark",style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 25,
                color: Colors.indigo[900]

            ),),
            Text("System",style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.indigo[900]
            ),),
            Lottie.asset("images/student.json")
          ],
        ),

      )
    );
  }
}
