import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_holticulture_4_4/constants/constants_value.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PlantSanseviera extends StatefulWidget {
  const PlantSanseviera({super.key});

  @override
  State<PlantSanseviera> createState() => _PlantSansevieraState();
}

class _PlantSansevieraState extends State<PlantSanseviera> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('tanaman');
  var data;

  var dataObject;

  var dataTemp = 0;
  var dataLight = "";
  var dataHumy = 0;
  var dataName = "";
  var dataStatus = "";
  var dataSoilMoisture = 0;

  @override
  void initState() {
    super.initState();
    dbRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          dataObject = event.snapshot.value;
          print(dataObject);
          dataTemp = dataObject['sanseviera']['temp'].toInt();
          dataHumy = dataObject['sanseviera']['humy'];
          dataLight = dataObject['sanseviera']['lumens'];
          dataSoilMoisture = dataObject['sanseviera']['pH'];
          dataStatus = dataObject['sanseviera']['status'];
          dataName = dataObject['sanseviera']['name'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dataName,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(42.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                _tampilStatus(),
                const SizedBox(height: 30,),
                _getGauge(),
                _getRadialGaugeHumy(),
                _getRadialGaugeSoilMoisture(),
                _tampilLampu()
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _tampilStatus() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            'Status',
            style: TextStyle(color: Constants.primaryColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dataStatus,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Constants.primaryColor, fontSize: 24),
          ),
        ],
      ),
    );
  }

  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        title: const GaugeTitle(
            text: "Temperatur (°C)",
            textStyle:
            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              value: dataTemp.toDouble(),
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(
                  dataTemp.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getLinearGauge() {
    return Container(
      margin: EdgeInsets.all(10),
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 20),
          axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
    );
  }

  Widget _getRadialGaugeHumy() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        title: const GaugeTitle(
            text: "Kelembaban (%)",
            textStyle:
            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
          ], pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              value: dataHumy.toDouble(),
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(
                  dataHumy.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getRadialGaugeSoilMoisture() {
    return SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        title: const GaugeTitle(
            text: "Kelembaban Tanah",
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 100, maximum: 1024, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 100,
                endValue: 500,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 500,
                endValue: 900,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 900,
                endValue: 1024,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
          ], pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              value: dataSoilMoisture.toDouble(),
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(
                  dataSoilMoisture.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _tampilLampu() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const Text(
            'Kondisi Cahaya',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            dataLight,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
          )
        ],
      ),
    );
  }

}

class PlantData {
  String? temp;
  String? humy;
  String? name;

  PlantData({this.temp, this.humy, this.name});

  PlantData.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    humy = json['humy'];
    name = json['name'];
  }
}
