import 'package:counter_app/adddata.dart';
import 'package:counter_app/lis_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List"),
        ),
        body: Consumer<ListMapProvider>(
          builder: (ctr, provider, __) {
            var allData = provider.getData();
            return allData.isNotEmpty
                ? ListView.builder(
                    itemCount: allData.length,
                    itemBuilder: (ctr, index) {
                      return ListTile(
                        title: Text('${allData[index]['name']}'),
                        subtitle: Text('${allData[index]['mobNo']}'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(children: [
                            IconButton(
                                onPressed: () {
                                  context.read<ListMapProvider>().updateData({
                                    "name": "Updated Contact",
                                    "mobNo": "9999999999",
                                  }, index);
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<ListMapProvider>()
                                      .deleteData(index);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ]),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Data"),
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddData(),
                ));
          },
          child: Icon(Icons.add),
        ));
  }
}
