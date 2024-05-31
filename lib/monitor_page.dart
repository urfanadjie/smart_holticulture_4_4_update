import 'package:flutter/material.dart';

class MonitorHomePage extends StatefulWidget {
  const MonitorHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MonitorHomePage();

}

class _MonitorHomePage extends State<MonitorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar.medium(
            backgroundColor: Colors.lightGreen.shade50,
            floating: true,
            pinned: true,
            expandedHeight: 160.0,
            stretch: true,
            centerTitle: true,
            title: Text("Monitor", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
          ),
          SliverToBoxAdapter(
            child:
            Text("ini adalah tampilan monitor"),
            ),
          SliverFixedExtentList(
            itemExtent: 75,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.blue,
                child: Text("1"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}