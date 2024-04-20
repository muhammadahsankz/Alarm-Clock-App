import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({super.key});

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  var hour = 0;
  var minutes = 0;
  var timeFormate = 'AM';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Alarm'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberPicker(
                          minValue: 0,
                          maxValue: 12,
                          value: hour,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 80,
                          itemHeight: 60,
                          onChanged: (value) {
                            setState(() {
                              hour = value;
                            });
                          },
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          selectedTextStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black))),
                        ),
                        NumberPicker(
                          minValue: 0,
                          maxValue: 59,
                          value: minutes,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 80,
                          itemHeight: 60,
                          onChanged: (value) {
                            setState(() {
                              minutes = value;
                            });
                          },
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          selectedTextStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black))),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  timeFormate = 'AM';
                                });
                              },
                              child: Container(
                                child: Text(
                                  'AM',
                                  style: TextStyle(
                                      color: timeFormate == 'AM'
                                          ? Colors.white
                                          : Colors.green,
                                      fontSize: 20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: timeFormate == 'AM'
                                        ? Colors.green
                                        : Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  timeFormate = 'PM';
                                });
                              },
                              child: Container(
                                child: Text(
                                  'PM',
                                  style: TextStyle(
                                      color: timeFormate == 'PM'
                                          ? Colors.white
                                          : Colors.green,
                                      fontSize: 20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: timeFormate == 'PM'
                                        ? Colors.green
                                        : Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Text('Select ringtone')),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
