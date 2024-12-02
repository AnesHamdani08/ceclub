import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: 5, vsync: this, animationDuration: Duration.zero);
    super.initState();
  }

  void setTabIndex(int index) {
    tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chat_rounded),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () => setTabIndex(0), child: const Text('Home')),
            TextButton(
                onPressed: () => setTabIndex(1), child: const Text('Events')),
            TextButton(
                onPressed: () => setTabIndex(2),
                child: const Text('Membership')),
            TextButton(
                onPressed: () => setTabIndex(3), child: const Text('About Us'))
          ],
        ),
        actions: [
          OutlinedButton(
              onPressed: () {},
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                    child: Icon(Icons.logout)),
                Text('Sign In'),
                SizedBox(
                  width: 10,
                ),
              ]))
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: const [Text('Hii'), Text('Ola'), Text('ss'), Text('jj')],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
