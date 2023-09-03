import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rl_counter/widgets/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int tab = 0;

  int defeats = 0;
  int victories = 0;

  final db = Hive.box('counters');
  DateTime now = DateTime.now();
  var key = "0";

  @override
  void initState() {
    super.initState();
    key = "${now.day}${now.month}${now.year}";
    if (db.containsKey(key)) {
      setState(() {
        defeats = db.get(key)['defeats'];
        victories = db.get(key)['victories'];
      });
    } else {
      updateDatabase();
    }
  }

  void updateDatabase() {
    db.put(key, {'defeats': defeats, 'victories': victories, 'date': now});
  }

  void addDefeat() {
    setState(() {
      defeats++;
    });

    updateDatabase();
  }

  void removeDefeat() {
    if (defeats == 0) return;
    setState(() {
      defeats--;
    });

    updateDatabase();
  }

  void addVictory() {
    setState(() {
      victories++;
    });

    updateDatabase();
  }

  void removeVictory() {
    if (victories == 0) return;
    setState(() {
      victories--;
    });

    updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Counter(
          add: addDefeat,
          remove: removeDefeat,
          count: defeats.toString(),
          title: "DEFEATS",
          textColor: Colors.red,
        ),
        Counter(
          add: addVictory,
          remove: removeVictory,
          count: victories.toString(),
          title: "VICTORIES",
          textColor: Colors.green,
        ),
      ],
    );
  }
}
