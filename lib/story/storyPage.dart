import 'package:flutter/material.dart';
import 'package:instastoryapp/models.dart';
import 'package:instastoryapp/story/videoStroyPage.dart';
import 'package:story/story_image.dart';
import 'package:story/story_page_view.dart';

import '../constants/constants.dart';

class StoryPage extends StatefulWidget {
  final UserProfile userProfile;
  const StoryPage({Key? key, required this.userProfile}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          // final user = sampleUsers[pageIndex];
          final story = widget.userProfile.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: StoryImage(
                  key: ValueKey(story.imageUrl),
                  imageProvider: NetworkImage(
                    story.imageUrl,
                  ),
                  fit: BoxFit.fitWidth,
                ),
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
                          image: AssetImage(widget.userProfile.profilePic),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.userProfile.username,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                ),
              ),
            ),
          ]);
        },

        indicatorAnimationController: indicatorAnimationController,

        initialStoryIndex: (pageIndex) {
          return 0;
        },
        pageLength: 1,
        storyLength: (int pageIndex) {
          return widget.userProfile.stories.length;
        },
        // onPageLimitReached: () {
        //   Navigator.pop(context);
        // },

      ),
    );
  }
}

singleStoryPage(UserProfile userProfile , Key key){
  ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand.resume);

  return StoryPageView(
    key: key,

    itemBuilder: (context, pageIndex, storyIndex) {
      print("pageIndex: $pageIndex, storyIndex: $storyIndex");
      final story = userProfile.stories[storyIndex];
      return Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.black),
          ),
          Positioned.fill(
            child: StoryImage(
              key: ValueKey(story.imageUrl),
              imageProvider: NetworkImage(
                story.imageUrl,
              ),
              fit: BoxFit.fitWidth,
            ),
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
                      image: AssetImage(userProfile.profilePic),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  userProfile.username,
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
                  userProfile.last,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
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
      if(pageIndex > 0) return 0;
      return 0;
    },
    pageLength: 1,
    storyLength: (int pageIndex) {
      print('i am story lenth ${userProfile.stories.length}');
      return userProfile.stories.length;
    },
    onPageLimitReached: () {
      // Navigator.pop(context);
    },

  );
}

singleStoryPage1(UserProfile userProfile , Key key){
  ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand.resume);

  return StoryPageView(
    key: key,

    itemBuilder: (context, pageIndex, storyIndex) {
      print("pageIndex: $pageIndex, storyIndex: $storyIndex");
      final story = userProfile.stories[storyIndex];
      return Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.black),
          ),
          Positioned.fill(
            child: VideoStoryPage(
                videoUrl: 'assets/videos/1.mp4',
                // videoUrl: 'https://www.example.com/video.mp4'
            ),
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
                      image: AssetImage(userProfile.profilePic),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  userProfile.username,
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
                  userProfile.last,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
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
      if(pageIndex > 0) return 0;
      return 0;
    },
    pageLength: 1,
    storyLength: (int pageIndex) {
      return 1;
      print('i am story lenth ${userProfile.stories.length}');
      return userProfile.stories.length;
    },
    onPageLimitReached: () {
      // Navigator.pop(context);
    },

  );
}

