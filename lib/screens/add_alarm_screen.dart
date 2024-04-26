import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({super.key});

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  var hours = 0;
  var minutes = 0;
  var timeFormate = 'AM';
  bool isAlarmOn = true;
  String dropDownRingtoneValue = 'Future.mp3';
  final String ringtonePath = 'ringtones/';
  final audioPlayer = AudioPlayer();

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
                          value: hours,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 80,
                          itemHeight: 60,
                          onChanged: (value) {
                            setState(() {
                              hours = value;
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
                    onTap: () {
                      // playRingtone();
                      // stopRingtone();
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                        value: dropDownRingtoneValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownRingtoneValue = newValue!;
                            print(dropDownRingtoneValue);
                          });
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: 'Future.mp3',
                            child: Text('Future'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Journey.mp3',
                            child: Text('Journey'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Spark.mp3',
                            child: Text('Spark'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Inspirational.mp3',
                            child: Text('Inspirational'),
                          ),
                        ],
                      ))),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                print(hours);
                print(minutes);
                print(timeFormate);
                print(isAlarmOn);
                print(ringtonePath + dropDownRingtoneValue);
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(child: Text('Save')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> playRingtone() async {
    String path = ringtonePath + dropDownRingtoneValue;
    await audioPlayer.play(AssetSource(path));
  }

  Future<void> stopRingtone() async {
    await audioPlayer.stop();
  }
}
