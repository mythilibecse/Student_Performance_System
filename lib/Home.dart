
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:internal/about.dart';
import 'package:internal/homepage.dart';
import 'package:internal/mark.dart';
import 'package:internal/subjects.dart';
class Front extends StatefulWidget {
  final String register;
  const Front({Key? key, required this.register}) : super(key: key);

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  int locate=0;
  final navigationkey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    final screens=[
      Info(),
      Marks(regno: widget.register),
      Subjects(no: widget.register),
      Home(),
    ];
    return Scaffold(
      extendBody: true,
      body: screens[locate],
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationkey,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.purple,
        color: Colors.orangeAccent,
        items: [
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.subject,color: Colors.white),
          Icon(Icons.percent_outlined,color: Colors.white),
          Icon(Icons.person,color: Colors.white,)
        ],
        height: 60,
        index: locate,
        onTap: (int index){
          final navigationState = navigationkey.currentState;
          setState(() {
           this.locate =index;
          });
          navigationState!.setPage(locate);

        },
      ),
    );
  }
}
