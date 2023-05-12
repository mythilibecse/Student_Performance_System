import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home "),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                    " How Internal Marks is calculated?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Padding(padding: const EdgeInsets.all(10.0)),
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: 'Text 3'),
                  TextSpan(text: 'Text 4'),
                ]),
              ),
              Text( ' The internal marks evaluation of a student is based on Continuous Assessment(CA) where 50% of marks is allotted.'),
              Padding(padding: const EdgeInsets.all(30.0)),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  " Theory Subject:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              ),
              Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(25),
                  child: Table(

                    defaultColumnWidth: FixedColumnWidth(150.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: [
                      TableRow(
                          decoration: const BoxDecoration(color: Colors.black12),
                          children: [
                            Column(children:[Text('EXAMS', style: TextStyle(fontSize: 20.0))]),
                            Column(children:[Text('Marks', style: TextStyle(fontSize: 20.0))]),

                          ]),
                      TableRow( children: [

                        Column(children:[Text('Unit Test(3 Tests)')]),
                        Column(children:[Text('30')]),

                      ]),
                      TableRow( children: [

                        Column(children:[Text('Model I')]),
                        Column(children:[Text('05')]),

                      ]),
                      TableRow( children: [

                        Column(children:[Text('Model II')]),
                        Column(children:[Text('05')]),

                      ]),
                      TableRow( children: [

                        Column(children:[Text('Assignment')]),
                        Column(children:[Text('05')]),

                      ]),
                      TableRow( children: [

                        Column(children:[Text('Attendance')]),
                        Column(children:[Text('05')]),

                      ]),
                      TableRow(
                          decoration: const BoxDecoration(color: Colors.black12),
                          children: [
                            Column(children:[Text('Total')]),
                            Column(children:[Text('50')]),

                          ]),
                    ],
                  ),
                ),
              ]),

            ],
          )),

    );
  }
}