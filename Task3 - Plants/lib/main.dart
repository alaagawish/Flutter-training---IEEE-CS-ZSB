// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 6, child: New()),
    );
  }
}

class New extends StatefulWidget {
  @override
  N createState() => N();
}

void click() {}

class N extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          isScrollable: true,
          tabs: [
            Tab(
              child: Text(
                'Palm',
              ),
            ),
            Tab(
              child: Text(
                'Bird of paradise',
              ),
            ),
            Tab(
              child: Text(
                'Dracaena',
              ),
            ),
            Tab(
              child: Text(
                'Fiddle',
              ),
            ),
            Tab(
              child: Text(
                'Fiddle',
              ),
            ),
            Tab(
              child: Text(
                'Fiddle',
              ),
            ),
          ],
        ),
        title: Text(
          'STATUS',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: TabBarView(children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 20),
          child: Row(children: [
            Image.asset(
              'Images/palm.jpg',
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              widthFactor: 0,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 180,
                            widget: Text(
                              '80% \nLight',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -25,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Text(
                              '25% \nFood',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -90,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Text(
                              '40% \nWater',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -140,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                ),
              ]),
            ),
            Center(
              widthFactor: 0.1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: 200,
                    height: 50,
                    onPressed: click,
                    child: Text(
                      'TAKE CARE',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.black),
                width: MediaQuery.of(context).size.width / 2,
              ),
            )
          ]),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 20),
          child: Row(children: [
            Image.asset(
              'Images/bird.jpg',
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              widthFactor: 0.7,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 180,
                            widget: Text(
                              '80% \nLight',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -30,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Text(
                              '25% \nFood',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -185,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Text(
                              '40% \nWater',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -140,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                )
              ]),
            ),
            Center(
              widthFactor: 0.000001,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: 200,
                    height: 50,
                    onPressed: click,
                    child: Text(
                      'TAKE CARE           ',textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    color: Colors.black),
                width: MediaQuery.of(context).size.width ,
              ),
            )
          ]),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 20),
          child: Row(children: [
            Image.asset(
              'Images/dracaena.jpg',
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              widthFactor: 0.7,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 180,
                            widget: Text(
                              '50% \nLight',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -90,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Text(
                              '30% \nFood',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -180,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: (MediaQuery.of(context).size.height) / 6,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Text(
                              '25% \nWater',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                      showLabels: false,
                      showTicks: false,
                      startAngle: -270,
                      endAngle: -185,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.07,
                        color: Colors.black,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: [
                        RangePointer(
                          value: 1,
                          width: 0.15,
                          color: Colors.white,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    ),
                  ]),
                )
              ]),
            ),
            Center(
              widthFactor: 0.0001,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: 200,
                    height: 50,
                    onPressed: click,
                    child: Text(
                      'TAKE CARE      ',
                      style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12,),
                    ),
                    color: Colors.black),
                // width: MediaQuery.of(context).size.width ,
              ),
            )
          ]),
        ),
        //tab4
        Container(
          color: Colors.white,
          child: Row(
            children: [Text('')],
          ),
        ),
        //tab5
        Container(
          color: Colors.white,
          child: Row(
            children: [Text('')],
          ),
        ),
        //tab6
        Container(
          color: Colors.white,
          child: Row(
            children: [Text('')],
          ),
        ),
      ]),
    );
  }
}
