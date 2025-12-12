import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/broadcast/addBroadCast/add_broadcast_screen.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/image_with_fallback.dart';

class NewBroadcastScreen extends StatefulWidget {
  const NewBroadcastScreen({super.key});

  @override
  State<NewBroadcastScreen> createState() => _NewBroadcastScreenState();
}

class _NewBroadcastScreenState extends State<NewBroadcastScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  @override
  Widget build(BuildContext context) {
    // Donation screen with QR and receipt note
    final qrSize = screenWidth > 800 ? 320.0 : screenWidth * 0.6;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.03,
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextH5(
              title: "Donate to VF App",
              weight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Column(
                children: [
                  Container(
                    width: qrSize,
                    height: qrSize,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ImageWithFallback.asset(
                        AssetsConstants.image10,
                        fit: BoxFit.cover,
                        width: qrSize,
                        height: qrSize,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Scan the QR code to donate. After donation, you will receive a donation receipt within 1-2 days.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget updateItem(
      String title, String description, String date, bool isOnline) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AssetsConstants.shivSenaImage,
            height: screenHeight * 0.052,
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextH7(
                      title: title,
                      weight: FontWeight.w500,
                    ),
                    TextH7(
                        title: isOnline ? "Online" : "Offline",
                        color: AppColors.primary),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                TextH7(
                  title: description,
                  weight: FontWeight.w500,
                  color: AppColors.textColor4,
                ),
                SizedBox(height: screenHeight * 0.001),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextH7(
                      title: date,
                      weight: FontWeight.w500,
                      color: AppColors.textColor4,
                    ),
                    InkWell(
                      onTap: () {
                        // Define action when "Join" is tapped
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                            horizontal: screenHeight * 0.02),
                        decoration: BoxDecoration(
                          color: AppColors.primaryWithOpacity,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const TextH7(
                          title: "Join",
                          weight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
