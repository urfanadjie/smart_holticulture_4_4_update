import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_holticulture_4_4/dashboard_page.dart';
import 'package:smart_holticulture_4_4/monitor_page.dart';
import 'package:smart_holticulture_4_4/profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  int myIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  static final List<Widget> navScreens = <Widget> [
    const DashBoardPage(),
    const MonitorHomePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: navScreens.elementAt(myIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightGreen.shade50,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
          ),
          child: GNav(
            activeColor: Colors.white,
            rippleColor: Colors.grey,
            hoverColor: Colors.grey,
            gap: 8,
            iconSize: 24,
            padding: const EdgeInsets.all(16),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.lightGreenAccent.shade700,
            color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Beranda',
              ),
              GButton(
                icon: Icons.monitor,
                text: 'Monitor',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profil',
              )
            ],
            selectedIndex: myIndex,
            onTabChange: (index) {
              setState(() {
                myIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}