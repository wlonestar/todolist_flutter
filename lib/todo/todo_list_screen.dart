import 'package:flutter/material.dart';

import 'package:todolist/todo/todo.dart';
import 'package:todolist/todo/new_todo_dialog.dart';
import 'package:todolist/todo/todo_list.dart';
import 'package:todolist/settings/settings_screen.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _addTodo() async {
    final todo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return NewTodoDialog();
        });

    if (todo.title != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: TodoList(
          todos: todos,
          onTodoToggle: _toggleTodo,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: _addTodo,
      ),
    );
  }
}
