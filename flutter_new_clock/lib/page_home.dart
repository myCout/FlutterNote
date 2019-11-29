import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return buildClock();
    return buildDarkClock();
  }

  buildDarkClock() {
    return Container(
        color: Colors.amberAccent,
        child: AnalogClock.dark(
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black),
              color: Colors.transparent,
              shape: BoxShape.circle),
          width: 50.0,
          showSecondHand: true,
          showNumbers: true,
          showTicks: true,
          showDigitalClock: false,
          datetime: DateTime(2019, 1, 1, 9, 12, 15),
        ));
  }

  buildClock() {
    return Container(
      color: Colors.amberAccent,
      child:  AnalogClock(
        decoration: BoxDecoration(
            border: Border.all(width: 5.0, color: Colors.black),
            color: Colors.transparent,
            shape: BoxShape.circle),
        width: 150.0,
        isLive: true,
        hourHandColor: Colors.black,
        minuteHandColor: Colors.black,
        showSecondHand: true,
        numberColor: Colors.black87,
        showNumbers: true,
        textScaleFactor: 1.4,
        showTicks: true,
        showDigitalClock: false,
        datetime: DateTime(2019, 1, 1, 9, 12, 15),
      ),
    );
  }
}
