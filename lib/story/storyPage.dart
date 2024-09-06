// import 'dart:ffi';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instastoryapp/models.dart';
// import 'package:instastoryapp/story/videoStroyPage.dart';
// import 'package:story/story_image.dart';
// import 'package:story/story_page_view.dart';
// import 'package:video_player/video_player.dart';
//
// import '../constants/constants.dart';
// import '../screen.dart';
//
// class StoryPage extends StatefulWidget {
//   final UserProfile userProfile;
//   // final Key key;
//   const StoryPage({Key? key, required this.userProfile}) : super(key: key);
//
//   @override
//   _StoryPageState createState() => _StoryPageState();
// }
//
// class _StoryPageState extends State<StoryPage> {
//   late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
//
//   @override
//   void initState() {
//     super.initState();
//     indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
//         IndicatorAnimationCommand.resume);
//   }
//
//   @override
//   void dispose() {
//     indicatorAnimationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
//         IndicatorAnimationCommand.resume);
//
//     Random random = new Random();
//     int stroyCount = random.nextInt(5) + 1;
//     RxList storyList = [].obs;
//     for(int i=0;i<stroyCount;i++){
//       storyList.add(random.nextInt(18)+1);
//     }
//     RxBool flag = true.obs;
//
//     return Scaffold(
//       body: StoryPageView(
//         key: widget.key,
//
//         itemBuilder: (context, pageIndex, storyIndex) {
//           print("pageIndex: $pageIndex, storyIndex: $storyIndex");
//           // final story = storyList[storyIndex];
//           flag.value = !flag.value;
//           // mainIndex.value = pageIndex;
//
//           return Stack(
//             children: [
//               Positioned.fill(
//                 child: Container(color: Colors.black),
//               ),
//               Positioned.fill(
//                 // child: VideoStoryPage(
//                 //     videoUrl: 'assets/videos/$story.mp4',
//                 //   indicatorAnimationController: indicatorAnimationController,
//                 //
//                 // ),
//                 child: Obx(() => (flag.value || !flag.value)?
//                 VideoStoryPage( videoUrl: 'assets/videos/${storyList[storyIndex]}.mp4',
//                 key: Key(storyList[storyIndex].toString()),)
//                 : SizedBox()),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 44, left: 8),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 32,
//                       width: 32,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(widget.userProfile.profilePic),
//                           fit: BoxFit.cover,
//                         ),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                     Text(
//                       widget.userProfile.username,
//                       style: const TextStyle(
//                         fontSize: 17,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     const SizedBox(
//                       width: 8,
//                     ),
//                     Text(
//                       widget.userProfile.last,
//                       style: const TextStyle(
//                         fontSize: 15,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//
//         gestureItemBuilder: (context, pageIndex, storyIndex) {
//
//           return Stack(children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 32),
//                 child: Container(
//                   width: 96,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         padding: EdgeInsets.zero,
//                         color: Colors.white,
//                         iconSize: 25,
//                         icon: const Icon(Icons.more_horiz),
//                         onPressed: () {
//                           // Navigator.pop(context);
//                         },
//                       ),
//                       // SizedBox(width: 5,),
//
//                       IconButton(
//                         padding: EdgeInsets.zero,
//                         color: Colors.white,
//                         iconSize: 30,
//                         icon: const Icon(Icons.close_sharp),
//                         onPressed: () {
//                           // Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ]);
//         },
//
//         indicatorAnimationController: indicatorAnimationController,
//         initialStoryIndex: (pageIndex) {
//           if(pageIndex > 5) return 0;
//           return 0;
//         },
//         pageLength: 5,
//         storyLength: (int pageIndex) {
//           return stroyCount;
//           // print('i am story lenth ${userProfile.stories.length}');
//           // return userProfile.stories.length;
//         },
//         onPageLimitReached: () {
//           // Navigator.pop(context);
//         },
//
//       ),
//     );
//   }
//
//   singleStoryPage1(UserProfile userProfile , Key key){
//     ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
//         IndicatorAnimationCommand.resume);
//
//     Random random = new Random();
//     int stroyCount = random.nextInt(5) + 1;
//     List storyList = [];
//     for(int i=0;i<stroyCount;i++){
//       storyList.add(random.nextInt(18)+1);
//     }
//
//     return StoryPageView(
//       key: key,
//
//       itemBuilder: (context, pageIndex, storyIndex) {
//         print("pageIndex: $pageIndex, storyIndex: $storyIndex");
//         final story = storyList[storyIndex];
//
//
//         return Stack(
//           children: [
//             Positioned.fill(
//               child: Container(color: Colors.black),
//             ),
//             Positioned.fill(
//               // child: VideoStoryPage(
//               //     videoUrl: 'assets/videos/$story.mp4',
//               //   indicatorAnimationController: indicatorAnimationController,
//               //
//               // ),
//               child: videoPlayer(story),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 44, left: 8),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 32,
//                     width: 32,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(userProfile.profilePic),
//                         fit: BoxFit.cover,
//                       ),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     userProfile.username,
//                     style: const TextStyle(
//                       fontSize: 17,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     userProfile.last,
//                     style: const TextStyle(
//                       fontSize: 15,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//
//       gestureItemBuilder: (context, pageIndex, storyIndex) {
//         return Stack(children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 32),
//               child: Container(
//                 width: 96,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       padding: EdgeInsets.zero,
//                       color: Colors.white,
//                       iconSize: 25,
//                       icon: const Icon(Icons.more_horiz),
//                       onPressed: () {
//                         // Navigator.pop(context);
//                       },
//                     ),
//                     // SizedBox(width: 5,),
//
//                     IconButton(
//                       padding: EdgeInsets.zero,
//                       color: Colors.white,
//                       iconSize: 30,
//                       icon: const Icon(Icons.close_sharp),
//                       onPressed: () {
//                         // Navigator.pop(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ]);
//       },
//
//       indicatorAnimationController: indicatorAnimationController,
//       initialStoryIndex: (pageIndex) {
//         if(pageIndex > 0) return 0;
//         return 0;
//       },
//       pageLength: 1,
//       storyLength: (int pageIndex) {
//         return stroyCount;
//         print('i am story lenth ${userProfile.stories.length}');
//         return userProfile.stories.length;
//       },
//       onPageLimitReached: () {
//         // Navigator.pop(context);
//       },
//
//     );
//   }
//
//   videoPlayer(int story){
//     late VideoPlayerController _controller;
//
//     _controller = VideoPlayerController.asset('assets/videos/$story.mp4')
//       ..initialize().then((value) {
//         setState(() {
//           _controller.play();
//         });
//       });
//
//     return  _controller.value.isInitialized
//         ? AspectRatio(
//       aspectRatio: _controller.value.aspectRatio,
//       child: VideoPlayer(_controller,),
//     )
//         : Center(child: CircularProgressIndicator());
//   }
//
// }
//
// // singleStoryPage(UserProfile userProfile , Key key){
// //   ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
// //       IndicatorAnimationCommand.resume);
// //
// //   return StoryPageView(
// //     key: key,
// //
// //     itemBuilder: (context, pageIndex, storyIndex) {
// //       print("pageIndex: $pageIndex, storyIndex: $storyIndex");
// //       final story = userProfile.stories[storyIndex];
// //       return Stack(
// //         children: [
// //           Positioned.fill(
// //             child: Container(color: Colors.black),
// //           ),
// //           Positioned.fill(
// //             child: StoryImage(
// //               key: ValueKey(story.imageUrl),
// //               imageProvider: NetworkImage(
// //                 story.imageUrl,
// //               ),
// //               fit: BoxFit.fitWidth,
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(top: 44, left: 8),
// //             child: Row(
// //               children: [
// //                 Container(
// //                   height: 32,
// //                   width: 32,
// //                   decoration: BoxDecoration(
// //                     image: DecorationImage(
// //                       image: AssetImage(userProfile.profilePic),
// //                       fit: BoxFit.cover,
// //                     ),
// //                     shape: BoxShape.circle,
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   width: 8,
// //                 ),
// //                 Text(
// //                   userProfile.username,
// //                   style: const TextStyle(
// //                     fontSize: 17,
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //
// //                 const SizedBox(
// //                   width: 8,
// //                 ),
// //                 Text(
// //                   userProfile.last,
// //                   style: const TextStyle(
// //                     fontSize: 15,
// //                     color: Colors.grey,
// //                     fontWeight: FontWeight.w400,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       );
// //     },
// //
// //     gestureItemBuilder: (context, pageIndex, storyIndex) {
// //       return Stack(children: [
// //         Align(
// //           alignment: Alignment.topRight,
// //           child: Padding(
// //             padding: const EdgeInsets.only(top: 32),
// //             child: Container(
// //               width: 96,
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   IconButton(
// //                     padding: EdgeInsets.zero,
// //                     color: Colors.white,
// //                     iconSize: 25,
// //                     icon: const Icon(Icons.more_horiz),
// //                     onPressed: () {
// //                       // Navigator.pop(context);
// //                     },
// //                   ),
// //                   // SizedBox(width: 5,),
// //
// //                   IconButton(
// //                     padding: EdgeInsets.zero,
// //                     color: Colors.white,
// //                     iconSize: 30,
// //                     icon: const Icon(Icons.close_sharp),
// //                     onPressed: () {
// //                       // Navigator.pop(context);
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ]);
// //     },
// //
// //     indicatorAnimationController: indicatorAnimationController,
// //
// //     initialStoryIndex: (pageIndex) {
// //       if(pageIndex > 0) return 0;
// //       return 0;
// //     },
// //     pageLength: 1,
// //     storyLength: (int pageIndex) {
// //       print('i am story lenth ${userProfile.stories.length}');
// //       return userProfile.stories.length;
// //     },
// //     onPageLimitReached: () {
// //       // Navigator.pop(context);
// //     },
// //
// //   );
// // }
//
//
