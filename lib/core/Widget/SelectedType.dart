import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';
import 'package:flutter_application_8/core/Widget/HomeTapWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Selectedtype extends StatefulWidget {
  
  Selectedtype({super.key,});

  @override
  State<Selectedtype> createState() => _SelectedtypeState();
}

class _SelectedtypeState extends State<Selectedtype> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> eventName = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.birthDay,
      AppLocalizations.of(context)!.weather,
      AppLocalizations.of(context)!.more,
      AppLocalizations.of(context)!.worekShope,
    ];
    return DefaultTabController(
      length: eventName.length,
      child: TabBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: AppColors.transparentColor,
        dividerColor: AppColors.transparentColor,
        isScrollable: true,
        labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        tabAlignment: TabAlignment.start,
        tabs: eventName.map((ListName) {
          return TabeEventWidget(
            eventName: ListName,
            isSelected: selectedIndex == eventName.indexOf(ListName),
          );
        }).toList(),
      ),
    );
  }
}
