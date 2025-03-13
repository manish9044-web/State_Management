import 'package:db_series1/Data/Local/dbhelper.dart';
import 'package:db_series1/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  bool isUpdate;
  String title;
  String desc;
  int sno;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  // DBHelper? dbRef = DBHelper.getInstance;

  AddNotePage(
      {this.isUpdate = false, this.title = "", this.desc = "", this.sno = 0}) {}

  @override
  Widget build(BuildContext context) {
    if (isUpdate) {
      titleController.text = title;
      descController.text = desc;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Note' : 'Add Note',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(11),
        width: double.infinity,
        child: Column(
          children: [
            // Text(isUpdate ? 'Update Note' : 'Add Note',
            //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 21),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Enter title here",
                  label: Text("Title *"),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            SizedBox(height: 11),
            TextField(
              controller: descController,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "Enter description here",
                  label: Text("Desc *"),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        var title = titleController.text;
                        var desc = descController.text;
                        if (title.isNotEmpty && desc.isNotEmpty) {
                          if (isUpdate) {
                            context.read<DbProvider>().updateNote(title, desc, sno);
                          }else{
                            context.read<DbProvider>().addNote(title, desc);
                          }
                          Navigator.pop(context);
                          // bool check = isUpdate
                          //     ? await dbRef!.updateNote(
                          //         mTitle: title, mDesc: desc, sno: sno)
                          //     : await dbRef!
                          //         .addNote(mTitle: title, mDesc: desc);
                          // if (check) {
                          //   Navigator.pop(context);
                          //   // getNotes();
                          // }
                          // titleController.clear();
                          // descController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Please fill all the required blanks")));
                        }
                      },
                      child: Text(
                        isUpdate ? "Update Note" : "Add Note",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      )),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
