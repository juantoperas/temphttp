import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  //consultar();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {

  State<MyApp> createState() {
    print("Constructor MyApp");
    return new MyAppState(); //el estado ---> otra clase
  }


  Future<String> consultar() async {
    print("Ha respondido :-)");
    var respuesta = await http.get('https://jsonplaceholder.typicode.com/posts/1');


    int statusCode = respuesta.statusCode;
    Map<String, String> headers = respuesta.headers;
    String contentType = headers['content-type'];
    String js = respuesta.body;
    print(statusCode.toString()+"\n"+ headers.toString()+"\n"+ js.toString());
    print(respuesta.toString());
    return js;
}


  MyApp(){
    print("Constructor");
    var s= consultar().then((x){
      print(x);
    });
    print(s.toString());

  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

class MyAppState extends State<MyApp> {

  String _ms =" Loading... ";

  Future<String> consultar() async {
    print("Ha respondido :-)");
    var respuesta = await http.get('https://jsonplaceholder.typicode.com/posts/1');


    int statusCode = respuesta.statusCode;
    Map<String, String> headers = respuesta.headers;
    String contentType = headers['content-type'];
    String js = respuesta.body;
    print(statusCode.toString()+"\n"+ headers.toString()+"\n"+ js.toString());
    print(respuesta.toString());
    return js;
  }

  MyAppState(){
    print("Costructor del State");
    consultar().then(
            (x){
          print(" ======== \n LOTENGO!" + x);
          setState(() {
            _ms = x;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sateful widget'),
        ),
        body: Center(
          child: Text(_ms),
        ),
      ),
    );
  }
}
