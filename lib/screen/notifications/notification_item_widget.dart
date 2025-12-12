import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
                child: TextH6(
<<<<<<< HEAD
              title: "VF App NGO",
=======
              title: "Shivsena",
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
              weight: FontWeight.w600,
              color: AppColors.textColor,
            )),
            TextH7(
              title: "9:00 Am",
              weight: FontWeight.w400,
              color: AppColors.captionColor,
            )
          ],
        ),
        SizedBox(
          height: Utils.screenHeight * 0.01,
        ),
        const TextH7(
          title:
<<<<<<< HEAD
              "Exciting news! Our latest child welfare program has successfully reached 500 underprivileged children in rural areas. Join us in making a difference...",
=======
              "Eknath Sambhaji Shinde is an Indian politician serving as the 20th and Ex Chief Minister of...",
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
          weight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        SizedBox(
          height: Utils.screenHeight * 0.01,
        ),
        const TextH7(
<<<<<<< HEAD
          title: "Apr 13 2025",
=======
          title: "Arp 13 2025",
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
          weight: FontWeight.w400,
          color: AppColors.captionColor,
        )
      ],
    );
  }
}
