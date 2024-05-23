import 'package:flutter/material.dart';
import 'package:todoapp/controller/plane_controller.dart';
import 'package:todoapp/models/plane.dart';
import 'package:todoapp/views/widgets/palnewidget.dart';

// ignore: must_be_immutable
class DonePlans extends StatefulWidget {
  PlaneController planeController;
  DonePlans(this.planeController, {super.key});

  @override
  State<DonePlans> createState() => _DonePlansState();
}

class _DonePlansState extends State<DonePlans> {
  List<Plane> done = [];
  @override
  void initState() {
    for (var i = 0; i < widget.planeController.plans.length; i++) {
      if (widget.planeController.plans[i].iscomplate) {
        done.add(widget.planeController.plans[i]);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        for (int i = 0; i < done.length; i++)
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Palnewidget(
                done[i],
                deletefunction: () {
                  done.removeAt(i);
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
