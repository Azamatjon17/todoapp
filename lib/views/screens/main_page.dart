import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/controller/plane_controller.dart';
import 'package:todoapp/views/screens/all_plans.dart';
import 'package:todoapp/views/screens/done_plans.dart';
import 'package:todoapp/views/screens/in_process.dart';
import 'package:todoapp/views/widgets/showdialog.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PlaneController planeController = PlaneController();

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 203, 241, 241),
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          centerTitle: true,
          title: const Text(
            "Todo App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.all_inbox_outlined),
                text: "All ",
              ),
              Tab(
                icon: Icon(Icons.done),
                text: "Done ",
              ),
              Tab(
                icon: Icon(CupertinoIcons.clock),
                text: "In prosses  ",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllPlans(planeController),
            DonePlans(
              planeController,
            ),
            InProcess(
              planeController,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialogmain(planeController, refresh);
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
