import 'package:flutter/material.dart';
import 'package:teste_1_0/renato_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: RenatoButton(
         color: Colors.yellow,
         progressColor: Colors.cyan,
         textButton: Text("Loading"),
         endHeghtAnim: MediaQuery.of(context).size.height,
         state: (){
           return 0;
         },
        ),
      ),
    );
  }
}
