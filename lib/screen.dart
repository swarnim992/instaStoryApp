import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(Icons.dangerous),
            Expanded(
              child: Stack(
                children: [
              
              
                  Obx(() => Container(
                      // height: 700,
                      child: singleStoryPage(profiles[mainIndex.value] , Key(mainIndex.value.toString()))),
                  ),
              
                  // Positioned(
                  //   // top: 100,
                  //   //   right: 0,
                  //   //   bottom: 0,
                  //     child: Container(height: 50, color: Colors.yellow,)),

                  Positioned(
                    bottom: 70,

                      child: Container(
                    // height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    // color: Colors.red,
                    child: Obx(() => CarouselSlider(
                      items: profiles.map((i) {
                        return Builder(
                          builder: (BuildContext context){
                            return Container(
                              width: profiles[mainIndex.value].username == i.username ? 120 : 90,
                              height: profiles[mainIndex.value].username == i.username ? 150 : 100,
                              // alignment: Alignment.center,
                              // color: Colors.yellow,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: profiles[mainIndex.value].username == i.username ?
                                        Colors.pink : Colors.blue,
                                            width: 3
                                        )
                                      // borderRadius: BorderRadius.circular(45)
                                    ),
                                    child: Container(
                                      child: ClipOval(child: Image.asset(i.profilePic,)),
                                    ),
                                  ),

                                  Text(
                                      '@${profiles[mainIndex.value].username}',
                                      style: TextStyle(
                                        color: profiles[mainIndex.value].username == i.username ?
                                            Colors.white : Colors.grey
                                      ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                          height: 150,
                          viewportFraction: 0.3,
                          // enlargeCenterPage: true,
                          initialPage: mainIndex.value,
                          // enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          onPageChanged: (int i, CarouselPageChangedReason reason){
                            mainIndex.value = i;
                            print('reason.index');
                            print(i);
                          }
                      ),

                    )),
                  )
                  ),

                  Positioned(
                      bottom: 10,
                      left: 20,
                      right: 20,
                      child: Container(
                        // height: 100,
                        // width: MediaQuery.sizeOf(context).width,
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() =>  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width - 100,
                                  child: Text(
                                    profiles[mainIndex.value].status,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),

                                SizedBox(height: 2,),

                                likedByRow(),
                              ],
                            )
                            ),
                            
                            Icon(Icons.more_horiz , color: Colors.white,)
                          ],
                        ),
                      )
                  ),
              
              
                ],
              ),
            ),


            // SizedBox(height: 100  ,)
          ],
        ),
      ),
    );
  }

  likedByRow(){
    Random random = new Random();
    int randomNumber = random.nextInt(profiles.length);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle_outlined,
          color: Colors.white,
          size: 20,
        ),

        Container(
          child: ClipOval(
              child: Image.asset(
                profiles[randomNumber].profilePic,
                width: 20,
                height: 20,
              )
          ),
        ),

        SizedBox(width: 10,),

        Text(
          'Liked by ',
          style:  TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),

        Text(
          '${profiles[randomNumber].username}',
          style:  TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
