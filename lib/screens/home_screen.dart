import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Productive Hour Tracker'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        child: GridView.count(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 100 / 50,
          crossAxisCount: 1,
          children: [
            ..._hours.map(
              (HourModal h) => Container(
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                margin: EdgeInsets.symmetric(vertical: 25),
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${h.hour}',
                              style: TextStyle(
                                fontSize: 28,
                              ),
                            ),
                            Text(
                              '${h.meridiem}',
                              style: TextStyle(
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
                          Container(
                            height: size.height * 0.2,
                            width: size.width * 0.28,
                            child: Center(
                              child: Blob.random(
                                edgesCount: 5,
                                minGrowth: 7,
                                size: 120,
                                styles: BlobStyles(
                                  color: Colors.indigo,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      h.changeIcon = !h.changeIcon;
                                      h.longPressed = false;
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      h.longPressed = !h.longPressed;
                                    });
                                  },
                                  child: Icon(
                                    (h.changeIcon)
                                        ? Icons.check
                                        : (h.longPressed)
                                            ? Icons.remove_circle_outline
                                            : Icons.cancel,
                                    size: 35,
                                    color: Colors.white,
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
    );
  }
}

class HourModal {
  final String hour;
  final String meridiem;
  bool changeIcon;
  bool longPressed;

  HourModal({
    this.hour,
    this.changeIcon = false,
    this.longPressed = false,
    this.meridiem,
  });
}

List<HourModal> _hours = [
  HourModal(hour: '1', meridiem: 'am'),
  HourModal(hour: '2', meridiem: 'am'),
  HourModal(hour: '3', meridiem: 'am'),
  HourModal(hour: '4', meridiem: 'am'),
  HourModal(hour: '5', meridiem: 'am'),
  HourModal(hour: '6', meridiem: 'am'),
  HourModal(hour: '7', meridiem: 'am'),
  HourModal(hour: '8', meridiem: 'am'),
  HourModal(hour: '9', meridiem: 'am'),
  HourModal(hour: '10', meridiem: 'am'),
  HourModal(hour: '12', meridiem: 'pm'),
  HourModal(hour: '1', meridiem: 'pm'),
  HourModal(hour: '2', meridiem: 'pm'),
  HourModal(hour: '3', meridiem: 'pm'),
  HourModal(hour: '4', meridiem: 'pm'),
  HourModal(hour: '5', meridiem: 'pm'),
  HourModal(hour: '6', meridiem: 'pm'),
  HourModal(hour: '7', meridiem: 'pm'),
  HourModal(hour: '8', meridiem: 'pm'),
  HourModal(hour: '9', meridiem: 'pm'),
  HourModal(hour: '10', meridiem: 'pm'),
  HourModal(hour: '11', meridiem: 'pm'),
  HourModal(hour: '12', meridiem: 'am'),
];
