import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';

class Loader extends StatelessWidget {
  final Widget child;
  final bool isCallInProgress;
  final double opacity;
  final Color color;
  final Animation<Color>? valueColor;

  const Loader({
<<<<<<< HEAD
    super.key,
=======
    Key? key,
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
    required this.child,
    required this.isCallInProgress,
    this.color = AppColors.white,
    this.opacity = 0.3,
    this.valueColor,
<<<<<<< HEAD
  });
=======
  }) : super(key: key);
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (isCallInProgress) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(
              dismissible: false,
              color: color,
            ),
          ),
          const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          )
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}