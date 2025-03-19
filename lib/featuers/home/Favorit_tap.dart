import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';
import 'package:flutter_application_8/core/Widget/EventItmeWidget.dart';
import 'package:flutter_application_8/core/Widget/TextWidget.dart';
import 'package:flutter_application_8/core/model/eventModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritTap extends StatefulWidget {
  const FavoritTap({super.key});

  @override
  State<FavoritTap> createState() => _FavoritTapState();
}

class _FavoritTapState extends State<FavoritTap> {
  List<Eventmodel> eventList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getFavoriteEvents();
  }

  void getFavoriteEvents() async {
    try {
      var events = await FirebaseFirestore.instance.collection('Events')
          .where('isFavorite', isEqualTo: true) // Fetch only favorite events
          .get();

      setState(() {
        eventList = events.docs.map((doc) => 
          Eventmodel.fromFireStore(doc.data() as Map<String, dynamic>)
        ).toList();
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching favorite events: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String searchHint = AppLocalizations.of(context)!.searchHint;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text("Favorites"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Textwidget(
              max: 1,
              ic: Icon(Icons.search),
              colorcont: AppColors.whiteColor,
              suffexIcons: null,
              readonly: false,
              hint: searchHint,
            ),
            SizedBox(height: 15),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator()) // Show loading indicator
                  : eventList.isEmpty
                      ? Center(child: Text("No favorite events found"))
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          itemCount: eventList.length,
                          itemBuilder: (context, index) {
                            return EventItmeWidget(
                              hig: null,
                              width: null,
                              event: eventList[index],
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
