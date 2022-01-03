import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'elo_rating.dart';

class ProfileTile extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final int? eloRating;
  final String? avatarPicture;
  ProfileTile(
      {this.lastName, this.firstName, this.eloRating, this.avatarPicture});
  @override
  _ProfileTileState createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///
        /// Profile picture
        ///
        CachedNetworkImage(
          imageUrl: widget.avatarPicture ?? '',
          imageBuilder: (context, imgBuilder) {
            return Container(
              width: 100.toHeight,
              height: 100.toHeight,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imgBuilder)),
            );
          },
          errorWidget: (context, value, _) {
            return Container(
              width: 100.toHeight,
              height: 100.toHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            );
          },
          placeholder: (context, value) {
            return Container(
              width: 100.toHeight,
              height: 100.toHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            );
          },
        ),
        SizedBox(
          width: 20.toWidth,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ///
            /// User name
            ///
            Text(
              '${widget.firstName} ${widget.lastName}',
              style: Default.standardTextDefaultStyleW600(
                  fontSize: 20.toFont, color: AppColors.black),
            ),
            SizedBox(
              height: 20.toHeight,
            ),

            ///
            /// Elo rating widget
            ///
            EloRating(
              eloRating: widget.eloRating,
            )
          ],
        )
      ],
    );
  }
}
