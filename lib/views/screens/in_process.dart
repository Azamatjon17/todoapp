import 'package:flutter/material.dart';
import 'package:todoapp/models/plane.dart';
import 'package:todoapp/views/widgets/palnewidget.dart';

// ignore: must_be_immutable
class InProcess extends StatefulWidget {
  List<Plane> plans;
  InProcess(this.plans, {super.key});

  @override
  State<InProcess> createState() => _InProcessState();
}

class _InProcessState extends State<InProcess> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        for (int i = 0; i < widget.plans.length; i++)
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Palnewidget(
                widget.plans[i],
                deletefunction: () {},
                editfunction: () {},
              ),
            ],
          )
      ],
    );
  }
}
