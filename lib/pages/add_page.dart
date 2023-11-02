import 'package:flutter/material.dart';

import '../models/task_model.dart';



class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late String judul;
  late String detailtask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                judul = value;
              },
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                detailtask = value;
              },
              decoration: InputDecoration(
                hintText: 'Detail',
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity, // Mengisi lebar penuh
              margin: EdgeInsets.only(top: 16.0, bottom: 16.0), // Margin atas dan bawah
              child: ElevatedButton(
                onPressed: () {
                  if (judul.isNotEmpty && detailtask.isNotEmpty) {
                    Navigator.pop(
                      context,
                      Todo(
                        judul: judul,
                        detailtask: detailtask,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Mengatur ukuran tombol
                ),
                child: Text('Add', style: TextStyle(fontSize: 18)), // Mengatur ukuran teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }

}