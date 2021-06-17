import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int firstNum,secondNum;
  String displayText = "";
  String result;
  String operation;

  void btnClick(String btn){
    if(btn == "C"){
      displayText="";
      firstNum = secondNum = 0;
      result = "";
    }else if(btn == "+" || btn == "-" || btn == "*" || btn == "/"){
      firstNum = int.parse(displayText);
      result = "";
      operation = btn;
    }else if(btn == "="){
      secondNum = int.parse(displayText);
      if(operation == "+"){
        result = (firstNum+secondNum).toString();
      }
      if(operation == "-"){
        result = (firstNum-secondNum).toString();
      }
      if(operation == "*"){
        result = (firstNum*secondNum).toString();
      }
      if(operation == "/"){
        result = (firstNum~/secondNum).toString();  //~/ is integer division
      }
    }else{
      result = (displayText + btn).toString();
    }

    setState(() {
      displayText = result;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "$displayText",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.bottomRight,
              ),
            ),
            Row(
              children: [
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: [
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: [
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("*"),
              ],
            ),
            Row(
              children: [
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton(String btnValue) {
    return Expanded(
        child: OutlinedButton(
          onPressed:() => btnClick(btnValue),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "$btnValue",
              style: TextStyle(fontSize: 25,color: Colors.black87),
            ),
          ),
        ));
  }
}
