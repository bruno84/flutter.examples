import 'package:app_09_01_intl/page_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// IMPORTANTE: só descomente esta linha quando der run uma primeira vez (e der reload) sem isso:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue
      ),

      // Informa que o comportamento dos widgets pode ser alterado conforme o idioma
      localizationsDelegates:
      [
        // IMPORTANTE: só descomente esta linha quando der run uma primeira vez sem isso:
        AppLocalizations.delegate,

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Informa quais idiomas a aplicação suporta
      supportedLocales: [
        Locale('pt', ''), // Português
        Locale('en', ''), // English
      ],

      home: PageHome(),
    );
  }
}