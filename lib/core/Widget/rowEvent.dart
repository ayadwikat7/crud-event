import 'package:flutter/material.dart';

class Rowevent extends StatelessWidget {
  String nameIc;
  Icon icon;
  String nmaeButton;

   Rowevent({super.key,
  required this.nameIc,required this.icon,required this.nmaeButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
          children: [
            icon,
            SizedBox(
              width: 10,
            ),
            Text(nameIc),
          ],
        )),
        TextButton(onPressed: () {}, child: Text(nmaeButton))
      ],
    );
  }
}
