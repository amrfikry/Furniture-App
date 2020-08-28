import 'package:flutter/material.dart';
import './Custom_icons.dart';
import 'data.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  Widget _buildGradientContainer(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFfbfcfd), Color(0xFFf2f3f8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0])),
      ),
    );
  }

  Widget _builderAppBar() {
    return Positioned(
      top: 40.0,
      left: 20.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(CustomIcons.menu, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CustomIcons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: height * .2,
      left: 30.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Wooden Armchair",
              style: TextStyle(fontSize: 28.0, fontFamily: "Montserrat-Bold")),
          Text("Lorem Ipsem",
              style: TextStyle(fontSize: 16.0, fontFamily: "Montserrat-Medium"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F8),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildGradientContainer(width, height),
              _builderAppBar(),
              _buildTitle(height),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: height * .6,
                  child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (countex, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 17.5,
                          right: 17.5,
                          bottom: 60.0,
                        ),
                        child: SizedBox(
                          width: 200.0,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 75.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (index % 2 == 0)
                                        ? Colors.white
                                        : Color(0xFF2a2d3f),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blueGrey,
                                          offset: Offset(0.0, 10.0),
                                          blurRadius: 15.0)
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    images[index],
                                    width: double.infinity,
                                    height: 220.0,
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title[index],
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: "Montserrat-Bold",
                                            color: (index % 2 == 0)
                                                ? Color(0xFF2a2d3f)
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          'NEW SELL',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontFamily: "Montserrat-Medium",
                                            color: (index % 2 == 0)
                                                ? Color(0xFF2a2d3f)
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50.0,
                                        ),
                                        Text(
                                          price[index] + "\$",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            fontFamily: "Montserrat-Bold",
                                            color: (index % 2 == 0)
                                                ? Color(0xFF2a2d3f)
                                                : Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.panorama_horizontal),
                title: Container(
                  height: 0.0,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                title: Container(
                  height: 0.0,
                )),
          ]),
      floatingActionButton: Container(
        width: 65.0,
        height: 65.0,
        decoration: BoxDecoration(
            color: Color(0xFFfa7b58),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFf78a6c).withOpacity(.4),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0)
            ]),
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 35.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
