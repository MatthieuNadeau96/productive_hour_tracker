import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: ListView.builder(
            itemCount: 24,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.075,
                      width: size.width * 0.1,
                      margin: EdgeInsets.only(right: 15),
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.075,
                      margin: EdgeInsets.only(
                          right: 15, left: 15, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: 1,
                            color: Colors.grey[500],
                          ),
                          Container(
                            height: size.height * 0.075,
                            width: size.width * 0.20,
                            child: IconButton(
                              icon: Icon(
                                Icons.check,
                                size: 35,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            width: size.width * 0.25,
                            height: 1,
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
