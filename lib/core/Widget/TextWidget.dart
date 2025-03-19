import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Textwidget extends StatelessWidget {
  Icon? ic;
  String? hint;
  int max;
  Color colorcont;
  Icon ?suffexIcons;
  bool readonly;
  Textwidget(
      {super.key, 
      required this.max,
       required this.ic, 
       required this.colorcont,
       required this.suffexIcons,
       required this.readonly,
       required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly:readonly ,
      maxLines: max,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: ic,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colorcont
            ),),
          ),
          suffixIcon:suffexIcons,
          
          hintText: hint,
          border: OutlineInputBorder(borderRadius: 
          BorderRadius.circular(15))),
    );
  }
}
