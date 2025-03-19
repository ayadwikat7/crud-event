import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/providers/app_providers_languges.dart';
import 'package:flutter_application_8/core/providers/app_them_provider.dart';
import 'package:flutter_application_8/core/utiltes/appThem.dart';
import 'package:flutter_application_8/featuers/home/homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvidersLanguges()),
        ChangeNotifierProvider(create: (context) => AppThemProvider()),
      ],
      child: MainApp(), // Provide your MainApp as the child
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var AppLangugeProvider = Provider.of<AppProvidersLanguges>(context);
    var AppThemePrpvider = Provider.of<AppThemProvider>(context);
    return MaterialApp(
      locale: Locale(AppLangugeProvider.AppLanguge),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: AppThemePrpvider.appTheme,
      theme: ThemApp.lightMode,
      darkTheme: ThemApp.darkMode, // Add this line to enable dark mode.
      routes: {
        '/': (context) => Homepage(),
      },
    );
  }
}
