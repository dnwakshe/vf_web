import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/broadcast/addBroadCast/add_broadcast_screen.dart';
import 'package:vf_app/utils/utils.dart';

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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.03,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextH5(
                  title: "Recent Update",
                  weight: FontWeight.w500,
                  color: AppColors.black,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddBroadcastScreen()));
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Column(
              children: [
                updateItem(
                  "Regarding discussing the election",
                  "In order to devise important policies for the upcoming elections of your party, as well as to organize the election process effectively",
                  "20th Oct 2025 | 10:00 am",
                  true,
                ),
                const Divider(
                  thickness: 1,
                ),
                updateItem(
                  "Regarding discussing promotional\nstrategies",
                  "How to use social media and digital tools in promotion?\nHow to tackle the challenges of campaigning at the regional level? "
                      "\nImportance of effective speeches, public meetings, rallies to convey the message."
                      " \nPlace - 28-B, Western Express Highway, Nesco, Goregaon, Mumbai, Maharashtra 40006",
                  "20th Oct 2025 | 10:00 am",
                  true,
                ),
                const Divider(
                  thickness: 1,
                ),
                updateItem(
                  "Candidate Selection and Interconstituent \nRelationships",
                  "What are the attributes to look for while choosing the right candidate?\nHow to maintain unity among party constituents and coordinate campaigns?",
                  "20th Oct 2025 | 10:00 am",
                  true,
                ),
                // const Divider(thickness: 1,),
              ],
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
