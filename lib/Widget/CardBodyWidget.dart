import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({
    required this.index,
    required this.item,
    required this.handleDeleteTask,
    super.key,
  });
  var item;
  var index;
  final Function handleDeleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? Colors.amber : Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            InkWell(
                onTap: () async {
                  if (await confirm(context)) {
                    handleDeleteTask(item.id);
                  }
                  return;
                },
                child: const Icon(Icons.delete_outline)),
          ],
        ),
      ),
    );
  }
}
