import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DayPickerScreen extends StatefulWidget {
  @override
  _DayPickerScreenState createState() => _DayPickerScreenState();
}

class _DayPickerScreenState extends State<DayPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Day Picker',
          style: TextStyle(color: Theme.of(context).textTheme.headline1.color),
        ),
      ),
      body: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        // padding: EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: [
          ..._days.map((DayModel day) {
            if (day.productiveHours > 5) {
              return _buildLargeBlob(context, day);
            } else if (day.productiveHours <= 5 && day.productiveHours > 3) {
              return _buildMediumBlob(context, day);
            } else {
              return _buildSmallBlob(context, day);
            }
          }).toList(),
        ],
      ),
    );
  }
}

class DayModel {
  final String date;
  final int productiveHours;
  final BlobController ctrl;

  DayModel({
    this.date,
    this.productiveHours,
    this.ctrl,
  });
}

List<DayModel> _days = [
  DayModel(date: 'January 1st', productiveHours: 2, ctrl: BlobController()),
  DayModel(date: 'January 2nd', productiveHours: 1, ctrl: BlobController()),
  DayModel(date: 'January 3rd', productiveHours: 5, ctrl: BlobController()),
  DayModel(date: 'January 4th', productiveHours: 5, ctrl: BlobController()),
  DayModel(date: 'January 5th', productiveHours: 5, ctrl: BlobController()),
  DayModel(date: 'January 6th', productiveHours: 4, ctrl: BlobController()),
  DayModel(date: 'January 7th', productiveHours: 5, ctrl: BlobController()),
  DayModel(date: 'January 8th', productiveHours: 8, ctrl: BlobController()),
  DayModel(date: 'January 9th', productiveHours: 2, ctrl: BlobController()),
  DayModel(date: 'January 10th', productiveHours: 0, ctrl: BlobController()),
];
List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
  const StaggeredTile.fit(1),
];

Widget _buildLargeBlob(context, day) {
  return Center(
    child: Blob.animatedRandom(
      edgesCount: 9,
      minGrowth: 9,
      size: 200,
      styles: BlobStyles(color: Colors.blue.shade700),
      child: Center(
        child: Blob.animatedRandom(
          edgesCount: 9,
          minGrowth: 9,
          size: 190,
          duration: Duration(milliseconds: 500),
          styles: BlobStyles(
            color: Theme.of(context).accentColor,
          ),
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${day.date}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Productive Hours: ${day.productiveHours}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildMediumBlob(context, day) {
  return Center(
    child: Blob.animatedRandom(
      edgesCount: 9,
      minGrowth: 9,
      size: 170,
      styles: BlobStyles(color: Colors.blue.shade700),
      child: Center(
        child: Blob.animatedRandom(
          edgesCount: 9,
          minGrowth: 9,
          size: 150,
          duration: Duration(milliseconds: 500),
          styles: BlobStyles(
            color: Theme.of(context).accentColor,
          ),
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${day.date}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Productive Hours: ${day.productiveHours}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildSmallBlob(context, day) {
  return Center(
    child: Blob.animatedRandom(
      edgesCount: 9,
      minGrowth: 9,
      size: 140,
      styles: BlobStyles(color: Colors.blue.shade700),
      child: Center(
        child: Blob.animatedRandom(
          edgesCount: 9,
          minGrowth: 9,
          size: 120,
          duration: Duration(milliseconds: 500),
          styles: BlobStyles(
            color: Theme.of(context).accentColor,
          ),
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${day.date}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Productive Hours: ${day.productiveHours}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
