import 'package:counter/Provider/example_two_provider.dart';
import 'package:counter/Screens/ExampleTwo/myFavorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleTwoScreen extends StatefulWidget {
  const ExampleTwoScreen({super.key});

  @override
  State<ExampleTwoScreen> createState() => _ExampleTwoScreenState();
}

class _ExampleTwoScreenState extends State<ExampleTwoScreen> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example two'),
        actions: [InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyfavoriteScreen(),));
          },
          child: Icon(Icons.favorite)),
        SizedBox(width: 20,)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<ExampleTwoProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }

                        // selectedItem.add(index);
                        // setState(() {});
                      },
                      title: Text('item  $index'),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
