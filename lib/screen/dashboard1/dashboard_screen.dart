import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/upcoming_event_card.dart';
import 'package:vf_app/utils/widgets/upcoming_meeting_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  late TabController tabController;

  List<UpcomingMeetingModel> upcomingMeetingList = [];

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imgList = [
    AssetsConstants.slider1Image,
    AssetsConstants.slider2Image,
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    upcomingMeetingList.add(UpcomingMeetingModel(
      "Regarding discussing the election",
      "In order to devise important policies for the upcoming elections of your party, as well as to organize the election process effectively",
      "20th Oct 2025 | 10:00 am",
      true,
    ));
    upcomingMeetingList.add(UpcomingMeetingModel(
      "Regarding discussing promotional\nstrategies",
      "How to use social media and digital tools in promotion?\nHow to tackle the challenges of campaigning at the regional level? "
          "\nImportance of effective speeches, public meetings, rallies to convey the message."
          " \nPlace - 28-B, Western Express Highway, Nesco, Goregaon, Mumbai, Maharashtra 40006",
      "20th Oct 2025 | 10:00 am",
      true,
    ));
    upcomingMeetingList.add(UpcomingMeetingModel(
      "Candidate Selection and Interconstituent \nRelationships",
      "What are the attributes to look for while choosing the right candidate?\nHow to maintain unity among party constituents and coordinate campaigns?",
      "20th Oct 2025 | 10:00 am",
      true,
    ));
    upcomingMeetingList.add(UpcomingMeetingModel(
        "Diwali Pahat", "description", "1 Nov, 2025", true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          carouselSliderWidget(),
          TabBar(
            controller: tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textColor2,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(
                text: StringConstants.upcomingEventsTxt.tr(),
              ),
              Tab(
                text: StringConstants.upcomingMeetingsTxt.tr(),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [upcomingEventsWidget(), upcomingMeetingsWidget()],
            ),
          )
          // upcomingEventsWidget()
        ],
      ),
    );
  }

  //carouselSliderWidget
  Widget carouselSliderWidget() {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: const Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              enlargeFactor: 0.18,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 34.0 : 12.0,
                height: screenHeight * 0.012,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColors.white
                            : AppColors.primary)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget upcomingEventsWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.005,
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const UpcomingEventCard();
                }),
            SizedBox(
              height: screenHeight * 0.1,
            )
          ],
        ),
      ),
    );
  }

  Widget upcomingMeetingsWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.005,
            ),
            ListView.builder(
                itemCount: upcomingMeetingList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return UpcomingMeetingItem(
                    title: upcomingMeetingList[index].title,
                    description: upcomingMeetingList[index].description,
                    date: upcomingMeetingList[index].date,
                    isOnline: upcomingMeetingList[index].isOnline,
                  );
                }),
            SizedBox(
              height: screenHeight * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
