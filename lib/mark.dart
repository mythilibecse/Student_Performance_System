import 'package:flutter/material.dart';
import 'package:internal/result.dart';
class Marks extends StatefulWidget {
  final String regno;
  const Marks({Key? key, required this.regno}) : super(key: key);

  @override
  State<Marks> createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("SUBJECTS")),
      body: Stack(
        children: [
          Image.asset("images/20221225_185618_0000.png",
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("MARKS",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[900]
                ),),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        elevation: 9,
                        shadowColor: Colors.orange
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Result(number: widget.regno,test: "unit1",);
                      }));
                    },
                    child: Text("Unit Test I",)),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        elevation: 9,
                        shadowColor: Colors.orange
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Result(number: widget.regno,test: "unit2",);
                      }));
                    },
                    child: Text("Unit Test II",)),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        elevation: 9,
                        shadowColor: Colors.orange
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Result(number: widget.regno,test: "unit3",);
                      }));
                    },
                    child: Text("Unit Test III",)),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        elevation: 9,
                        shadowColor: Colors.orange
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Result(number: widget.regno,test: "model1",);
                      }));
                    },
                    child: Text("Model Exam I",)),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        elevation: 9,
                        shadowColor: Colors.orange
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Result(number: widget.regno,test: "model2",);
                      }));
                    },
                    child: Text("Model Exam II",)),
              ),
              SizedBox(
                height: 20,
              ),



            ],
          )
        ],
      ),

    );
  }
}

