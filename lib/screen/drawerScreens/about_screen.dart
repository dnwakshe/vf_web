import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/utils/widgets/image_with_fallback.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width > 800 ? 40.0 : 16.0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About Us', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primary)),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageWithFallback.asset(
                  AssetsConstants.slider1Image,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'VF App is a non-profit organisation dedicated to community welfare, child protection, and sustainable rural development. We run programs focused on education, health camps, cow welfare (Gauseve), and volunteer engagement to create meaningful local impact.',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800, height: 1.4),
              ),
              const SizedBox(height: 12),
              Text('Our Mission', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text('To empower communities by providing resources, training and support to improve health, education and livelihoods.', style: TextStyle(color: Colors.grey.shade800)),
              const SizedBox(height: 12),
              Text('Get Involved', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text('Volunteer, donate, or partner with VF App to support local programs and events. Reach out via the Community tab for contact details.', style: TextStyle(color: Colors.grey.shade800)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
