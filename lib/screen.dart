import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:instastoryapp/constants/constants.dart';
import 'package:instastoryapp/models.dart';
import 'package:instastoryapp/story/storyPage.dart';
import 'package:instastoryapp/story/videoStroyPage.dart';
import 'package:story/story_page_view.dart';


RxInt mainIndex = 0.obs;
RxInt circleInt = 0.obs;

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {


  @override
  Widget build(BuildContext context) {
    ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);

    CarouselSliderController carouselSliderController = CarouselSliderController();

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

                  Obx(() => StoryPageView(
                    key: Key(mainIndex.value.toString()),
                    itemBuilder: (context, pageIndex, storyIndex) {
                      print("pageIndex: $pageIndex, storyIndex: $storyIndex");
                      // final story = storyList[storyIndex];
                      // flag.value = !flag.value;


                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Container(color: Colors.black),
                          ),
                          Positioned.fill(
                            child:
                            VideoStoryPage( videoUrl: 'assets/videos/${profiles[mainIndex.value].stories[storyIndex]}.mp4',
                              key: Key(profiles[mainIndex.value].stories[storyIndex].toString())),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 44, left: 8),
                            child: Row(
                              children: [
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(profiles[mainIndex.value].profilePic),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  profiles[mainIndex.value].username,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  profiles[mainIndex.value].last,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: subhead,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },

                    gestureItemBuilder: (context, pageIndex, storyIndex) {
                      return Stack(children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: Container(
                              width: 96,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    color: Colors.white,
                                    iconSize: 25,
                                    icon: const Icon(Icons.more_horiz),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    },
                                  ),
                                  // SizedBox(width: 5,),

                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    color: Colors.white,
                                    iconSize: 30,
                                    icon: const Icon(Icons.close_sharp),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]);
                    },

                    indicatorAnimationController: indicatorAnimationController,
                    initialStoryIndex: (pageIndex) {
                      return 0;
                    },
                    pageLength: profiles.length,
                    storyLength: (int pageIndex) {
                      return profiles[mainIndex.value].stories.length;
                    },
                    onPageLimitReached: () {
                      mainIndex.value = 0;
                    },

                    onPageChanged: (int index){
                      // mainIndex.value = index;
                      if(mainIndex.value <6) {
                        mainIndex.value = mainIndex.value + 1;
                      } else {
                        mainIndex.value = 0;
                      }
                    },

                  )),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 15.0),
                        child: Container(
                          height: 230,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.0),
                                Colors.grey.withOpacity(0.5),
                              ],
                            ),
                            border: Border.all(
                              style: BorderStyle.none,
                              strokeAlign: BorderSide.strokeAlignCenter
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                  Positioned(
                      bottom: 70,

                      child: Container(
                        // height: 100,
                        width: MediaQuery.sizeOf(context).width,
                        // color: Colors.red,
                        child: Obx(() => CarouselSlider(
                          key:  UniqueKey(),
                          // Key(mainIndex.value.toString()),
                          carouselController: carouselSliderController,
                          items: profiles.map((i) {
                            return Builder(
                              builder: (BuildContext context){
                                return Container(
                                  width: profiles[mainIndex.value].username == i.username ? 120 : 75,
                                  height: profiles[mainIndex.value].username == i.username ? 155 : 85,
                                  // alignment: Alignment.center,
                                  // color: Colors.yellow,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Stack(
                                          children: [

                                            Container(
                                              padding:  EdgeInsets.all(profiles[mainIndex.value].username == i.username ? 4 : 0), // Create space for the gradient border
                                              decoration:profiles[mainIndex.value].username == i.username ? BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                  colors: [Color(0xffe35ba8), Color(0xffc4cefb)],
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                ),
                                              ) : BoxDecoration(),
                                              child: Container(
                                                // height: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  child: ClipOval(child: Image.asset(
                                                    i.profilePic,
                                                    // fit: BoxFit.contain,
                                                    // fit: BoxFit.fitWidth,
                                                  )),
                                                ),),
                                            ),

                                            Positioned(
                                              top: 0,
                                                right: 0,
                                                child: Visibility(
                                                  visible: profiles[mainIndex.value].username == i.username ? true: false,
                                                  child: Container(
                                                    width: 35 ,
                                                    height:35,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white38,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(i.emoji,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                          ],

                                        ),
                                      ),

                                      Text(
                                        '@${i.username}',
                                        style: TextStyle(
                                            color: profiles[mainIndex.value].username == i.username ?
                                            heading : subhead,
                                          fontSize: profiles[mainIndex.value].username == i.username ? 14: 12
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                              height: 155,
                              viewportFraction: 0.27,
                              disableCenter: false,
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
                      bottom: 15,
                      left: 20,
                      right: 5,
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
                                    width: MediaQuery.sizeOf(context).width - 90,
                                  child: Text(
                                    profiles[mainIndex.value].status,
                                    style: TextStyle(
                                        color: heading,
                                        fontSize: 14,
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

                            IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.more_horiz , color: subhead,
                                )
                            ),

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
          color: subhead,
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
            color: subhead,
            fontSize: 11,
          ),
        ),

        Text(
          '${profiles[randomNumber].username}',
          style:  TextStyle(
            color: heading,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
