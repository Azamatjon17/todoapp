import 'package:flutter/material.dart';
import 'package:todoapp/controller/plane_controller.dart';
import 'package:todoapp/views/widgets/palnewidget.dart';

// ignore: must_be_immutable
class DonePlans extends StatefulWidget {
  PlaneController planeController;
  DonePlans(this.planeController, {super.key});

  @override
  State<DonePlans> createState() => _DonePlansState();
}

class _DonePlansState extends State<DonePlans> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        for (int i = 0; i < widget.planeController.plans.length; i++)
          Column(
            children: [
              widget.planeController.plans[i].iscomplate
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
