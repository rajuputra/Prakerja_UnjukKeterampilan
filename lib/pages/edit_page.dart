import 'package:flutter/material.dart';

import '../models/task_model.dart';


class EditTodoScreen extends StatefulWidget {
  final Todo todo;

  EditTodoScreen({required this.todo});

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late String judul;
  late String detailtask;

  @override
  void initState() {
    super.initState();
    judul = widget.todo.judul;
    detailtask = widget.todo.detailtask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: TextEditingController(text: judul),
              onChanged: (value) {
                judul = value;
              },
              decoration: InputDecoration(
                hintText: 'Task',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: TextEditingController(text: detailtask),
              onChanged: (value) {
                detailtask = value;
              },
              decoration: InputDecoration(
                hintText: 'Time',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Untuk meletakkan tombol di tengah
              children: [
                Expanded( // Untuk memastikan tombol "Update" dan "Cancel" memiliki lebar yang sama
                  child: ElevatedButton(
                    onPressed: () {
                      if (judul.isNotEmpty && detailtask.isNotEmpty) {
                        Navigator.pop(
                          context,
                          Todo(
                            judul: judul,
                            detailtask: detailtask,
                            isCompleted: widget.todo.isCompleted,
                            completionDate: widget.todo.completionDate,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16), // Mengatur ukuran tombol
                    ),
                    child: Text('Update'),
                  ),
                ),
                SizedBox(width: 8.0), // Memberikan sedikit jarak antara tombol
                Expanded( // Untuk memastikan tombol "Update" dan "Cancel" memiliki lebar yang sama
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16), // Mengatur ukuran tombol
                    ),
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}