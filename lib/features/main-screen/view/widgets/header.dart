import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.person_2_outlined)),
        Text("Good morning!", style: Theme.of(context).textTheme.bodySmall),
        Text("Good morning!", style: Theme.of(context).textTheme.bodySmall),
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.doorbell),
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Color.fromARGB(217, 224, 224, 224))),
        ),
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.menu),
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Color.fromARGB(217, 224, 224, 224))),
        ),
      ],
    );
  }
}
