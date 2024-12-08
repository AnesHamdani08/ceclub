import 'dart:async';

import 'package:ceclub/Tabs/aboutus.dart';
import 'package:ceclub/Tabs/events.dart';
import 'package:ceclub/Tabs/home.dart';
import 'package:ceclub/Tabs/membership.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final StreamController<bool> isLightTheme = StreamController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: isLightTheme.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'CE Club',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: snapshot.data! ? ThemeMode.light : ThemeMode.dark,
            home: const MyHomePage(title: 'Civil Engineering Club'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: 4, vsync: this, animationDuration: Duration.zero);
    super.initState();
  }

  void setTabIndex(int index) {
    tabController.animateTo(index);
  }

  bool selectedIsLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(
          image: AssetImage('ceclub_logo.png'),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () => setTabIndex(0),
                child: Text(AppLocalizations.of(context)!.home)),
            TextButton(
                onPressed: () => setTabIndex(1),
                child: Text(AppLocalizations.of(context)!.events)),
            TextButton(
                onPressed: () => setTabIndex(2),
                child: Text(AppLocalizations.of(context)!.membership)),
            TextButton(
                onPressed: () => setTabIndex(3),
                child: Text(AppLocalizations.of(context)!.aboutus))
          ],
        ),
        actions: [
          const Icon(Icons.light_mode),
          Switch(
              value: !selectedIsLightTheme,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  selectedIsLightTheme = !value;
                });
                Future.delayed(Durations.short2, () {
                  isLightTheme.add(!value);
                });
              }),
          const Icon(Icons.dark_mode),
          const SizedBox(
            width: 5,
          ),
          OutlinedButton(
              onPressed: () {},
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                    child: Icon(Icons.logout)),
                Text(AppLocalizations.of(context)!.signin),
                const SizedBox(
                  width: 10,
                ),
              ]))
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: const [TabHome(), TabEvents(), TabMembership(), TabAboutUs()],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
