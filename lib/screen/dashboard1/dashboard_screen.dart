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
      "Child Welfare Workshop",
      "Comprehensive workshop on protecting children's rights and welfare initiatives. Focus on education, health, and social security for underprivileged children.",
      "15th Dec 2025 | 10:00 am",
      true,
    ));
    upcomingMeetingList.add(UpcomingMeetingModel(
      "Social Issues Awareness Drive",
      "Community engagement program to address critical social issues including poverty, healthcare access, and education. Your participation is vital!",
      "20th Dec 2025 | 02:00 pm",
      true,
    ));
    upcomingMeetingList.add(UpcomingMeetingModel(
      "Gauseve & Animal Protection Seminar",
      "Discussion on cow protection initiatives, sustainable dairy practices, and animal welfare. Learn how you can contribute to our Gauseve program.",
      "25th Dec 2025 | 11:00 am",
      true,
    ));
    upcomingMeetingList.add(UpcomingMeetingModel(
        "Political Advocacy & Policy Discussion",
        "Strategic discussion on influencing policy for social welfare. How can we advocate for better governance and community rights?",
        "28th Dec 2025 | 03:00 pm",
        true));
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = screenWidth > 800;
    
    if (isWeb) {
      return _buildWebDashboard();
    } else {
      return _buildMobileDashboard();
    }
  }

  Widget _buildWebDashboard() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          carouselSliderWidget(),
          // Welcome Section
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Our NGO',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Dedicated to Social Welfare & Community Development',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 24),
                // Four Main Focus Areas
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _buildFocusAreaCard(
                      'Child Welfare',
                      'Protecting & supporting children\'s education, health & rights',
                      Colors.blue,
                      Icons.child_care,
                    ),
                    _buildFocusAreaCard(
                      'Social Issues',
                      'Addressing poverty, healthcare, education & equality',
                      Colors.green,
                      Icons.people,
                    ),
                    _buildFocusAreaCard(
                      'Political Advocacy',
                      'Influencing policy for community welfare & governance',
                      Colors.orange,
                      Icons.gavel,
                    ),
                    _buildFocusAreaCard(
                      'Gauseve',
                      'Cow protection & animal welfare initiatives',
                      Colors.brown,
                      Icons.pets,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(thickness: 2),
          // Impact & Statistics
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Impact',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard('50,000+', 'Children Supported'),
                    _buildStatCard('1,000+', 'Communities Reached'),
                    _buildStatCard('500+', 'Active Volunteers'),
                    _buildStatCard('100+', 'Policy Initiatives'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(thickness: 2),
          // Events & Meetings
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming Programs',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.2,
                  children: List.generate(
                    upcomingMeetingList.length,
                    (index) => _buildEventCard(upcomingMeetingList[index]),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildMobileDashboard() {
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
        ],
      ),
    );
  }

  //carouselSliderWidget
  Widget carouselSliderWidget() {
    bool isWeb = screenWidth > 800;
    final double height = isWeb ? 320.0 : screenHeight * 0.24;

    final List<String> captions = [
      'Welcome to Our NGO',
      'Social Welfare Initiative',
    ];

    return Column(
      children: [
        SizedBox(
          height: height,
          child: CarouselSlider(
            items: imgList.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              return Container(
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(100, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20.0),
                            child: Text(
                              captions[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            }).toList(),
            carouselController: _controller,
            options: CarouselOptions(
                height: height,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: isWeb ? 16 / 6 : 16 / 9,
                enlargeFactor: 0.18,
                viewportFraction: isWeb ? 0.8 : 0.95,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        const SizedBox(height: 8),
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

  // Web-specific builder methods
  Widget _buildFocusAreaCard(
    String title,
    String description,
    Color color,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(UpcomingMeetingModel meeting) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meeting.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Text(
            meeting.description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 14,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                meeting.date,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              if (meeting.isOnline)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
