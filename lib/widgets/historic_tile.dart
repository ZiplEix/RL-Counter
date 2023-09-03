import 'package:flutter/material.dart';

class HistoricTile extends StatelessWidget {
  const HistoricTile({
    super.key,
    required this.date,
    required this.nbVictories,
    required this.nbDefeats,
  });

  final DateTime date;
  final int nbVictories;
  final int nbDefeats;

  Widget leadingIcon() {
    if (nbVictories == nbDefeats) {
      return Icon(
        Icons.remove_rounded,
        color: Colors.grey.shade600,
        size: 50,
      );
    } else if (nbVictories > nbDefeats) {
      return const Icon(
        Icons.arrow_upward_rounded,
        color: Colors.green,
        size: 50,
      );
    } else {
      return const Icon(
        Icons.arrow_downward_rounded,
        color: Colors.red,
        size: 50,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(10, 10),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-10, -10),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: ListTile(
            leading: leadingIcon(),
            title: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: nbDefeats.toString(),
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const TextSpan(
                      text: " - ",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: nbVictories.toString(),
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            trailing: Text(
              "${date.day}/${date.month}/${date.year}",
              style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
            ),
            style: ListTileStyle.list,
          ),
        ),
      ),
    );
  }
}
