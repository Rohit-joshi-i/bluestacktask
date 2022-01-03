import 'package:bluestacktask/app/bloc/bloc_common_state.dart';
import 'package:bluestacktask/app/bloc/homepage_bloc/homepage_bloc.dart';
import 'package:bluestacktask/app/bloc/homepage_bloc/homepage_state.dart';
import 'package:bluestacktask/app/repository/model/tournament_list_model.dart';
import 'package:bluestacktask/app/ui/homepage/widgets/recommended_for_you_card.dart';
import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/app_dimensions.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RecommendedForYou extends StatefulWidget {
  @override
  _RecommendedForYouState createState() => _RecommendedForYouState();
}

class _RecommendedForYouState extends State<RecommendedForYou> {
  List<Tournament> activeList = []; //initialise empty list
  HomepageBloc? homepageBloc;

  @override
  void initState() {
    homepageBloc = BlocProvider.of<HomepageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Translations.getInstance.text(Translations.kRecommendedForYou)!,
          style: Default.standardTextDefaultStyleW500(
              fontSize: 20.toFont, color: AppColors.black),
        ),
        SizedBox(
          height: 30.toHeight,
        ),
        BlocConsumer<HomepageBloc, HomepageState>(
          bloc: homepageBloc,
          listener: (context, state) {
            if (state is LoadMoreTournament &&
                state.status == Status.completed) {
              ///
              /// adding all the list received in the response
              ///
              activeList.addAll(state.tournamentList!.tournaments!);
            }
          },
          buildWhen: (prev, current) {
            if (current is LoadMoreTournament) {
              return true; //build list when fetching more data
            }
            return false;
          },
          builder: (context, state) {
            ///
            /// Show loading when fetching for more tournaments element
            ///
            if (state.status == Status.loading && activeList.isEmpty)
              return Center(
                child: SpinKitThreeBounce(
                  color: AppColors.primaryText,
                  size: 100.toHeight,
                ),
              );

            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: activeList.length +
                  1, //length + 1 to show loader when Fetching for more elements
              primary: false,
              itemBuilder: (context, index) {
                if (state.status == Status.loading &&
                    index == activeList.length) {
                  return Padding(
                    padding: AppDimensions.bottom80,
                    child: SpinKitDancingSquare(color: AppColors.primaryText),
                  );
                } else if (index == activeList.length) {
                  return SizedBox.shrink();
                }

                ///
                ///
                /// bottom padding for the last element
                ///
                ///
                return Padding(
                  padding: index == activeList.length - 1 &&
                          state.status != Status.loading
                      ? AppDimensions.bottom80
                      : AppDimensions.all0,
                  child: RecommendedForYouCard(
                    gameName: activeList[index].gameName,
                    tournamentTitle: activeList[index].name,
                    coverPic: activeList[index].coverUrl,
                  ),
                );
              },
              separatorBuilder: (context, state) {
                return SizedBox(
                  height: 30.toHeight,
                );
              },
            );
          },
        )
      ],
    );
  }
}
