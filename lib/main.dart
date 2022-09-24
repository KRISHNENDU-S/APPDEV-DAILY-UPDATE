import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String data='';
  Future apicall()async {
    http.Response response;
    response = await
    http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
    if(response.statusCode==200){
      setState(() {
        data = response.body;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [Text(data.toString()),],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: apicall,

        child: Text("Fetch data"),
      ),
    );
  }
}
