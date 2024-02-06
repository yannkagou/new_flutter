import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:new_flutter/main.dart';

class Carouseldots extends StatefulWidget {
  const Carouseldots({Key? key}) : super(key: key);

  @override
  _CarouseldotsState createState() => _CarouseldotsState();
}

class _CarouseldotsState extends State<Carouseldots> {
  late CarouselController carouselController;
  late CarouselController carouselController2;

  List itemsList = [
    {'image': 'assets/besoin adresse 1.png', 'text': "Je m'appelle yannick"},
    {'image': 'assets/besoin adresse 1.png', 'text': "Je m'appelle bertrand"},
    {'image': 'assets/Page1_image 1.png', 'text': "Je m'appelle Kagou"},
  ];

  int currentIndex = 0;
  int currentIndex2 = 0;

  @override
  void initState() {
    carouselController = CarouselController();
    carouselController2 = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  height: 450.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              items: itemsList
                  .map(
                    (item) => Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image.asset(item['image']),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            item['text'],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                  )
                  .toList(),
            ),
            DotsIndicator(
                dotsCount: itemsList.length,
                position: currentIndex,
                decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    size: Size(13, 13),
                    activeSize: Size(13, 13)),
                onTap: (index) {
                  carouselController.animateToPage(index);
                }),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: CarouselSlider(
                  carouselController: carouselController2,
                  items: [
                    for (int i = 0; i < 4; i++)
                      Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 6.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(
                                    0.0, // Move to right 0.0 horizontally
                                    2.0, // Move to bottom 2.0 Vertically
                                  )),
                            ]),
                        child: Text(
                          "Je suis Flutter",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      )
                  ],
                  options: CarouselOptions(
                      onPageChanged: ((index, reason) {
                        setState(() {
                          currentIndex2 = index;
                        });
                      }),
                      autoPlay: false)),
            ),
            DotsIndicator(
                dotsCount: 4,
                position: currentIndex2,
                decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    size: Size(13, 13),
                    activeSize: Size(13, 13)),
                onTap: (index) {
                  carouselController2.animateToPage(index);
                }),
          ]),
        ),
      ),
    ));
  }
}
