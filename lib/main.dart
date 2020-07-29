
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:toast/toast.dart';
import 'normalcalc.dart';
import 'globals.dart' as globals ;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginView(),
  ));
}

class LoginView extends StatefulWidget {
  _LoginViewState createState() => _LoginViewState();

}

class _LoginViewState extends State<LoginView> {
  TextEditingController _username = TextEditingController(text: "roshie");
  TextEditingController _password = TextEditingController();
  String passhelpertext = "";

  _onSubmit() {

    if (_password.text == globals.password) {
      passhelpertext = "";
      setState(() {

      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),);
    }
    else {
      passhelpertext = "Incorrect Password";
      setState(() {

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.orange, Colors.deepOrange, Colors.pink,Colors.purple, Colors.deepPurple, Colors.indigo,Colors.blue])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      //height: 700,
                      width: 350,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 195),
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
                                controller: _username,
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
                                    helperText: passhelpertext.toString(),
                                    helperStyle: TextStyle(fontSize: 12, color: Colors.white),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Image.asset("images/math.png"),
                          ),

                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {

  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController _username = TextEditingController(text: "roshie");
  TextEditingController _name = TextEditingController(text:"Rosh");
  var changePasswordVisibility = false;


  changePassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("New Password"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            style: new TextStyle(
                fontSize: 20
            ),
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white)),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
                prefixText: ' ',
                suffixStyle: const TextStyle(color: Colors.white)),
          ),
        ),
        Text("Re-type New Password"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            controller: newPassword,
            style: new TextStyle(
                fontSize: 20
            ),
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white)),
                hintText: 'Re-type New Password',
                hintStyle: TextStyle(color: Colors.grey),
                prefixText: ' ',
                suffixStyle: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
//  @override
//  void initState() {
//    super.initState();
//
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(child: Text("Settings",style: TextStyle(fontSize: 20),),),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(child: Text("Account Settings", textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),)),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text("Username"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _username,
                                  readOnly: true,
                                  style: new TextStyle(
                                      fontSize: 20
                                  ),
                                  decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.white)),
                                      hintText: 'Username',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixText: ' ',
                                      suffixStyle: const TextStyle(color: Colors.white)),
                                ),
                              ),
                              Text("Name"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _name,
                                  readOnly: true,
                                  style: new TextStyle(
                                      fontSize: 20
                                  ),
                                  decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.white)),
                                      hintText: 'Username',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixText: ' ',
                                      suffixStyle: const TextStyle(color: Colors.white)),
                                ),
                              ),
                              MaterialButton(
                                child: Text("Change Password",),
                                onPressed: () {
                                  setState(() {
                                    changePasswordVisibility = true;
                                  });
                                },
                              ),
                              Visibility(
                                visible: changePasswordVisibility,
                                child: Container(
                                  child: changePassword(),
                                ),
                              ),
                              Center(
                                child: MaterialButton(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.pink,Colors.purple, Colors.deepPurple]),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text("Save changes", style: TextStyle(color: Colors.white),),
                                      )),
                                  onPressed: (){
                                    globals.password = newPassword.text;
                                    setState(() {

                                    });
                                    Toast.show("Password Changed successfully", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                                  },
                                ),
                              )


                            ],
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

