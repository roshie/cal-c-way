import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'drawer.dart';
//import 'scientificcalc.dart';
//import 'main.dart';

class normalCalculator extends StatefulWidget {
  _normalCalculatorState createState() => _normalCalculatorState();
}


class _normalCalculatorState extends State<normalCalculator> {
  TextEditingController input = TextEditingController();
  String operator;
  double num1 = 0;
  double num2 = 0;

  _operation() {
    if (operator == '+'){
      input.text = (num1 + num2).toString();print("Added");
    }
    if (operator == '-'){
      input.text = (num1 - num2).toString();
    }
    if (operator == '*'){
      input.text = (num1 * num2).toString();
    }
    if (operator == '/'){
      if (num2 == 0){
        Toast.show("A Number cannot be divided by zero", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      }else {
        input.text = (num1 / num2).toString();
      }
      setState(() {

      });

    }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: input,
                   textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepOrange),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))
                      ),
                        showCursor: true,
                        readOnly: true,
                     style: new TextStyle(
                     color: Colors.deepOrange,
                     fontSize: 60
                      ),
                    ),
                  ),
//              Expanded(
//                child: new Divider(),
//              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("AC", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text = "0";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("A", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Icon(Icons.backspace, color: Colors.white,))),
                      onPressed: () {
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("/", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        num1 = double.parse(input.text);
                        input.text = "0";
                        operator = '/';
                      },
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                        ),
                          child: Center(child: Text("9", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "9";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("8", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "8";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("7", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "7";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("*", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        num1 = double.parse(input.text);
                        input.text = "0";
                        operator = '*';
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("6", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "6";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("5", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "5";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("4", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "4";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("-", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        num1 = double.parse(input.text);
                        input.text = "0";
                        operator = '-';
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("3", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "3";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("2", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "2";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("1", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "1";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("+", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        num1 = double.parse(input.text);
                        input.text = "0";
                        operator = '+';
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("00", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "00";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("0", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        input.text += "0";
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text(".", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        if  (input.text.contains(".")) {
                          Toast.show("Already Contains a decimal", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        }
                        else {
                          input.text += ".";
                        }
                      },
                    ),
                    MaterialButton(
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                          child: Center(child: Text("=", style: TextStyle(color: Colors.white, fontSize: 30),))),
                      onPressed: () {
                        num2 = double.parse(input.text);
                        _operation();
                      },
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),






    );
  }
}