import 'package:db_series1/Data/Local/dbhelper.dart';
import 'package:db_series1/addnotepage.dart';
import 'package:db_series1/db_provider.dart';
import 'package:db_series1/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //controller
  // TextEditingController titleController = TextEditingController();
  // TextEditingController descController = TextEditingController();

  // List<Map<String, dynamic>> allNotes = [];
  // DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    context.read<DbProvider>().getInitialNotes();
    // dbRef = DBHelper.getInstance;
    // getNotes();
  }

  // void getNotes() async {
  //   allNotes = await dbRef!.getAllNotes();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          PopupMenuButton(itemBuilder: (_){
            return [
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 10,),
                    Text("Settings")
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
                },
              )
            ];
          })
        ],
      ),
      //all notes viewed here
      body: Consumer<DbProvider>(
        builder: (ctx, provider, _) {
          
          List<Map<String, dynamic>> allNotes = provider.getNotes();

        return allNotes.isNotEmpty
            ? ListView.builder(
                itemCount: allNotes.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(allNotes[index][DBHelper.COLUMN_NOTE_TITLE]),
                    subtitle: Text(allNotes[index][DBHelper.COLUMN_NOTE_DESC]),
                    trailing: SizedBox(
                      width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddNotePage(
                                              isUpdate: true,
                                              sno: allNotes[index]
                                                  [DBHelper.COLUMN_NOTE_SNO],
                                              title: allNotes[index]
                                                  [DBHelper.COLUMN_NOTE_TITLE],
                                              desc: allNotes[index]
                                                  [DBHelper.COLUMN_NOTE_DESC],
                                            )));

                                // Pre-populate controllers BEFORE showing bottom sheet
                                // titleController.text =
                                //     allNotes[index][DBHelper.COLUMN_NOTE_TITLE];
                                // descController.text =
                                //     allNotes[index][DBHelper.COLUMN_NOTE_DESC];

                                // showModalBottomSheet(
                                //     context: context,
                                //     builder: (context) {
                                //       return getBottomSheetWidget(
                                //           isUpdate: true,
                                //           sno: allNotes[index]
                                //               [DBHelper.COLUMN_NOTE_SNO]);
                                //     });
                              },
                              child: Icon(Icons.edit)),
                          InkWell(
                            onTap: () {
                              //note to be deleted
                              provider.deleteNote(
                                  allNotes[index][DBHelper.COLUMN_NOTE_SNO]);
                                
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : Center(
                child: Text('No Notes yet!!'),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //note to be added from here
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotePage()));
          // showModalBottomSheet(
          //     context: context,
          //     builder: (context) {
          //       // titleController.clear();
          //       // descController.clear();
          //       return getBottomSheetWidget();
          //     });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Widget getBottomSheetWidget({bool isUpdate = false, int sno = 0}) {
  //   return
  // }
}
