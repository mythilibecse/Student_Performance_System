import 'package:flutter/material.dart';
import 'package:internal/loading.dart';
import 'package:internal/sub.dart';

class Subjects extends StatefulWidget {
  final String no;
  const Subjects({Key? key, required this.no}) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  bool s =false;
  void del(){
    setState(() {
      s=true;
    });
  }
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
                  child: Text("SUBJECTS",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900]
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 260,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                          elevation: 9,
                          shadowColor: Colors.indigo
                      ),
                      onPressed: (){
                        Userspread.init("MAD");
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return Load(sub: "Mobile Application Development", roll: widget.no);
                       }));
                      },
                      child: Text("Mobile Application Development",)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 260,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                          elevation: 9,
                          shadowColor: Colors.indigo
                      ),
                      onPressed: (){
                        Userspread.init("CD");
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Load(sub: "Compiler Design",roll: widget.no,);
                          }));
                      },
                      child: Text("Compiler Design",)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 260,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                          elevation: 9,
                          shadowColor: Colors.indigo
                      ),
                      onPressed: (){
                        Userspread.init("WP");
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Load(sub: "Web Programming",roll: widget.no,);
                          }));
                      },
                      child: Text("Web Programming",)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 260,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                          elevation: 9,
                          shadowColor: Colors.indigo
                      ),
                      onPressed: (){
                        Userspread.init("AI");
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Load(sub: "Artificial Intelligence",roll: widget.no,);
                          }));

                      },
                      child: Text("Artificial Intelligence",)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 260,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                          elevation: 9,
                          shadowColor: Colors.indigo
                      ),
                      onPressed: (){
                        s = false;
                        Userspread.init("DWDM");
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Load(sub: "Data WareHousing And Data Mining",roll: widget.no,);
                          }));

                      },
                      child: Text("Data WareHousing And Data Mining",)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 260,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                        elevation: 9,
                        shadowColor: Colors.indigo
                      ),
                      onPressed: (){
                        Userspread.init("FSD");

                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Load(sub: "Full Stack Development",roll: widget.no,);
                          }));

                      },
                      child: Text("Full Stack Development",)),
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
