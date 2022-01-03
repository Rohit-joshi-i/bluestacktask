import 'package:bluestacktask/app/bloc/bloc_common_state.dart';
import 'package:bluestacktask/app/bloc/homepage_bloc/homepage_bloc.dart';
import 'package:bluestacktask/app/bloc/homepage_bloc/homepage_state.dart';
import 'package:bluestacktask/app/ui/common/custom_floating_button.dart';
import 'package:bluestacktask/app/ui/homepage/recommended_for_you.dart';
import 'package:bluestacktask/app/ui/homepage/stats/profile_stats.dart';
import 'package:bluestacktask/app/ui/homepage/widgets/profile_tile.dart';
import 'package:bluestacktask/common_utils/screenutil.dart';
import 'package:bluestacktask/resources/app_colours.dart';
import 'package:bluestacktask/resources/app_dimensions.dart';
import 'package:bluestacktask/resources/fonts/inter.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  HomepageBloc? homepageBloc;
  String? avatarName = ''; //initialise the avatar name
  int pageLimit = 20; //page limit to send in the api
  String? cursor = '';
  bool? isLastBatch =
      false; //to check if the current batch of tournament is last
  bool? isFetchingData =
      false; //to not to fetch the data when in the loading state
  @override
  void initState() {
    homepageBloc = BlocProvider.of<HomepageBloc>(context);

    //Event to fetch user details
    homepageBloc!.getUserDetails();
    //Event to fetch initial tournament list
    homepageBloc!.getMoreTournaments(pageLimit, cursor);

    //Scroll listener when reaching the end of the list
    scrollController.addListener(() async {
      //Condition for checking if we reached end
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // to check for the internet connectivity
        ConnectivityResult result = await Connectivity().checkConnectivity();
        if (!isLastBatch! &&
            !isFetchingData! &&
            result !=
                ConnectivityResult
                    .none) //error when sending limit more than 100
          homepageBloc!
              .getMoreTournaments(pageLimit, cursor); //fetch more tournaments
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        drawer: Drawer(
          child: Center(
              child: Padding(
            padding: AppDimensions.horizontal16,
            child: Text(
              Translations.getInstance.text(Translations.kNothingHere)!,
              style: Default.standardTextDefaultStyleW700(
                  fontSize: 20.toFont, color: AppColors.primaryText),
              textAlign: TextAlign.center,
            ),
          )),
        ),
        backgroundColor: AppColors.homepageBackground,
        body: BlocConsumer<HomepageBloc, HomepageState>(
          bloc: homepageBloc,
          listener: (context, state) {
            if (state is LoadMoreTournament &&
                state.status == Status.completed) {
              //call function to update last batch value
              _updatePageLimitAndCount(state.isLastBatch!);
              cursor = state.cursor; //updating the latest value of cursor
              isFetchingData = false;
            } else if (state is LoadMoreTournament &&
                state.status == Status.loading) {
              //changing value if fetching data to stop more api calls
              isFetchingData = true;
            } else if (state is LoadMoreTournament &&
                state.status == Status.error) {
              //changing value if fetching data to start more api calls
              isFetchingData = false;
            }
          },
          buildWhen: (previous, current) {
            if (current is LoadProfile) {
              //load profile only for Load Profile state
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state.status == Status.loading)

              ///
              /// Loading while fteching the data
              ///
              return SpinKitThreeBounce(
                color: AppColors.primaryText,
                size: 100.toHeight,
              );
            if (state.status == Status.completed && state is LoadProfile)

              ///
              /// Showing data for completed state
              ///
              return SingleChildScrollView(
                controller: scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                primary: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.toHeight,),
                    Padding(
                      padding: AppDimensions.horizontal16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Builder(

                              ///
                              /// Code to open drawer on click
                              ///
                              builder: (context) => GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: Icon(
                                      Icons.menu,
                                      color: AppColors.black,
                                    ),
                                  )),
                          Spacer(),
                          Text(
                            state.userProfileModel?.avatarName ?? '',
                            style: Default.standardTextDefaultStyleW700(
                                fontSize: 16.toFont, color: AppColors.black),
                          ),
                          Spacer(),
                          SizedBox.shrink()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.toHeight,
                    ),

                    ///
                    /// Profile tile
                    ///
                    Padding(
                      padding: AppDimensions.horizontal24,
                      child: ProfileTile(
                        firstName: state.userProfileModel?.firstName ?? '',
                        lastName: state.userProfileModel?.lastName ?? '',
                        eloRating: state.userProfileModel?.eloRating,
                        avatarPicture: state.userProfileModel?.avatarImage,
                      ),
                    ),
                    SizedBox(
                      height: 30.toHeight,
                    ),

                    ///
                    /// Tournaments stats
                    ///
                    Padding(
                      padding: AppDimensions.horizontal24,
                      child: ProfileStats(
                        tournamentCount:
                            state.userProfileModel?.tournamentsPlayed,
                        tournamentWon: state.userProfileModel?.tournamentsWon,
                      ),
                    ),
                    SizedBox(
                      height: 30.toHeight,
                    ),

                    ///
                    /// Recommended for you section
                    ///
                    Padding(
                      padding: AppDimensions.horizontal24,
                      child: RecommendedForYou(),
                    ),
                  ],
                ),
              );

            ///
            /// Error screen for error state while fetchng the data
            ///
            return Container(
              child: Center(
                child: Column(children: [
                  SizedBox(
                    height: 50.toHeight,
                  ),
                  Text(
                    Translations.getInstance.text(Translations.kSomethingWentWrong)!,
                    style: Default.standardTextDefaultStyleW700(
                        fontSize: 20.toFont, color: AppColors.primaryText),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.toHeight,
                  ),
                  CustomFloatingButton(
                    buttonColor: AppColors.primaryText,
                    title: Translations.getInstance.text(Translations.kTryAgain),
                    onSubmitPress: _fetchUserData, //callback function
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }

  //update page limit and last batch status
  _updatePageLimitAndCount(bool isLast) {
    isLastBatch = isLast;
  }

  //fetching user details on try again press
  _fetchUserData() {
    homepageBloc!.getUserDetails();
    homepageBloc!.getMoreTournaments(pageLimit, cursor);
  }
}
