// import 'package:flutter/material.dart';
// import 'package:story_view/story_view.dart';
// import 'package:video_player/video_player.dart';

// class StoriesScreen extends StatefulWidget {
//   @override
//   _StoriesScreenState createState() => _StoriesScreenState();
// }

// class _StoriesScreenState extends State<StoriesScreen> {
//   final StoryController controller = StoryController();

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> storyItems = [
//       AssetVideoStoryItem(
//         storyController: controller,
//         assetName:
//             'assets/video.mp4', // Replace with the path of your asset video
//       ),
//       // Add more AssetVideoStoryItems as needed
//     ];

//     return Material(
//       child: StoryView(
//         controller: controller,
//         onComplete: () {
//           Navigator.pop(context);
//         },
//         storyItems: [],
//       ),
//     );
//   }
// }

// class AssetVideoStoryItem extends StatefulWidget {
//   final StoryController storyController;
//   final String assetName;

//   AssetVideoStoryItem({required this.storyController, required this.assetName});

//   @override
//   _AssetVideoStoryItemState createState() => _AssetVideoStoryItemState();
// }

// class _AssetVideoStoryItemState extends State<AssetVideoStoryItem> {
//   late VideoPlayerController _videoPlayerController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController = VideoPlayerController.asset(widget.assetName)
//       ..initialize().then((_) {
//         setState(() {});
//         widget.storyController.play();
//         _videoPlayerController.play();
//       });

//     widget.storyController.addListener(() {
//       if (widget.storyController.isPaused) {
//         _videoPlayerController.pause();
//       } else {
//         _videoPlayerController.play();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _videoPlayerController.value.isInitialized
//         ? VideoPlayer(_videoPlayerController)
//         : Container();
//   }
// }
