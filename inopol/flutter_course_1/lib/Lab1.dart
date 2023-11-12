import 'package:flutter/material.dart';

void main() => runApp(Lab1());

/// this is your APP Main screen configuration
class Lab1 extends StatelessWidget {
  Lab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LAb1HomePage(),
    );
  }
}

class LAb1HomePage extends StatelessWidget {
  LAb1HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.stars),
        title: const Text('Lab 1'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          /*******************--[focus here 🧐]--*******************/
          SizedBox(height: 25,),
          exercise1(),
          SizedBox(height: 25,),
          exercise2(),
          SizedBox(height: 25,),
          exercise3(),
          SizedBox(height: 25,),
          exercise4(),
          SizedBox(height: 25,),
          exercise5(),
          SizedBox(height: 25,),
          exercise6(),
          /*******************--[focus here 🧐]--*******************/
        ],
      ),
    );
  }

  Widget exercise1() {
    return Container(
      color: Colors.black26,
      child: Text(
        'Welcome to lab1',
        style: TextStyle(
          color: Colors.greenAccent,
          fontSize: 24.0,
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
        ),
      ),
    );
  }

  Widget exercise2() {
    return Icon(
      Icons.share,
      color: Colors.blue,
      size: 50.0,
    );
  }

  /// TODO : print on the screen on Pressed when clicking on the button, and print on Long Pressed when long click to Button
  Widget exercise3() {
    return ElevatedButton(
        onPressed: () {
          print('on Pressed');
        },
        onLongPress: () {
          print('Long Pressed');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.indigoAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.0)
        ),
        child: Text(
        'Click here',
        style: TextStyle(
          color: Colors.yellow,
        ),
      )
    );
  }

  Widget exercise4() {
    return FloatingActionButton(
      onPressed: () {
        print('Button Pressed');
      },
      backgroundColor: Colors.black,
      child: Icon(
        Icons.favorite,
        color: Colors.greenAccent,
      ),
      elevation: 6.0,
    );
  }

  Widget exercise5() {
    return TextButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(width: 2, color: Colors.amber)
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 40),
          ),
        ),
        child: Text(
            "Button to press",
          style: TextStyle(
            color: Colors.orange
          ),
        ),
        onPressed: (){}
    );
  }
  Widget exercise6() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border(
          top: BorderSide(color: Colors.blue, width: 10),
          bottom: BorderSide(color: Colors.deepOrange, width: 10),
          left: BorderSide(color: Colors.indigo, width: 10),
          right: BorderSide(color: Colors.deepPurple, width: 10),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.warning,
          size: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}