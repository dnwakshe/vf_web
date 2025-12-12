import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';

class Footer extends StatelessWidget {
  final double height;
  const Footer({super.key, this.height = 72});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '© ${DateTime.now().year} VF App. All rights reserved.',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Row(
            children: [
              _linkChip('Privacy'),
              const SizedBox(width: 8),
              _linkChip('Terms'),
              const SizedBox(width: 8),
              _linkChip('Contact'),
            ],
          )
        ],
      ),
    );
  }

  Widget _linkChip(String title) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
