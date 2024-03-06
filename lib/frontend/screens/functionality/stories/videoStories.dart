// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoSlider extends StatefulWidget {
  const VideoSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoSliderState createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {
  List<VideoPlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();

    // Initialize the video player controllers
    _controllers = [
      VideoPlayerController.network(''),
      VideoPlayerController.network(''),
      VideoPlayerController.network(''),
    ];

    // Play the videos
    for (var controller in _controllers) {
      controller.initialize().then((_) {
        setState(() {});
        controller.play();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
      ),
      items: _controllers.map((controller) {
        return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        );
      }).toList(),
    );
  }
}

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoSlider extends StatefulWidget {
//   const VideoSlider({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _VideoSliderState createState() => _VideoSliderState();
// }

// class _VideoSliderState extends State<VideoSlider> {
//   final List<String> _videoIds = [
//     '5MhRZp2uunc', // replace with your YouTube video ids
//     'qs-sYNsqPYA',
//     'Id16Y64LzhM',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         aspectRatio: 16 / 9,
//         autoPlay: true,
//       ),
//       items: _videoIds.map((videoId) {
//         return YoutubePlayer(
//           controller: YoutubePlayerController(
//             initialVideoId: videoId,
//             flags: const YoutubePlayerFlags(
//               autoPlay: false,
//               mute: false,
//             ),
//           ),
//           showVideoProgressIndicator: true,
//           progressIndicatorColor: Colors.blueAccent,
//         );
//       }).toList(),
//     );
//   }
// }
