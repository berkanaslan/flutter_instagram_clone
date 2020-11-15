import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/components/widgets/profile_photo_widget.dart';
import 'package:frino_icons/frino_icons.dart';

class SinglePostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ProfilePhotoWidget(32, "https://firebasestorage.googleapis.com/v0/b/instagram-clone-from-berkan.appspot.com/o/global%2Fno-profile-photo.png?alt=media&token=eeda3d97-c0c7-4f21-ade3-21421959d4a8",),
              SizedBox(width: 5),
              Text(
                "username",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Image.network(
          "https://source.unsplash.com/5000x5000",
          width: MediaQuery.of(context).size.width,
          height: 350,
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.low,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(icon: Icon(FrinoIcons.f_heart), onPressed: () {}),
                IconButton(icon: Icon(FrinoIcons.f_chat), onPressed: () {}),
                IconButton(icon: Icon(FrinoIcons.f_send), onPressed: () {}),
              ],
            ),
            IconButton(icon: Icon(FrinoIcons.f_bookmark), onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
