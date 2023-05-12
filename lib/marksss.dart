
import 'package:flutter/material.dart';
import 'package:internal/display.dart';
import 'package:internal/sub.dart';
import 'package:internal/user.dart';
class Markdis extends StatefulWidget {
  final String subname;
  final String number;
  const Markdis({Key? key, required this.number, required this.subname}) : super(key: key) ;

  @override
  State<Markdis> createState() => _MarkdisState();
}

class _MarkdisState extends State<Markdis> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  User? user;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    getUsers();
  }

  Future getUsers() async {
    final user = await Userspread.getById(widget.number);
    print(user!.toJson());

    setState(() {
      this.user = user;
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("MARK DISPLAY"),),
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
                Center(child: Text(widget.subname, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900],
                    fontSize: 20
                ),)),

                DataTable(
                  columns: [
                   DataColumn(label: Text("EXAM", style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.indigo[900]
                   ),),),
                    DataColumn(label:  Text("MARKS", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900]
                    ),), )
                  ],
                  rows: [
                    DataRow(
                        cells: [
                          DataCell( Text("UNIT1")),
                          DataCell(Text(user!.unit1))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("UNIT2")),
                          DataCell(Text(user!.unit2))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("UNIT3")),
                          DataCell(Text(user!.unit3))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("MODEL1")),
                          DataCell(Text(user!.model1))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("MODEL2")),
                          DataCell( Text(user!.model2))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("Assignment")),
                          DataCell( Text(user!.assignment))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("Attendance")),
                          DataCell( Text(user!.attendance))
                        ]
                    ),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange[900]
                    ),
                    onPressed: () {
                      double u1 = double.parse(user!.unit1);
                      double u2 = double.parse(user!.unit2);
                      double u3 = double.parse(user!.unit3);
                      double m1 = double.parse(user!.model1);
                      double m2 = double.parse(user!.model2);
                      double att = double.parse(user!.attendance);
                      double ass = double.parse(user!.assignment);
                      double res1 = (u1 * 2 / 10) + (u2 * 2 / 10) + (u3 * 2 / 10) + (m1 / 20) +
                          (m2 / 20)+att+ass;
                      double? res = res1;
                      String v = '';
                      String u = '';
                      print(res);
                      if (res! >= 39.5) {
                        v = "images/excellent.json";
                        u = " you are doing Great!!!!!!\n"
                            "Keep doing and achieve alot";
                      } else if (res! >= 24.5) {
                        v = "images/good.json";
                        u = "Good Keep it up!!!";
                      } else {
                        v = "images/fail.json";
                        u = "OOPS!!!!\n"
                            "you failed in your Internals\n"
                            "Try to write retest\n";
                      }
                      String internalsss = res.toStringAsFixed(2);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return Display(dis: v, intern: u, re: internalsss,);
                      }));
                    }, child:
                    Text("RESULT", style: TextStyle(
                        color: Colors.white
                    ),)
                )
              ],
            )
          ],
        )
    );
  }
}
