import 'package:counter/Provider/example_two_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyfavoriteScreen extends StatefulWidget {
  const MyfavoriteScreen({super.key});

  @override
  State<MyfavoriteScreen> createState() => _MyfavoriteScreenState();
}

class _MyfavoriteScreenState extends State<MyfavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<ExampleTwoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Example two'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyfavoriteScreen(),
                    ));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoriteProvider.selectedItem.length,
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
