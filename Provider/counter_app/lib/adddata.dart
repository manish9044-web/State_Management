import 'package:counter_app/lis_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<ListMapProvider>().addData({
              'name': "Contact Name",
              'mobNo': "7347746619",
            });
          },
          icon: Icon(Icons.add,
              color: Colors.blue,
              size: 40,
              ),
        ),
      ),
    );
  }
}
