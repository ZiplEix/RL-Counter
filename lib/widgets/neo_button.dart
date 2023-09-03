import 'package:flutter/material.dart';

class NeoButton extends StatelessWidget {
  const NeoButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
            elevation: MaterialStateProperty.all(10),
            shadowColor: MaterialStateProperty.all(Colors.white),
            side: MaterialStateProperty.all(
              BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
          ),
          child: Center(
            child: child,
          )),
    );
  }
}
