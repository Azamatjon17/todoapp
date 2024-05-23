import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/controller/plane_controller.dart';

class Dialogmain extends StatefulWidget {
  PlaneController planeController;
  Function() refresh;
  Dialogmain(this.planeController, this.refresh, {super.key});

  @override
  State<Dialogmain> createState() => _DialogmainState();
}

class _DialogmainState extends State<Dialogmain> {
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
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: "plan name"),
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
              widget.planeController.add(name: planecontroller.text, time: time);
              widget.refresh();
              Navigator.pop(context);
            },
            child: const Text("Submit"))
      ],
    );
  }
}
