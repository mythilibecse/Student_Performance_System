import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Display extends StatefulWidget {
  final String dis;
  final String intern;
  final String re;
  const Display({Key? key, required this.dis, required this.intern, required this.re}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PERFORMANCE"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("YOUR INTERNALS",style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
            ),),
            Text(widget.re,style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
            ),),
            Lottie.asset(widget.dis,height: 100,width: 100),
            Text(widget.intern,style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
            ),)
          ],

        ),
      ),
    );
  }
}
