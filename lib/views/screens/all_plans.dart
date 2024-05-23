import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/controller/plane_controller.dart';

import 'package:todoapp/views/widgets/palnewidget.dart';
import 'package:todoapp/views/widgets/showdialog.dart';

// ignore: must_be_immutable
class AllPlans extends StatefulWidget {
  PlaneController planeController;

  AllPlans(this.planeController, {super.key});

  @override
  State<AllPlans> createState() => _AllPlansState();
}

class _AllPlansState extends State<AllPlans> {
  refresh() {
    setState(() {});
  }

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
              Palnewidget(
                widget.planeController.plans[i],
                deletefunction: () {
                  widget.planeController.delete(i);
                  setState(() {});
                },
                editfunction: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialogmains(widget.planeController, refresh, i);
                      });
                },
              ),
            ],
          )
      ],
    );
  }
}

// ignore: must_be_immutable
class Dialogmains extends StatefulWidget {
  int index;
  PlaneController planeController;
  Function() refresh;
  Dialogmains(this.planeController, this.refresh, this.index, {super.key});

  @override
  State<Dialogmains> createState() => _DialogmainState();
}

class _DialogmainState extends State<Dialogmains> {
  TextEditingController planecontroller = TextEditingController();
  String date = "plane time";
  late DateTime time;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("Add plan"),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: planecontroller,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "plan name"),
            ),
            const Gap(15),
            ElevatedButton(
                onPressed: () async {
                  var data = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2035));
                  date = "${data!.day}: ${data.month}:${data.year}";
                  time = data;
                  setState(() {});
                },
                child: Text(date)),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              widget.planeController.edit(widget.index, planecontroller.text, time);
              widget.refresh();
              Navigator.pop(context);
            },
            child: const Text("Submit"))
      ],
    );
  }
}
