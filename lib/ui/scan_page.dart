import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_holticulture_4_4/constants/constants_value.dart';
import 'package:smart_holticulture_4_4/ui/screens/monitoring/plant_aglaonema.dart';
import 'package:smart_holticulture_4_4/ui/screens/monitoring/plant_sanseviera.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  String realTimeValue = '0';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute (builder: (BuildContext context) => PlantAglaonema(),),);
                      },
                      icon: Icon(
                        Icons.share,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset("assets/plant/plant_anthurium.png"),
                              title: Text('Aglaonema sp.', style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor),),
                              subtitle:
                              Text('Tanaman'),
                              trailing: Icon(Icons.monitor),
                              isThreeLine: true,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('Monitor'),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) => PlantAglaonema()));
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                ]
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset("assets/plant/plant_anthurium.png"),
                              title: Text('Sanseviera', style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor),),
                              subtitle:
                              Text('Tanaman'),
                              trailing: Icon(Icons.monitor),
                              isThreeLine: true,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('Monitor'),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) => PlantSanseviera()));
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            left: 20,
            child: Center(
              child: FutureBuilder(
                future: _fApp,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Koneksi Bermasalah", style: TextStyle(color: Constants.primaryColor, fontWeight: FontWeight.bold),);
                  } else if (snapshot.hasData) {
                    return Text("Terhubung", style: TextStyle(color: Constants.primaryColor, fontWeight: FontWeight.bold),);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
