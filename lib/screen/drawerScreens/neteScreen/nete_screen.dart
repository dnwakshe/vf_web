import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';

class NeteScreen extends StatefulWidget {
  const NeteScreen({super.key});

  @override
  State<NeteScreen> createState() => _NeteScreenState();
}

class _NeteScreenState extends State<NeteScreen> {
  List<Netes> neteList = [];

  @override
  void initState() {
    super.initState();
    neteList.add(Netes(
        name: "Shri. Ramdas Kadam",
        position: "Ex. MLA (Khed Vidhansabha)",
        impPath: AssetsConstants.kadamImage));
    neteList.add(Netes(
        name: "Shri. Anandrao Adsul",
        position: "Ex. MP (Amravati)",
        impPath: AssetsConstants.adsulImage));
    neteList.add(Netes(
        name: "Smt. Bhavnatai Gavli",
        position: "MP (Yavatmal, Washim )",
        impPath: AssetsConstants.gavliImage));
    neteList.add(Netes(
        name: "Shri. Prataprao Jadhav",
        position: "MP (Buldhana )",
        impPath: AssetsConstants.jadhavImage));
    neteList.add(Netes(
        name: "Smt. Neelamtai Gorhe",
        position: "",
        impPath: AssetsConstants.gorheImage));
    neteList.add(Netes(
        name: "Smt. Meenatai Kambli",
        position: "",
        impPath: AssetsConstants.kambliImage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: StringConstants.neteTxt.tr(),
          showNotificationIcon: false,
          showSearchIcon: false,
        ),
        body: Center(
          child: Text("Comming soon"),
        )

        //  GridView.builder(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 10.0,
        //     mainAxisSpacing: 24.0,
        //     childAspectRatio: 0.8,
        //   ),
        //   itemCount: neteList.length, // Total number of items
        //   itemBuilder: (context, index) {
        //     return neteItemWidget(name: neteList[index].name,
        //         position: neteList[index].position,
        //         imgPath: neteList[index].impPath);
        //   },
        //   padding: EdgeInsets.all(10.0), // Optional padding for the grid
        // ),
        );
  }

  Widget neteItemWidget({
    required String name,
    required String position,
    required String imgPath,
  }) {
    return Container(
      width: Utils.screenWidth * 0.5,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imgPath,
                width: double.infinity,
                height: Utils.screenHeight * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextH5(
                    title: name,
                    color: AppColors.textColor,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.0),
                  TextH7(
                    title: position,
                    color: AppColors.textColor2,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Netes {
  String name;
  String position;
  String impPath;

  Netes({required this.name, required this.position, required this.impPath});
}
