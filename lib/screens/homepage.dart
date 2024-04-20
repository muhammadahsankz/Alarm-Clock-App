import 'package:alarm_clock_app/screens/add_alarm_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isAlarmOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Clock App'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  gradient:
                      LinearGradient(colors: [Colors.blueAccent, Colors.white]),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Switch(
                            value: isAlarmOn,
                            activeColor: Colors.transparent,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.black38,
                            onChanged: (value) {
                              setState(() {
                                isAlarmOn = value;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          '02:35 PM',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.delete,
                          size: 30,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // body: Center(
      //   child: Container(
      //     width: MediaQuery.of(context).size.width / 2,
      //     child: AnalogClock(
      //       dialColor: Colors.white,
      //       markingColor: Colors.deepOrange,
      //       hourNumberColor: Colors.black,
      //       hourHandColor: Colors.green,
      //       minuteHandColor: Colors.green,
      //       secondHandColor: Colors.green,
      //       centerPointColor: Colors.green,
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddAlarmScreen()));
        },
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
