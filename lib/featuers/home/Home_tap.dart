import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';
import 'package:flutter_application_8/core/Widget/EventItmeWidget.dart';
import 'package:flutter_application_8/core/Widget/HomeTapWidget.dart';
import 'package:flutter_application_8/core/Widget/SelectedType.dart';
import 'package:flutter_application_8/core/model/eventModel.dart';
import 'package:flutter_application_8/core/utiltes/firbase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTap extends StatefulWidget {
  HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  int selectedIndex = 0;
  List eventList = [];
  void getAllEvents() async {
  QuerySnapshot querySnapshot = await Firbase.getEventCollection().get();

  eventList = querySnapshot.docs.map((doc) {
    return Eventmodel.fromFireStore(doc.data() as Map<String, dynamic>);
  }).toList();

  setState(() {});
}

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryLight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcomeMessage,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('Aya Dwikat',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              children: [
                Icon(Icons.sunny),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'EN',
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.whiteColor),
                )
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            height: 140,
            decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      'Nablus,Palestine',
                      style: TextStyle(color: AppColors.whiteColor),
                    )
                  ],
                ),
                Selectedtype()
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              itemCount: eventList.length,
              itemBuilder: (context, index) {
                return EventItmeWidget(
                  event: eventList[index],
                  hig: null,
                  width: null,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
