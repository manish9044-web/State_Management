import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      // print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //using setState
    // print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateTime.now().toString(),
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Center(
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            print(count);
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
