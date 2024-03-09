
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SumInput extends StatefulWidget {
  final changeSum;
  const SumInput(this.changeSum, {super.key});

  @override
  State<SumInput> createState() => _SumInputState();
}

class _SumInputState extends State<SumInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
          child: SizedBox(
            width: 280,
            height: 70,
            child: TextField(
              onChanged: (value) => {widget.changeSum(double.parse(value))},
              autofocus: true,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyLarge,
              showCursor: false,
              decoration: const InputDecoration(
                enabled: true,
                suffixText: "\$",
                border: InputBorder.none,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d*$'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
