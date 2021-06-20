import 'package:flutter/material.dart';
import 'package:flutter_ui_drawer/shared/config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: isDrawerOpen
                          ? Icon(Icons.arrow_back_ios)
                          : Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          xOffset = isDrawerOpen ? 0 : 230;
                          yOffset = isDrawerOpen ? 0 : 10;
                          scaleFactor = isDrawerOpen ? 1 : 0.95;
                          isDrawerOpen = !isDrawerOpen;
                        });
                      }),
                  Column(
                    children: [
                      Text('Location'),
                      Row(children: [
                        Icon(Icons.location_on),
                        Text('Bengaluru'),
                      ])
                    ],
                  ),
                  CircleAvatar()
                ],
              ),
            ),
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text('Search pet to adopt'),
                  Icon(Icons.settings)
                ],
              ),
            ),
            // Category List Row
            Container(
              height: 120,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (contex, index) {
                    return Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              categories[index]['iconPath'],
                              height: 50,
                              width: 50,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            categories[index]['name'],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            // Pets Display
            _item(
              color: Colors.blueGrey[600],
              image: 'images/pet-cat2.png',
            ),
            _item(
              color: Colors.orange[100],
              image: 'images/pet-cat1.png',
            )
          ],
        ),
      ),
    );
  }
}

Widget _item({Color color, String image}) {
  return Container(
    height: 240,
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: shadowList,
                ),
                margin: EdgeInsets.only(top: 40),
              ),
              Align(
                child: Image.asset(image),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 60, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowList,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sola',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  Icon(Icons.donut_large)
                ],
              ),
              Text(
                'Abyssinian cat',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Text(
                '2 year old',
                style: TextStyle(color: Colors.grey[800], fontSize: 12),
              ),
              Row(
                children: [
                  Icon(Icons.location_on_rounded),
                  Text(
                    'Distance: 3.6 km',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ))
      ],
    ),
  );
}
