import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';
import 'package:flutter_application_8/core/Widget/dorbDownonProfile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    String Language = AppLocalizations.of(context)!.language;
    String Themes = AppLocalizations.of(context)!.themeMode;
     final List<String> languages = ["English", "Arabic", "French"];
    final List<String> themes = ["Light", "Dark"];
      String selectedLanguage = "English"; // القيمة الافتراضية
  String selectedTheme = "Light"; 
    return Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryLight,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aya Dwikat",
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 25),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'ayadwikat772@gmail.com',
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Language,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(height: 15),
                  DropdownOnProfile(items:languages, defaultValue: selectedLanguage, onChanged: (String ) {  },),
                  
                  SizedBox(height: 35),
                  Text(
                    Themes,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(height: 15,),
                  DropdownOnProfile(items:themes, defaultValue: selectedTheme, onChanged: (String ) {  },),
                ],
              ),
            ))
          ],
        ));
  }
}
