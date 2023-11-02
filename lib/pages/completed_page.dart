import 'package:flutter/material.dart';
import '../models/task_model.dart';



class CompletedTodosScreen extends StatelessWidget {
  final List<Todo> completedTodos;

  CompletedTodosScreen({required this.completedTodos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6D7EF),
      appBar: AppBar(
        title: Text('Completed Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: completedTodos.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              color: Colors.white, // Warna background putih
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  completedTodos[index].judul,
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600, // Gaya semi-bold
                    color: Color(0xFF9395D3), // Warna teks dengan kode hex #9395D3
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      completedTodos[index].detailtask,
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400, // Gaya regular
                        color: Colors.black, // Warna teks hitam
                      ),
                    ),
                      Text(
                        'Completed on: ${completedTodos[index].completionDate!.toString()}',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400, // Gaya regular
                          color: Colors.black, // Warna teks hitam
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}