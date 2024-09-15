import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({
    required this.addTask,
    super.key,
  });

  final Function addTask;
  final TextEditingController controller = TextEditingController();

  void handleOnclick(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            ElevatedButton(
              onPressed: () => handleOnclick(context),
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
