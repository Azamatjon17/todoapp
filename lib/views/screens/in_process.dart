import 'package:flutter/material.dart';
import 'package:todoapp/controller/plane_controller.dart';

import 'package:todoapp/views/widgets/palnewidget.dart';

// ignore: must_be_immutable
class InProcess extends StatefulWidget {
  PlaneController planeController;
  InProcess(this.planeController, {super.key});

  @override
  State<InProcess> createState() => _InProcessState();
}

class _InProcessState extends State<InProcess> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        for (int i = 0; i < widget.planeController.plans.length; i++)
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              !widget.planeController.plans[i].iscomplate
                  ? Palnewidget(
                      widget.planeController.plans[i],
                      deletefunction: () {
                        widget.planeController.delete(i);
                        setState(() {});
                      },
                      editfunction: () {},
                    )
                  : const Placeholder()
            ],
          )
      ],
    );
  }
}
