import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rl_counter/widgets/historic_tile.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  final db = Hive.box('counters');

  List<dynamic> historic = [];

  @override
  void initState() {
    super.initState();
    historic = db.values.toList();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: historic.length,
      itemBuilder: (context, index) {
        return HistoricTile(
          date: historic[index]['date'],
          nbVictories: historic[index]['victories'],
          nbDefeats: historic[index]['defeats'],
        );
      },
    ));
  }
}
