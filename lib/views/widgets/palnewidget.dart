import 'package:flutter/material.dart';
import 'package:todoapp/models/plane.dart';

// ignore: must_be_immutable
class Palnewidget extends StatefulWidget {
  Function() editfunction;
  Function() deletefunction;
  Plane plane;
  Palnewidget(this.plane, {super.key, required this.editfunction, required this.deletefunction});

  @override
  State<Palnewidget> createState() => _PalnewidgetState();
}

class _PalnewidgetState extends State<Palnewidget> {
  bool isdone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: Checkbox(
          value: isdone,
          onChanged: (value) {
            isdone = true;
            setState(() {});
          },
        ),
        title: Text(widget.plane.name),
        subtitle: Text("${widget.plane.time.day}-${widget.plane.time.month}-${widget.plane.time.year}   ${widget.plane.time.minute}:${widget.plane.time.hour}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: widget.editfunction,
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: widget.deletefunction,
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
