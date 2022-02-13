import 'package:flutter/material.dart';

import 'package:todolist/todo/todo.dart';
import 'package:todolist/common/constants.dart';

typedef ToggleTodoCallBack = void Function(Todo, bool);

class TodoList extends StatelessWidget {
  TodoList({this.todos, this.onTodoToggle});

  final List<Todo> todos;
  final ToggleTodoCallBack onTodoToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    Icon icon = !todo.isDone
        ? const Icon(
            Icons.circle_outlined,
            color: checkColor,
          )
        : const Icon(
            Icons.check_circle_outline,
            color: checkColor,
          );

    return Card(
      semanticContainer: true,
      margin: const EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              IconButton(
                icon: icon,
                onPressed: () {
                  onTodoToggle(todo, !todo.isDone);
                },
              ),
            ],
          ),
          Column(
            children: [
              Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: _buildItem(context, index),
        );
      },
      itemCount: todos.length,
    );
  }
}
