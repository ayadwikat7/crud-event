import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/providers/app_providers_languges.dart';
import 'package:flutter_application_8/core/providers/app_them_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var AppLangugeProvider = Provider.of<AppProvidersLanguges>(context);
    var AppThemePrpvider = Provider.of<AppThemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: Column(
        children: [
          Text(AppLocalizations.of(context)!.language),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              value: AppLangugeProvider.AppLanguge,
                isExpanded: true,
                items: [
                  DropdownMenuItem(value: 'en', child: Text('English')),
                  DropdownMenuItem(value: 'ar', child: Text('العربية')),
                ],
                onChanged: (value) {
                  AppLangugeProvider.changeLanguge(value.toString());
                }),
          ),
          Text(AppLocalizations.of(context)!.themeMode),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              value: AppThemePrpvider.appTheme,
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(AppLocalizations.of(context)!.darkMode)),
                  DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(AppLocalizations.of(context)!.lightMode)),
                ],
                onChanged: (value) {
                  if (value != null) {
                    AppThemePrpvider.ChangeTheme(value);
                  }
                }),
          )
        ],
      ),
    );
  }
}
