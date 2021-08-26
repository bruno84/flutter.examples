import 'package:flutter/material.dart';

// IMPORTANTE: só descomente esta linha quando der run uma primeira vez sem isso:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 10-02 - internacionalização"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context)
  {
    return ListView(
        children: [
          // IMPORTANTE: só descomente esta linha quando der run uma primeira vez sem isso:
          Text(AppLocalizations.of(context)!.helloWorld),
        ]

    );
  }


}