import 'package:flutter/material.dart';
import 'package:internal/login.dart';
import 'package:internal/sub.dart';


Future main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Userspread.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Slash(),
    );
  }
}


