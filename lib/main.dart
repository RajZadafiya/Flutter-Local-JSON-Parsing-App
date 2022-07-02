import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Json Load Flutter App"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString("load_json/person.json"),
              builder: (context, snapshot) {

                final scaffoldKey = new GlobalKey<ScaffoldState>();

                void _showSnackBar(String text){
                  scaffoldKey.currentState?.showSnackBar(new SnackBar(content: new Text("text")));
                }
                // decode json
                var myData = json.decode(snapshot.data.toString());
                print(myData.toString());
                // print(myData.length);
                print("object");
                // _showSnackBar("myData.toString()");

                return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("Name :" + myData[index]['name']),
                          new Text("age :" + myData[index]['age']),
                          new Text("Bdate :" + myData[index]['bdate']),
                          new Text("Gender :" + myData[index]['gender']),
                          new Text("Height :" + myData[index]['height']),
                          new Text("Hair Color :" + myData[index]['hair_color']),
                        ],
                      ),
                    );
                  },
                  itemCount: myData == null ? 0 : myData.length,
                );
              }),
        ),
      ),
    );
  }
}

