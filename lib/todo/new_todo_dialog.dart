import 'package:flutter/material.dart';
import 'package:todolist/common/constants.dart';

import 'package:todolist/todo/todo.dart';

class NewTodoDialog extends StatefulWidget {
  const NewTodoDialog({Key key}) : super(key: key);

  @override
  _NewTodoDialog createState() => _NewTodoDialog();
}

class _NewTodoDialog extends State<NewTodoDialog> {
  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _buildTextForm(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsetsDirectional.only(top: 14, bottom: 14),
        prefixIcon: const Icon(
          Icons.circle_outlined,
          color: checkColor,
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.arrow_upward_outlined,
            color: Colors.blue,
          ),
          onPressed: () {
            if (controller.value.text.trim().isNotEmpty) {
              final todo = Todo(title: controller.value.text);
              controller.clear();
              Navigator.of(context).pop(todo);
            }
          },
        ),
        hintText: 'Add a task',
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _buildTextForm(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDialog(context);
  }
}
