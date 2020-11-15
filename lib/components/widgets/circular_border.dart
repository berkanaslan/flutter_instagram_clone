import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/models/story.dart';
import 'package:flutter_instagram_clone/components/widgets/profile_photo_widget.dart';
import 'package:flutter_instagram_clone/components/widgets/story.dart';

class StoryWidget extends StatefulWidget {
  Story _story;

  StoryWidget(Story story) {
    this._story = story;
  }

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget>
    with SingleTickerProviderStateMixin {
  /// Variables
  Animation gap;
  Animation base;
  Animation reverse;
  AnimationController controller;

  /// Init
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 3.0, end: 0.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  /// Dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: RotationTransition(
              turns: base,
              child: CircularBorder(
                gapSize: gap.value,
                dashes: 20,
                color: Color(0XFFED4634),
                child: RotationTransition(
                  turns: reverse,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ProfilePhotoWidget(48, "https://firebasestorage.googleapis.com/v0/b/instagram-clone-from-berkan.appspot.com/o/global%2Fno-profile-photo.png?alt=media&token=eeda3d97-c0c7-4f21-ade3-21421959d4a8"),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget._story.sharedBy.length < 10
                ? widget._story.sharedBy
                : widget._story.sharedBy.substring(0, 7) + "...",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
