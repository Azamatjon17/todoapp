import 'package:flutter/material.dart';
import 'package:todoapp/models/plane.dart';

// ignore: must_be_immutable
class Palnewidget extends StatelessWidget {
  Function() editfunction;
  Function() deletefunction;
  Plane plane;
  Palnewidget(this.plane, {super.key, required this.editfunction, required this.deletefunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(plane.name),
        subtitle: Text("${plane.time.day}-${plane.time.month}-${plane.time.year}   ${plane.time.minute}:${plane.time.hour}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: editfunction,
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: deletefunction,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
