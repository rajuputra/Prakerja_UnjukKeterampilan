import 'package:flutter/material.dart';
import 'package:prakerja_ta/pages/add_page.dart';
import 'package:prakerja_ta/pages/completed_page.dart';
import 'package:prakerja_ta/pages/edit_page.dart';
import '../models/task_model.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  void _addTodo() async {
    final todo = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTodoScreen()),
    );
    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  void _updateTodo(int index) async {
    final updatedTodo = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditTodoScreen(todo: todos[index])),
    );
    if (updatedTodo != null) {
      setState(() {
        todos[index] = updatedTodo;
      });
    }
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _completeTodo(int index) {
    setState(() {
      todos[index].isCompleted = true;
      todos[index].completionDate = DateTime.now();
    });
  }

  List<Todo> get completedTodos =>
      todos.where((todo) => todo.isCompleted).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6D7EF), // Warna latar belakang body
      appBar: AppBar(
        title: Text('TODO APP',
          style: TextStyle(
              fontFamily: 'Jost'
          ),),
        actions: [
          IconButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
            },
            icon: Icon(Icons.calendar_today, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: todos.length,
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
                  todos[index].judul,
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
                      todos[index].detailtask,
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400, // Gaya regular
                        color: Colors.black, // Warna teks hitam
                      ),
                    ),
                    if (todos[index].isCompleted &&
                        todos[index].completionDate != null)
                      Text(
                        'Completed on: ${todos[index].completionDate!.toString()}',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400, // Gaya regular
                          color: Colors.black, // Warna teks hitam
                        ),
                      ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => _updateTodo(index),
                      icon: Icon(
                        Icons.edit,
                        color: Color(0xFFB3B7EE), // Warna ikon dengan kode hex #B3B7EE
                      ),
                    ),
                    IconButton(
                      onPressed: () => _deleteTodo(index),
                      icon: Icon(
                        Icons.delete,
                        color: Color(0xFFB3B7EE), // Warna ikon dengan kode hex #B3B7EE
                      ),
                    ),
                    if (!todos[index].isCompleted)
                      IconButton(
                        onPressed: () => _completeTodo(index),
                        icon: Icon(
                          Icons.check_circle,
                          color: Color(0xFFB3B7EE), // Warna ikon dengan kode hex #B3B7EE
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CompletedTodosScreen(completedTodos: completedTodos)),
            );
          }
        },
      ),
    );
  }


}