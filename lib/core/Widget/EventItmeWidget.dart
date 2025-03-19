import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';
import 'package:flutter_application_8/core/model/eventModel.dart';
import 'package:intl/intl.dart';

class EventItmeWidget extends StatelessWidget {
  final Eventmodel event;
  double? hig;
  double? width;
  EventItmeWidget({super.key, required this.hig, required this.width,required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      margin: EdgeInsets.only(bottom: 20),
      height: hig ?? 250,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/birthday.png'), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.dateTime.day.toString(),
                  style: TextStyle(color: AppColors.primaryLight, fontSize: 20),
                ),
                Text(DateFormat('MMM').format(
                  event.dateTime
                )),
                Text(
                 event.title,
                  style: TextStyle(color: AppColors.primaryLight, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
