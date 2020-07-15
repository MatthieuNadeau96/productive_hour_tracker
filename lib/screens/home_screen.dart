import 'dart:math';

import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:productive_hour_tracker/screens/day_picker_screen.dart';
import 'package:productive_hour_tracker/widgets/my_blob_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Squeesh',
          style: TextStyle(color: Theme.of(context).textTheme.headline1.color),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.ellipsisV),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.calendar,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayPickerScreen()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    mainAxisSpacing: 10,
                    childAspectRatio: 100 / 35,
                    crossAxisCount: 1,
                    children: [
                      ..._hours.map(
                        (HourModel h) => MyBlobContainer(
                          myBlobNumber: h.blobNumber,
                          myBlobColor: Theme.of(context).primaryColorDark,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(200),
                          //   color: Theme.of(context).primaryColorDark,
                          // ),
                          // width: MediaQuery.of(context).size.width * 0.75,
                          // margin: EdgeInsets.symmetric(horizontal: 15),

                          // height: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${h.hour}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 38,
                                        ),
                                      ),
                                      Text(
                                        '${h.meridiem}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: Feedback.wrapForTap(() {
                                        BlobData blobData = h.ctrl.change();
                                        print(blobData);
                                        setState(() {
                                          h.changeIcon = !h.changeIcon;
                                          h.longPressed = false;
                                        });
                                      }, context),
                                      onLongPress:
                                          Feedback.wrapForLongPress(() {
                                        BlobData blobData = h.ctrl.change();
                                        print(blobData);
                                        setState(() {
                                          h.longPressed = !h.longPressed;
                                        });
                                      }, context),
                                      child: Container(
                                        child: Center(
                                          child: Blob.animatedRandom(
                                            edgesCount: 7,
                                            minGrowth: 8,
                                            size: 110,
                                            controller: h.ctrl,
                                            duration:
                                                Duration(milliseconds: 1000),
                                            styles: BlobStyles(
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                            child: Center(
                                              child: Blob.animatedRandom(
                                                edgesCount: 7,
                                                minGrowth: 8,
                                                size: 90,
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                styles: BlobStyles(
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                ),
                                                child: Center(
                                                  child: FaIcon(
                                                    (h.longPressed)
                                                        ? FontAwesomeIcons
                                                            .circle
                                                        : (h.changeIcon)
                                                            ? FontAwesomeIcons
                                                                .check
                                                            : FontAwesomeIcons
                                                                .times,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

int _randomNumber() {
  Random random = new Random();
  int randomNumber = random.nextInt(4) + 1;
  return randomNumber;
}

class HourModel {
  final String hour;
  final String meridiem;
  final BlobController ctrl;
  final int blobNumber;
  bool changeIcon;
  bool longPressed;

  HourModel({
    this.hour,
    this.changeIcon = false,
    this.longPressed = false,
    this.meridiem,
    this.ctrl,
    this.blobNumber,
  });
}

List<HourModel> _hours = [
  HourModel(
    hour: '1',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 1,
  ),
  HourModel(
    hour: '2',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 2,
  ),
  HourModel(
    hour: '3',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 3,
  ),
  HourModel(
    hour: '4',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 4,
  ),
  HourModel(
    hour: '5',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 1,
  ),
  HourModel(
    hour: '6',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 2,
  ),
  HourModel(
    hour: '7',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 3,
  ),
  HourModel(
    hour: '8',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 4,
  ),
  HourModel(
    hour: '9',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 1,
  ),
  HourModel(
    hour: '10',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 2,
  ),
  HourModel(
    hour: '12',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 3,
  ),
  HourModel(
    hour: '1',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 4,
  ),
  HourModel(
    hour: '2',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 1,
  ),
  HourModel(
    hour: '3',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 2,
  ),
  HourModel(
    hour: '4',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 3,
  ),
  HourModel(
    hour: '5',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 4,
  ),
  HourModel(
    hour: '6',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 1,
  ),
  HourModel(
    hour: '7',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 2,
  ),
  HourModel(
    hour: '8',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 3,
  ),
  HourModel(
    hour: '9',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 4,
  ),
  HourModel(
    hour: '10',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 1,
  ),
  HourModel(
    hour: '11',
    meridiem: 'pm',
    ctrl: BlobController(),
    blobNumber: 2,
  ),
  HourModel(
    hour: '12',
    meridiem: 'am',
    ctrl: BlobController(),
    blobNumber: 3,
  ),
];
