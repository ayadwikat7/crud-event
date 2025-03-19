import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';
import 'package:flutter_application_8/core/Widget/EventItmeWidget.dart';
import 'package:flutter_application_8/core/Widget/SelectedType.dart';
import 'package:flutter_application_8/core/Widget/customTextFiled.dart';
import 'package:flutter_application_8/core/Widget/rowEvent.dart';
import 'package:flutter_application_8/core/Widget/CustomElevatedButton.dart'; // Import Custom Button
import 'package:flutter_application_8/core/model/eventModel.dart';
import 'package:flutter_application_8/core/utiltes/firbase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateEvent extends StatelessWidget {
  CreateEvent({super.key});
  int selectedIndex = 0;
  final formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime? selecetedDate;
  TimeOfDay? selecetedTime;

  @override
  Widget build(BuildContext context) {
    String eventName = AppLocalizations.of(context)!.event;
    String eventDate = AppLocalizations.of(context)!.eventDate;
    String eventTime = AppLocalizations.of(context)!.eventTime;
    String chooseDate = AppLocalizations.of(context)!.chooseDate;
    String chooseTime = AppLocalizations.of(context)!.chooseTime;
    String eventLocation = AppLocalizations.of(context)!.eventLocation;
    String eventDescription = AppLocalizations.of(context)!.eventDisciption;
    String addEvent = AppLocalizations.of(context)!.addEvent;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          AppLocalizations.of(context)!.createEvent,
          style: TextStyle(color: AppColors.primaryLight, fontSize: 22),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.navigate_before_outlined,
            color: AppColors.primaryLight,
          ),
          iconSize: 25,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey, // Assign Form Key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventItmeWidget(
                  hig: null,
                  width: null,
                  event: addEvent(),
                ),
                const SizedBox(height: 10),
                Selectedtype(),
                const SizedBox(height: 10),

                Text(AppLocalizations.of(context)!.title),
                const SizedBox(height: 10),

                // Title Input Field
                CustomTextField(
                  hintText: eventName,
                  controller: titleController,
                  prefixIcon: const Icon(Icons.event_note_sharp),
                  color: AppColors.whiteColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter event name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Description Input Field
                CustomTextField(
                  hintText: eventDescription,
                  controller: descriptionController,
                  maxLines: 5,
                  color: AppColors.whiteColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter event description";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Date Selector
                Rowevent(
                  nameIc: eventDate,
                  icon: const Icon(Icons.calendar_today),
                  nmaeButton: chooseDate,
                ),

                // Time Selector
                Rowevent(
                  nameIc: eventTime,
                  icon: const Icon(Icons.timelapse),
                  nmaeButton: chooseTime,
                ),
                const SizedBox(height: 10),

                // Location Input Field (Read-Only)
                CustomTextField(
                  hintText: eventLocation,
                  prefixIcon:
                      const Icon(Icons.my_location, color: Colors.white),
                  suffixIcon:
                      Icon(Icons.navigate_next, color: AppColors.primaryLight),
                  color: AppColors.primaryLight,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter event location";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Add Event Button with Validation
                CustomElevatedButton(
                  text: "Add Event",
                  onClick: () async {
                    if (formKey.currentState!.validate()) {
                      await addEvent;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addEvent() async {
    var events = Eventmodel(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: selecetedDate!,
        time: selecetedTime!.format(context));
    try {
      await Firbase.addEeventToFirstor(events);
      print("Event Added");
    } catch (e) {
      print('eVent Does not add $e');
    }
  }
}
