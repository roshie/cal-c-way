
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: AddRemoveListView(),
    );
  }
}

class AddRemoveListView extends StatefulWidget {
  _AddRemoveListViewState createState() => _AddRemoveListViewState();
  String temp;
}

class _AddRemoveListViewState extends State<AddRemoveListView> {
  TextEditingController _textController = TextEditingController();

  List<String> listViewData = [

  ];

  _onSubmit() {
    setState(() {
      listViewData.add(_textController.text);
    });
  }
  _onPop() {
    setState(() {
      listViewData.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add & Remove from List'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15.0),
            TextField(
              cursorColor: Colors.red,
              controller: _textController,
              decoration: InputDecoration(
                fillColor: Colors.red,
                hintText: 'enter text to add',
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: RaisedButton(
                onPressed: _onSubmit,
                child: Text('Add to List'),
                color: Colors.red,
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: _onPop,
                child: Text('Remove from List'),
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20.0),
            Column(
                      children: [ for ( var i in listViewData ) Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: Text(i.toString()),color: Colors.red, ),
                      )
                      ]
                      ),



          ],
        ),
      ),
    );
  }
}