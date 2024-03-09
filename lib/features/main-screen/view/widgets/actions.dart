import 'package:flutter/material.dart';
import 'package:some2/features/main-screen/bloc/main_screen_bloc.dart';
import 'package:some2/models/transaction.dart';

import '../../../../models/transaction_type.dart';

class ActionsButtons extends StatefulWidget {
  const ActionsButtons(this._mainScreenBloc, {super.key});
  final _mainScreenBloc;

  @override
  State<ActionsButtons> createState() => _ActionsButtonsState();
}

class _ActionsButtonsState extends State<ActionsButtons> {
  bool _ifActiveButtonExpense = true;

  buttonPressed(TransactionType type){
    widget._mainScreenBloc.add(LoadMainScreenEvent(type));
    setState(() {
      _ifActiveButtonExpense = !_ifActiveButtonExpense;
    });
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle activeButtonStyle = ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
        textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(color: Colors.white)),
    );

    ButtonStyle inactiveButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
      textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(color: Colors.black)),
      side: MaterialStateProperty.resolveWith<BorderSide>((_) => BorderSide(color: Colors.black))
    );

    return  Container(
      padding: const EdgeInsets.only(left: 25, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FilledButton(
              onPressed: () => buttonPressed(TransactionType.EXPENSE),
              style: _ifActiveButtonExpense ? activeButtonStyle : inactiveButtonStyle,
              child: Text(
                  "Expense",
                  style: TextStyle(color: _ifActiveButtonExpense ? Colors.white : Colors.black))
          ),
          const SizedBox(width: 10),
          FilledButton(
            onPressed: () => buttonPressed(TransactionType.INCOME),
            style: !_ifActiveButtonExpense ? activeButtonStyle : inactiveButtonStyle,
              child: Text(
                  "Income",
                  style: TextStyle(color: !_ifActiveButtonExpense ? Colors.white : Colors.black))
          ),
        ],
      ),
    );
  }
}
