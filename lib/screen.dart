import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instastoryapp/constants/constants.dart';
import 'package:instastoryapp/models.dart';
import 'package:instastoryapp/storyPage.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  RxInt mainIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Text('hello'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Icon(Icons.dangerous),
            Obx(() => Container(
                  height: 700,
                child: StoryPage(userProfile: profiles[mainIndex.value])),
            ),

            Container(
              height: 100,
              child: CarouselSlider(
                items: profiles.map((i) {
                  return Builder(
                    builder: (BuildContext context){
                      return Container(
                        child: Container(
                          child: ClipOval(child: Image.asset(i.profilePic,)),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(45)
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    height: 100,
                    viewportFraction: 0.3,
                  enlargeCenterPage: true,
                  // enlargeStrategy: CenterPageEnlargeStrategy.zoom
                  onPageChanged: (int i, CarouselPageChangedReason reason){
                      mainIndex.value = i;
                      print('reason.index');
                      print(i);
                  }
                ),

              ),
            ),

            SizedBox(height: 100  ,)
          ],
        ),
      ),
    );
  }
}
