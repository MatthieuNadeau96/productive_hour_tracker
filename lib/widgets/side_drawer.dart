import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  Offset _offset = Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  List<double> limits = [];
  bool isMenuOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    limits = [0, 0, 0, 0, 0, 0];
    WidgetsBinding.instance.addPostFrameCallback(getPositions);
  }

  getPositions(duration) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);
    double start = position.dy - 20;
    double contLimit = position.dy + renderBox.size.height - 20;
    double step = (contLimit - start) / 5;
    limits = [];
    for (double x = start; x <= contLimit; x = x + step) {
      limits.add(x);
    }
    setState(() {
      limits = limits;
    });
  }

  double getSize(int x) {
    double size =
        (_offset.dy > limits[x] && _offset.dy < limits[x + 1]) ? 25 : 20;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sideBarSize = size.width * 0.65;
    double menuContainerHeight = size.height / 2;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 2500),
      left: isMenuOpen ? 0 : -sideBarSize + 20,
      top: 0,
      curve: Curves.elasticOut,
      child: SizedBox(
        width: sideBarSize,
        height: size.height,
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.localPosition.dx <= sideBarSize) {
              setState(() {
                _offset = details.localPosition;
              });
            }

            if (details.localPosition.dx > sideBarSize - 20 &&
                details.delta.distanceSquared > 2) {
              setState(() {
                isMenuOpen = true;
              });
            }
          },
          onPanEnd: (details) {
            setState(() {
              _offset = Offset(0, 0);
            });
          },
          onHorizontalDragUpdate: (details) {
            // print(details.localPosition.dx);
            if (details.localPosition.dx < 100) {
              setState(() {
                isMenuOpen = false;
              });
            }
            if (details.localPosition.dx > 280) {
              setState(() {
                isMenuOpen = true;
              });
            }

            if (details.localPosition.dx <= sideBarSize) {
              setState(() {
                _offset = details.localPosition;
              });
            }

            if (details.localPosition.dx > sideBarSize - 20 &&
                details.delta.distanceSquared > 2) {
              setState(() {
                isMenuOpen = true;
              });
            }
          },
          onHorizontalDragEnd: (details) {
            setState(() {
              _offset = Offset(0, 0);
            });
          },
          child: Stack(
            children: [
              CustomPaint(
                size: Size(sideBarSize, size.height),
                painter: DrawerPainter(offset: _offset),
              ),
              Container(
                height: size.height,
                width: sideBarSize,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 45,
                        ),
                        Text(
                          'Matthieu Nadeau',
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        Container(
                          key: globalKey,
                          width: double.infinity,
                          height: menuContainerHeight,
                          child: Column(
                            children: [
                              MyButton(
                                text: 'Profile',
                                iconData: Icons.person,
                                textSize: getSize(0),
                                height: (menuContainerHeight) / 5,
                              ),
                              MyButton(
                                text: 'Payments',
                                iconData: Icons.payment,
                                textSize: getSize(1),
                                height: (menuContainerHeight) / 5,
                              ),
                              MyButton(
                                text: 'Notifications',
                                iconData: Icons.notifications,
                                textSize: getSize(2),
                                height: (menuContainerHeight) / 5,
                              ),
                              MyButton(
                                text: 'Settings',
                                iconData: Icons.settings,
                                textSize: getSize(3),
                                height: (menuContainerHeight) / 5,
                              ),
                              MyButton(
                                text: 'My Files',
                                iconData: Icons.attach_file,
                                textSize: getSize(4),
                                height: (menuContainerHeight) / 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                right: (isMenuOpen) ? 10 : sideBarSize,
                bottom: 30,
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.black45,
                    size: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      isMenuOpen = false;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerPainter extends CustomPainter {
  final Offset offset;
  DrawerPainter({this.offset});

  double getControlPointX(double width) {
    if (offset.dx == 0) {
      return width;
    } else {
      return offset.dx > width ? offset.dx : width + 75;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();

    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        getControlPointX(size.width), offset.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;

  MyButton({
    this.text,
    this.iconData,
    this.textSize,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black45,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Colors.black45,
              fontSize: textSize,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
