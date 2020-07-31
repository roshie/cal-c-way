import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_app/main.dart';
import 'package:flutter_new_app/webview.dart';
import 'scientificcalc.dart';
import 'normalcalc.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {

  var drawerItems = [
    new DrawerItem("Sign out", Icons.vpn_key),
    new DrawerItem("Normal Calculator", Icons.grid_on),
    new DrawerItem("Scientific Caluclator", Icons.gradient),
    new DrawerItem("Explore Chennai - Website", Icons.web),
    new DrawerItem("Settings", Icons.settings),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  BuildContext _ctx;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectedDrawerIndex = 1;

  Exit() {
    Navigator.pop(context);
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Exit(); // enter normal calculator class here
        break;
      case 1:
        return normalCalculator(); // enter normal calculator class here
        break;
      case 2:
        return scientificCalculator(); // enter normal calculator class here
        break;
      case 3:
        return WebViewDemo(); // enter normal calculator class here
        break;
      case 4:
        return Settings(); // enter normal calculator class here
        break;
      default:
        return normalCalculator(); // enter scientific calculator class here
        break;
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      if (i == 7) {
        drawerOptions.add(
          const Divider(height: 1.0, color: Colors.grey),
        );
      }
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon,),
        title: new Text(
          d.title,
          style: TextStyle(fontFamily: "Poppins",),

        ),

        selected: i == _selectedDrawerIndex,
        onTap: ()  {
          _onSelectItem(i);

        },

      ));
    }
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          iconTheme: new IconThemeData(color: Colors.blue)

      ),
      drawer: new Drawer(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Roshie"),
                accountEmail: new Text("@rosh"),
                currentAccountPicture: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: const Color(0xFF778899),
                  backgroundImage: NetworkImage("https://i.pinimg.com/564x/b4/0a/f8/b40af8217a7beaa09ed9fee060b68f41.jpg"), // for Network image
                ),
                decoration: new BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.orange, Colors.deepOrange, Colors.pink,Colors.purple, Colors.deepPurple, Colors.indigo,Colors.blue]),
                ),
              ),
              new Column(children: drawerOptions)
            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),

    );
  }
}




/////////////////SNACKBAR SCRIPT ////////////////////////////////
////////////TOAST SCRIPT////////////////
// import 'package:toast/toast.dart';
//class SnackbarDemo extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _SnackbarDemo();
//  }
//}
//class _SnackbarDemo extends State<SnackbarDemo> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//      children: [RaisedButton(
//        child: Text("SnackBar"),
//        onPressed: () {
//         var snackBar = SnackBar(
//           content: Text("This is a Snackbar"),
//          );
//          Scaffold.of(context).showSnackBar(snackBar);
//        }
//      ),
//    RaisedButton(
//        child: Text("SnackBar"),
//        onPressed: () {
//          Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
//        }
//      ),
//       ])
//    );
//  }
//}
//class WebViewDemo extends StatefulWidget {
//  @override
//  State <StatefulWidget> createState() {
//
//  }
//}


