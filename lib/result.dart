import 'package:flutter/material.dart';
import 'package:internal/sub.dart';
import 'package:internal/user.dart';
class Result extends StatefulWidget {
  final String number;
  final String test;
  const Result({Key? key, required this.number, required this.test}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  User? date;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future getUsers() async {
    final user = await Userspread.getById(widget.number);
    print(user!.toJson());

    setState(() {
      this.date = user;
    });
  }


  @override
  Widget build(BuildContext context) {
    String exam = widget.test;
    return Scaffold(
      appBar: AppBar(title: Text("result"),),
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
            Center(child: Text(widget.test, style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
                fontSize: 20
            ),)),

            DataTable(
              columns: [
                DataColumn(label: Text("SUBJECTS", style: TextStyle(
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
                      DataCell( Text("MAD")),
                      DataCell(Text(widget.test))
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("AI")),
                      DataCell(Text(widget.test))
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("WP")),
                      DataCell(Text(widget.test))
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("DWDM")),
                      DataCell(Text(widget.test))
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("FSD")),
                      DataCell( Text(widget.test))
                    ]
                ),
              ],
            ),

          ],
        )
      ],
    )
    );
  }
}
