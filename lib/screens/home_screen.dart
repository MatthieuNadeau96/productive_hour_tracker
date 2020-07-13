import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:productive_hour_tracker/widgets/my_blob_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    BlobController blobCtrl = BlobController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                    (HourModal h) => MyBlobContainer(
                      myBlobColor: Colors.blue.shade700,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  onTap: () {
                                    BlobData blobData = h.ctrl.change();
                                    print(blobData);
                                    setState(() {
                                      h.changeIcon = !h.changeIcon;
                                      h.longPressed = false;
                                    });
                                  },
                                  onLongPress: () {
                                    BlobData blobData = h.ctrl.change();
                                    print(blobData);
                                    setState(() {
                                      h.longPressed = !h.longPressed;
                                    });
                                  },
                                  child: Container(
                                    // height: size.height * 0.2,
                                    // width: size.width * 0.28,
                                    child: Blob.animatedRandom(
                                      edgesCount: 7,
                                      minGrowth: 8,
                                      size: 100,
                                      controller: h.ctrl,
                                      duration: Duration(milliseconds: 500),
                                      styles: BlobStyles(
                                        color: Theme.of(context).accentColor,
                                      ),
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
    );
  }
}

class HourModal {
  final String hour;
  final String meridiem;
  final BlobController ctrl;
  bool changeIcon;
  bool longPressed;

  HourModal({
    this.hour,
    this.changeIcon = false,
    this.longPressed = false,
    this.meridiem,
    this.ctrl,
  });
}

List<HourModal> _hours = [
  HourModal(hour: '1', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '2', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '3', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '4', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '5', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '6', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '7', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '8', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '9', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '10', meridiem: 'am', ctrl: BlobController()),
  HourModal(hour: '12', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '1', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '2', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '3', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '4', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '5', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '6', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '7', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '8', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '9', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '10', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '11', meridiem: 'pm', ctrl: BlobController()),
  HourModal(hour: '12', meridiem: 'am', ctrl: BlobController()),
];
