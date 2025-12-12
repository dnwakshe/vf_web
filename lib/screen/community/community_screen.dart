import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
// removed unused imports
import 'package:vf_app/constants/assets_constants.dart';
// removed unused imports
import 'package:vf_app/utils/utils.dart';
// svg widget not used here
import 'package:flutter/services.dart';
// community_item_card and search_text_field removed (not used in NGO contact screen)
import 'package:vf_app/utils/widgets/footer.dart';
import 'package:vf_app/utils/widgets/image_with_fallback.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {

  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
              child: ListView(
                children: [
                  const SizedBox(height: 8),
                  // 3-image gallery
                  _communityGallery(),
                  const SizedBox(height: 12),
                  // additional grid of images
                  _moreGalleryGrid(),
                  const SizedBox(height: 12),
                  Text(
                    'Connect with us',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Follow our social channels to stay updated about programs, volunteer opportunities and news.',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _socialItem('Facebook', 'https://facebook.com/vfapp', Icons.facebook),
                      _socialItem('Twitter', 'https://twitter.com/vfapp', Icons.travel_explore),
                      _socialItem('Instagram', 'https://instagram.com/vfapp', Icons.camera_alt),
                      _socialItem('YouTube', 'https://youtube.com/vfapp', Icons.ondemand_video),
                      _socialItem('WhatsApp', 'https://wa.me/1234567890', Icons.chat),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 12),
                  Text(
                    'Contact',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text('Email: info@vfapp.org', style: TextStyle(color: Colors.grey.shade700)),
                  const SizedBox(height: 4),
                  Text('Phone: +91 98765 43210', style: TextStyle(color: Colors.grey.shade700)),
                ],
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }

  Widget _socialItem(String label, String url, IconData icon) {
    return InkWell(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: url));
        Utils.showCustomSnackBar(context, '$label link copied to clipboard');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 2)),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _communityGallery() {
    final galleryHeight = screenWidth > 800 ? 180.0 : 110.0;
    final radius = BorderRadius.circular(10);
    final gap = 12.0;

    final List<Map<String, String>> items = [
      {'image': AssetsConstants.image1, 'title': 'Child Welfare Drive'},
      {'image': AssetsConstants.image2, 'title': 'Gauseve Outreach'},
      {'image': AssetsConstants.image3, 'title': 'Volunteer Meetup'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Highlights',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        LayoutBuilder(builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 600;
          if (isNarrow) {
            return Column(
              children: items.map((it) {
                return Padding(
                  padding: EdgeInsets.only(bottom: gap),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: radius,
                        child: ImageWithFallback.asset(
                          it['image']!,
                          width: 120,
                          height: galleryHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(it['title']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }

          return Row(
            children: items.map((it) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: it == items.last ? 0 : gap),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: radius,
                        child: ImageWithFallback.asset(
                          it['image']!,
                          height: galleryHeight,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(it['title']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _moreGalleryGrid() {
    final imgs = [
      AssetsConstants.image4,
      AssetsConstants.image5,
      AssetsConstants.image6,
      AssetsConstants.image7,
      AssetsConstants.image8,
      AssetsConstants.image9,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gallery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primary)),
        const SizedBox(height: 8),
        LayoutBuilder(builder: (context, constraints) {
          final crossAxis = constraints.maxWidth > 800 ? 3 : 2;
          return GridView.count(
            crossAxisCount: crossAxis,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(imgs.length, (index) {
              final path = imgs[index];
              final tag = 'community-img-$index';
              return GestureDetector(
                onTap: () => _openImagePreview(context, path, tag),
                child: Hero(
                  tag: tag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageWithFallback.asset(
                      path,
                      fit: BoxFit.cover,
                      height: 120,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            }),
          );
        }),
        const SizedBox(height: 12),
      ],
    );
  }

  void _openImagePreview(BuildContext context, String assetPath, String tag) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(8),
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Hero(
              tag: tag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: ImageWithFallback.asset(
                    assetPath,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
