// import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/bullet_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // late DashboardProvider dashboardProvider;
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  final List<String> imgList = [
    AssetsConstants.image10,
    AssetsConstants.image13,
    AssetsConstants.image17,
    AssetsConstants.image25,
  ];
  @override
  void initState() {
    // dashboardProvider = context.read<DashboardProvider>();
    // dashboardProvider.getWeatherData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // dashboardProvider = context.watch<DashboardProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // dashboardProvider.getWeatherData(context);
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => WeatherScreen()));
                },
                child: carouselSliderWidget(),
              ),
              WebData()
            ],
          ),
        ),
      ),
    );
  }

  //carouselSliderWidget
  Widget carouselSliderWidget() {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map(
                (item) => Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Utils.screenHeight * 0.01,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
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
                                  Color.fromARGB(0, 0, 0, 0),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
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
                    ),
                  ),
                ),
              )
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
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 34.0 : 12.0,
                height: Utils.screenHeight * 0.012,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle,
                  color:
                      (Theme.of(context).brightness == Brightness.dark
                              ? AppColors.white
                              : AppColors.primary)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

Widget WebData() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        // Title
        const Text(
          "Web Test", 
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),

        // Subtitle Line
        Container(
          height: 3,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 20),

        // About Section
        const Text(
          "Who We Are",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),

        const Text(
          "Ther Vinaryal Foundation is a non-profit organization working to uplift children's "
          "lives through educational support, nutrition, healthcare, and community empowerment. "
          "We believe every child deserves equal opportunities to grow and thrive.",
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),

        // Work Section
        const Text(
          "What We Do",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 14),

        bullet("📘 Child education support with school materials"),
        bullet("🥗 Nutrition and welfare programs for children"),
        bullet("👨‍👧 Mentorship, guidance, and community development"),
        bullet("🎯 Skill-building programs and workshops"),
        const SizedBox(height: 24),

        // Vision Section
        const Text(
          "Our Vision",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),

        const Text(
          "To create a society where every child—regardless of background—has access to "
          "education, proper nutrition, emotional support, and the resources needed to achieve their dreams.",
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),
      ],
    ),
  );
}


