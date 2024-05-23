import 'package:flutter/material.dart';
import 'package:todoapp/controller/plane_controller.dart';
import 'package:todoapp/models/plane.dart';

import 'package:todoapp/views/widgets/palnewidget.dart';

// ignore: must_be_immutable
class InProcess extends StatefulWidget {
  PlaneController planeController;
  InProcess(this.planeController, {super.key});

  @override
  State<InProcess> createState() => _InProcessState();
}

class _InProcessState extends State<InProcess> {
  List<Plane> inProcess = [];
  @override
  void initState() {
    for (var i = 0; i < widget.planeController.plans.length; i++) {
      if (widget.planeController.plans[i].iscomplate == false) {
        inProcess.add(widget.planeController.plans[i]);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        for (int i = 0; i < inProcess.length; i++)
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Palnewidget(
                inProcess[i],
                deletefunction: () {
                  inProcess.removeAt(i);
                  setState(() {});
                },
                editfunction: () {},
              )
            ],
          )
      ],
    );
  }
}
