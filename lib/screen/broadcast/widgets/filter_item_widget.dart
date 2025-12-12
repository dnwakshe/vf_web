<<<<<<< HEAD
=======
import 'dart:developer';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853

import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';

class FilterItemWidget extends StatelessWidget {
  final String filter;
  final int activeIndexFilter;
  final int currentIndex;
  final bool isFilterSelected;
  final Function()? onTap;
  const FilterItemWidget({super.key, required this.filter, required this.activeIndexFilter, required this.currentIndex,required this.onTap, required this.isFilterSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      selected: activeIndexFilter == currentIndex,
      tileColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      selectedTileColor: AppColors.primaryWithOpacity,
      onTap: onTap,
      title: TextH5(title: filter),
      trailing: isFilterSelected ? const Icon(Icons.circle, size: 12, color: AppColors.primary,) : null,
    );
  }
}
