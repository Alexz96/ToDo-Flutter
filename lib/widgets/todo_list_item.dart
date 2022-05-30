import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.onDelete,
  }) : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                todo.title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              onPressed: (context) {
                onDelete(todo);
              },
              label: "Deletar",
            ),
          ],
        ),
      ),
    );
  }
}
