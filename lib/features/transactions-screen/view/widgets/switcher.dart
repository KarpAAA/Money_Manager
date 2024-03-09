import 'package:flutter/material.dart';

class SwitcherWidget extends StatefulWidget {
  final changeCategories;
  late bool ifExpenseChosen;

   SwitcherWidget(this.changeCategories, ifExpenseChosen, {super.key}){
     this.ifExpenseChosen = ifExpenseChosen;
   }

  @override
  State<SwitcherWidget> createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Text("Expense"),
        ),
        Switch(
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.white,
            activeColor: Colors.white,
            activeTrackColor: Colors.black,
            value: widget.ifExpenseChosen,
            onChanged: (newValue) => {
              setState(() {
                widget.changeCategories(newValue);
              })
            })
      ],
    );
  }
}
