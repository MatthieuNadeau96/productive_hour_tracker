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
        title: Text('Squeesh'),
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
                    crossAxisSpacing: 10,
                    childAspectRatio: 100 / 50,
                    crossAxisCount: 1,
                    children: [
                      ..._hours.map(
                        (HourModel h) => MyBlobContainer(
                          myBlobColor: Colors.blue.shade700,
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
                                        child: Blob.animatedRandom(
                                          edgesCount: 7,
                                          minGrowth: 8,
                                          size: 110,
                                          controller: h.ctrl,
                                          duration: Duration(milliseconds: 500),
                                          styles: BlobStyles(
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                          child: Center(
                                            child: FaIcon(
                                              (h.longPressed)
                                                  ? FontAwesomeIcons.circle
                                                  : (h.changeIcon)
                                                      ? FontAwesomeIcons.check
                                                      : FontAwesomeIcons.times,
                                              size: 25,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HourModel {
  final String hour;
  final String meridiem;
  final BlobController ctrl;
  bool changeIcon;
  bool longPressed;

  HourModel({
    this.hour,
    this.changeIcon = false,
    this.longPressed = false,
    this.meridiem,
    this.ctrl,
  });
}

List<HourModel> _hours = [
  HourModel(hour: '1', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '2', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '3', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '4', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '5', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '6', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '7', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '8', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '9', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '10', meridiem: 'am', ctrl: BlobController()),
  HourModel(hour: '12', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '1', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '2', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '3', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '4', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '5', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '6', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '7', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '8', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '9', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '10', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '11', meridiem: 'pm', ctrl: BlobController()),
  HourModel(hour: '12', meridiem: 'am', ctrl: BlobController()),
];
