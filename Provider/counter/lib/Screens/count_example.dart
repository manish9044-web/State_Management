import 'dart:async';

import 'package:counter/Provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    print("build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child:
                Consumer<CountProvider>(builder: (context, value, child) {
              print("Only this widget build");
              return Column(
                children: [
                  Text(
                    value.count.toString(),
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    DateTime.now().toString(),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              );
            }))
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
