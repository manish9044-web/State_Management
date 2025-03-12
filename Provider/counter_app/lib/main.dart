import 'package:counter_app/counter_provider.dart';
import 'package:counter_app/lis_map_provider.dart';
import 'package:counter_app/listpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ListPage()

        //first method
        // ChangeNotifierProvider(
        //   create: (context) => ListMapProvider(),
        //   child: ListPage(),
        // create: (context) => CounterProvider(),
        // child: HomePage(),
        // ),
        );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
          child: Consumer<CounterProvider>(builder: (ctx, provider, child) {
        return Text(
            //first method
            //"${Provider.of<CounterProvider>(ctx, listen: true).getCount()}",

            //second method
            '${ctx.watch<CounterProvider>().getCount()}',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
      })),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              child: Icon(Icons.add, color: Colors.blue),
              onPressed: () {
                //first metho
                //Provider.of<CounterProvider>(context, listen: false).incrementCount();
                //second method
                context.read<CounterProvider>().incrementCount();
              }),
          FloatingActionButton(
              child: Icon(Icons.remove, color: Colors.blue),
              onPressed: () {
                //Provider.of<CounterProvider>(context, listen: false).incrementCount();
                context.read<CounterProvider>().decrementCount();
              }),
        ],
      ),
    );
  }
}
