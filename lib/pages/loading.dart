import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {

    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/America/Chicago');
    Map data = jsonDecode(response.body);

    // get properties
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    
    // convert DateTime to object
    DateTime now = DateTime.parse(datetime);
    now = now.subtract(Duration(hours: int.parse(offset)));

    print(now);
    print(offset);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading page'),
    );
  }
}