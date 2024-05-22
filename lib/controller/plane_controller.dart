import 'package:todoapp/models/plane.dart';

class PlaneController {
  final List<Plane> _list = [
    Plane(name: "Boeing 737", time: DateTime.parse("2024-05-22 08:00:00"), iscomplate: true),
    Plane(name: "Airbus A320", time: DateTime.parse("2024-05-22 09:00:00"), iscomplate: true),
    Plane(name: "Boeing 747", time: DateTime.parse("2024-05-22 10:00:00"), iscomplate: false),
    Plane(name: "Airbus A380", time: DateTime.parse("2024-05-22 11:00:00"), iscomplate: true),
    Plane(name: "Concorde", time: DateTime.parse("2024-05-22 12:00:00"), iscomplate: false),
    Plane(name: "Cessna 172", time: DateTime.parse("2024-05-22 13:00:00"), iscomplate: true),
    Plane(name: "Piper PA-28", time: DateTime.parse("2024-05-22 14:00:00"), iscomplate: true),
    Plane(name: "Boeing 777", time: DateTime.parse("2024-05-22 15:00:00"), iscomplate: true),
    Plane(name: "Airbus A330", time: DateTime.parse("2024-05-22 16:00:00"), iscomplate: false),
    Plane(name: "Boeing 787", time: DateTime.parse("2024-05-22 17:00:00"), iscomplate: false),
    Plane(name: "Embraer E190", time: DateTime.parse("2024-05-22 18:00:00"), iscomplate: false),
    Plane(name: "Bombardier CRJ200", time: DateTime.parse("2024-05-22 19:00:00"), iscomplate: true),
    Plane(name: "Gulfstream G650", time: DateTime.parse("2024-05-22 20:00:00"), iscomplate: true),
    Plane(name: "Cessna Citation X", time: DateTime.parse("2024-05-22 21:00:00"), iscomplate: true),
    Plane(name: "Lockheed Martin F-35", time: DateTime.parse("2024-05-22 22:00:00"), iscomplate: true),
    Plane(name: "Northrop Grumman B-2", time: DateTime.parse("2024-05-22 23:00:00"), iscomplate: true),
    Plane(name: "Boeing KC-135", time: DateTime.parse("2024-05-23 00:00:00"), iscomplate: false),
    Plane(name: "Airbus A350", time: DateTime.parse("2024-05-23 01:00:00"), iscomplate: true),
    Plane(name: "Boeing 727", time: DateTime.parse("2024-05-23 02:00:00"), iscomplate: true),
    Plane(name: "Airbus A310", time: DateTime.parse("2024-05-23 03:00:00"), iscomplate: true),
  ];

  List<Plane> get plans => _list;
  List<Plane> get doneplans {
    List<Plane> done = [];
    for (int i = 0; i < _list.length; i++) {
      if (_list[i].iscomplate == true) {
        done.add(_list[i]);
      }
    }
    return done;
  }

  List<Plane> get inprosses {
    List<Plane> inprosses = [];
    for (int i = 0; i < _list.length; i++) {
      if (_list[i].iscomplate == false) {
        inprosses.add(_list[i]);
      }
    }
    return inprosses;
  }

  void add({required String name, required DateTime time}) {
    _list.add(Plane(name: name, time: time, iscomplate: false));
  }

  void delete(int index) {
    _list.removeAt(index);
  }

  void edit(index, String name, DateTime time) {
    _list[index].name = name;
    _list[index].time = time;
  }

  void isdone(int index) {
    _list[index].iscomplate = true;
  }
}
