import 'package:ceclub/controls/fancy_container.dart';
import 'package:ceclub/styles/styles_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<StatefulWidget> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Stack(children: [
        const FancyContainer(
            size: Size.fromHeight(512),
            cycle: Duration(seconds: 30),
            colors: [Colors.blue, Colors.red, Colors.green]),
        Column(children: <Widget>[
          const SizedBox(
            height: 64,
          ),
          Row(mainAxisSize: MainAxisSize.max, children: [
            const SizedBox(
              width: 20,
            ),
            Column(children: [
              Text(
                AppLocalizations.of(context)!.cecLong,
                style: TextStyles.header,
              ),
              Text(
                'Building the Foundations of Tomorrow',
                style: TextStyles.subHeader,
              )
            ]),
            const Spacer(),
            const Image(
              image: AssetImage('ceclub_logo.png'),
              width: 384,
              height: 384,
            ),
            const SizedBox(width: 96)
          ])
        ]),
      ])
    ]);
  }
}
