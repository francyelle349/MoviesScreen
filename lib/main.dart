import 'package:flutter/material.dart';
import 'package:moviescreen1/features/Movie/Ui/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner:false, home:  MoviesHome(), theme: ThemeData(primaryColor: Colors.lightBlue),);
  }
}