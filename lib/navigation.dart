import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internal/about.dart';
import 'package:internal/subjects.dart';
import 'mark.dart';

class Navi extends StatefulWidget {
  final String register;
  const Navi({Key? key, required this.register}) : super(key: key);

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  late List<Widget> _widgetOptions;




  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions1 = <Widget>[
      Home(),
      Subjects(no: widget.register),
      Marks(regno: widget.register,)
    ];
    _widgetOptions1=this._widgetOptions;

    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 40,),
              label: 'Home',
              backgroundColor: Colors.green,

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.subject,size: 40,),
                label: 'Subjects',
                backgroundColor: Colors.indigo
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks,size: 40,),
              label: 'Marks',
              backgroundColor: Colors.indigo,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 40,),
              label: 'Performance',
              backgroundColor: Colors.blue,
            )
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }

}