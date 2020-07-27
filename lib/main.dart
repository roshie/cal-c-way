
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
    home: LoginView(),
  ));
}

class LoginView extends StatefulWidget {
  _LoginViewState createState() => _LoginViewState();

}

class _LoginViewState extends State<LoginView> {
  TextEditingController _password = TextEditingController();
  String helpertext = "";

  _onSubmit() {
    if (_password.text == "helloworld") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NormalCalculator()),
        );


    }
    else {
      helpertext = "Incorrect Password";
      setState(() {

      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.lightBlue, Colors.indigo])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(

                  height: 350,
                  width: 350,
//                decoration: BoxDecoration(
//                    color: Colors.white.withOpacity(0.5),
//                  border: Border.all(color: Colors.grey, width: 1),
//                  borderRadius: BorderRadius.all(Radius.circular(10.0))
//                ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Cal-C-Way", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("LOGIN", style: TextStyle(fontSize: 25, color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white,
                          ),
                          child: new TextField(
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white)),
                                hintText: 'Username or email',
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: 'Username',

                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                prefixText: ' ',
                                suffixStyle: const TextStyle(color: Colors.white)),
                          ),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white,
                          ),
                          child: new TextField(
                            controller: _password,
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white)),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.white),
                                helperText: helpertext.toString(),
                                helperStyle: TextStyle(fontSize: 12, color: Colors.red),
                                labelText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                                prefixText: ' ',
                                suffixStyle: const TextStyle(color: Colors.white)),
                            autofocus: false,
                            obscureText: true,
                          ),
                        ),

                      ),
                      InkWell(
                        onTap: _onSubmit,
                        child: Container(
                          width: 150,
                          height: 50,
                          child: Center(child: Text("Sign in", style: TextStyle(fontSize: 20, ),)),
                          decoration: BoxDecoration(
                          color: Colors.white,
                              boxShadow: [BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                              ),],
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                        ),
                      )
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}


class NormalCalculator extends StatefulWidget {
  _NormalCalculatorState createState() => _NormalCalculatorState();

}

class _NormalCalculatorState extends State<NormalCalculator> {
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children:[
        Text("Normal Calculator"),
        RaisedButton(
          child: Text("Go Back"),
          onPressed: () { Navigator.pop(context);

          },
        )
      ]),
    );
  }
}