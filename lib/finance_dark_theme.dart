import 'package:flutter/material.dart';
import 'package:portfolio/widgets/circular_clipper.dart';
import 'package:portfolio/widgets/rectangular_clipper.dart';
import 'package:portfolio/widgets/triangular_clipper.dart';

//fot the design https://dribbble.com/shots/17195869-Finance-Dark-theme-Design/attachments/12296436?mode=media
class FinanceDarkTheme extends StatelessWidget {
  FinanceDarkTheme({Key? key}) : super(key: key);

  final ThemeData specialThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.yellow[700],
    accentColor: Colors.orange[500],
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 18.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: specialThemeData,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(size.width * 0.1),
              child: Column(
                children: [
                  row1(size),
                  SizedBox(height: size.height * 0.15),
                  row2(size),
                  SizedBox(height: size.height * 0.075),
                  row3(size)
                ],
              )),
        ),
      ),
    );
  }

  Widget row3(Size size) {
    return SizedBox(
      height: size.height * 0.125,
      child: Stack(children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(size.height * 0.05),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.005,
          left: size.width * 0.225,
          child: Opacity(
            opacity: 0.2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipPath(
                  clipper: CustomRectangularClipper(),
                  child: Icon(
                    Icons.search,
                    size: size.height * 0.065,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Search',
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
    //);
  }

  Widget row1(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()..rotateZ(-90 * 3.1415927 / 180),
            child: ClipPath(
                clipper: CustomTriangleClipper(),
                child: Icon(
                  Icons.menu,
                  size: size.height * 0.045,
                ))),
        Container(
            height: size.height * 0.065,
            width: size.width * 0.15,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(size.height * 0.001),
                child: Icon(Icons.person, size: size.width * 0.14)))
      ],
    );
  }

  Widget row2(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello David',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('Welcome Back',
                style: TextStyle(
                  fontSize: 13,
                ))
          ],
        ),
        Container(
            height: size.height * 0.06,
            width: size.width * 0.13,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(size.height * 0.001),
                child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..rotateZ(-90 * 3.1415927 / 180),
                    child: Icon(Icons.settings_input_component_outlined,
                        size: size.width * 0.1))))
      ],
    );
  }
}
