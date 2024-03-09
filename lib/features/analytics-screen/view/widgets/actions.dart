
import 'package:flutter/material.dart';

import '../../../../models/transaction_type.dart';

class ActionButtons extends StatefulWidget {
  final buttonPressed;
  final ifActiveButtonExpense;
  const ActionButtons(this.buttonPressed, this.ifActiveButtonExpense, {super.key});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle activeButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
      textStyle: MaterialStateProperty.resolveWith(
              (states) => TextStyle(color: Colors.white)),
    );

    ButtonStyle inactiveButtonStyle = ButtonStyle(
        backgroundColor:
        MaterialStateColor.resolveWith((states) => Colors.white),
        textStyle: MaterialStateProperty.resolveWith(
                (states) => TextStyle(color: Colors.black)),
        side: MaterialStateProperty.resolveWith<BorderSide>(
                (_) => BorderSide(color: Colors.black)));

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      FilledButton(
          onPressed: () => widget.buttonPressed(TransactionType.EXPENSE),
          style: widget.ifActiveButtonExpense
              ? activeButtonStyle
              : inactiveButtonStyle,
          child: Text("Expense",
              style: TextStyle(
                  color: widget.ifActiveButtonExpense
                      ? Colors.white
                      : Colors.black))),
      const SizedBox(width: 10),
      FilledButton(
          onPressed: () => widget.buttonPressed(TransactionType.INCOME),
          style: !widget.ifActiveButtonExpense
              ? activeButtonStyle
              : inactiveButtonStyle,
          child: Text("Income",
              style: TextStyle(
                  color: !widget.ifActiveButtonExpense
                      ? Colors.white
                      : Colors.black)))
    ]);
  }
}
