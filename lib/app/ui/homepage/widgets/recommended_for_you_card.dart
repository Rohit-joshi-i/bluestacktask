import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/app_dimensions.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecommendedForYouCard extends StatefulWidget {
  final String? tournamentTitle;
  final String? gameName;
  final String? coverPic;
  RecommendedForYouCard({this.gameName, this.tournamentTitle, this.coverPic});
  @override
  _RecommendedForYouCardState createState() => _RecommendedForYouCardState();
}

class _RecommendedForYouCardState extends State<RecommendedForYouCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.toHeight),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(.6),
              offset: Offset(0, 2),
              blurStyle: BlurStyle.outer,
              blurRadius: 4.toHeight,
              // spreadRadius: 2.toHeight,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ///
          /// Game cover pic
          ///
          CachedNetworkImage(
            imageUrl: widget.coverPic ?? '',
            imageBuilder: (context, imgBuilder) {
              return Container(
                height: 100.toHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.toHeight),
                      topRight: Radius.circular(40.toHeight)),
                  image: DecorationImage(image: imgBuilder, fit: BoxFit.cover),
                ),
              );
            },
            errorWidget: (context, value, _) {
              return Container(
                height: 100.toHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.toHeight),
                      topRight: Radius.circular(40.toHeight)),
                ),
              );
            },
            placeholder: (context, value) {
              return Container(
                height: 100.toHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.toHeight),
                      topRight: Radius.circular(40.toHeight)),
                ),
              );
            },
          ),
          Container(
            height: 65,
            padding: AppDimensions.horizontal16Vertical12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.toHeight),
                  bottomRight: Radius.circular(40.toHeight)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 260.toWidth,
                      child: Text(
                        ///
                        /// Tournament Details
                        ///
                        widget.tournamentTitle ?? '',
                        style: Default.standardTextDefaultStyleW700(
                            fontSize: 16.toFont, color: AppColors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      ///
                      /// Game name
                      ///
                      '${widget.gameName}',
                      style: Default.standardTextDefaultStyleW400(
                          fontSize: 14.toFont, color: AppColors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                ///
                /// Right Icons
                ///
                Icon(
                  Icons.chevron_right,
                  size: 30.toHeight,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
