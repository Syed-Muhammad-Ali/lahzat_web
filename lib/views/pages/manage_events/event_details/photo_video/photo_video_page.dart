// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

class PhotoVideoPage extends StatefulWidget {
  const PhotoVideoPage({super.key});

  @override
  State<PhotoVideoPage> createState() => _PhotoVideoPageState();
}

class _PhotoVideoPageState extends State<PhotoVideoPage> {
  String selectedMedia = "All";
  final List<String> media = ["All", "Photos", "Videos"];

  bool selectionMode = false;
  final Set<int> selectedItems = {};

  // Dummy media data
  final List<Map<String, dynamic>> mediaList = [
    {"type": "photo", "url": "assets/images/img1.jpg"},
    {"type": "photo", "url": "assets/images/img2.jpg"},
    {"type": "photo", "url": "assets/images/img3.jpg"},
    {
      "type": "video",
      "url": "assets/images/video_thumb1.jpg",
      "duration": "1:42 sec",
    },
    {"type": "photo", "url": "assets/images/img4.jpg"},
    {"type": "photo", "url": "assets/images/img5.jpg"},
    {"type": "photo", "url": "assets/images/img6.jpg"},
    {"type": "photo", "url": "assets/images/img7.jpg"},
    {"type": "photo", "url": "assets/images/img8.jpg"},
    {"type": "photo", "url": "assets/images/img9.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredMedia = selectedMedia == "All"
        ? mediaList
        : mediaList
              .where((m) => m["type"] == selectedMedia.toLowerCase())
              .toList();

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.hSpace(context),
            Row(
              children: [
                AppText(
                  "Uploaded media",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0D141C),
                ),
                0.5.wSpace(context),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: AppText(
                    "1,234 photos",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4F7396),
                  ),
                ),
              ],
            ),
            2.hSpace(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Filter buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: media.map((med) {
                    final bool isSelected = med == selectedMedia;

                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMedia = med;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColor.primaryColor
                                : const Color(0xffE8EDF2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: AppText(
                            med,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xff0D141C),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                // Action buttons
                Row(
                  children: [
                    AppButton(
                      width: context.w * 0.07,
                      height: 40,
                      radius: 12,
                      ontap: () {
                        setState(() {
                          selectionMode = !selectionMode;
                          if (!selectionMode) selectedItems.clear();
                        });
                      },
                      label: selectionMode ? 'Cancel' : 'Select',
                      txtClr: AppColor.whiteColor,
                      txtSize: 16,
                      bgColor: const Color(0xff959595),
                    ),
                    1.wSpace(context),
                    if (selectionMode && selectedItems.isNotEmpty)
                      AppButton(
                        width: context.w * 0.13,
                        height: 40,
                        radius: 12,
                        ontap: () {
                          setState(() {
                            for (var index
                                in selectedItems.toList()
                                  ..sort((a, b) => b.compareTo(a))) {
                              mediaList.removeAt(index);
                            }
                            selectedItems.clear();
                            selectionMode = false;
                          });
                        },
                        label: 'Delete Selected',
                        txtClr: AppColor.whiteColor,
                        txtSize: 16,
                        bgColor: AppColor.redColor,
                      ),
                    1.wSpace(context),
                    AppButton(
                      width: context.w * 0.14,
                      height: 40,
                      radius: 12,
                      ontap: () {},
                      rowElements: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            "Download All",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.whiteColor,
                          ),
                          0.5.wSpace(context),
                          SvgPicture.asset(
                            "assets/icons/download.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                      bgColor: AppColor.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
            3.hSpace(context),

            // Media Grid
            MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredMedia.length,
              itemBuilder: (context, index) {
                final mediaItem = filteredMedia[index];
                final bool isVideo = mediaItem["type"] == "video";
                final bool isSelected = selectedItems.contains(index);

                return GestureDetector(
                  onLongPress: () {
                    setState(() {
                      selectionMode = true;
                      selectedItems.add(index);
                    });
                  },
                  onTap: () {
                    if (selectionMode) {
                      setState(() {
                        if (isSelected) {
                          selectedItems.remove(index);
                        } else {
                          selectedItems.add(index);
                        }
                      });
                    } else {}
                  },
                  child: Stack(
                    children: [
                      // Thumbnail
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(mediaItem["url"], fit: BoxFit.cover),
                      ),

                      // Semi-transparent overlay when selected
                      if (isSelected)
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffE9E9E9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.44),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            isVideo
                                ? Icons.play_circle_outline
                                : Icons.image_outlined,
                            color: AppColor.whiteColor,
                            size: 16,
                          ),
                        ),
                      ),

                      // Video duration
                      if (isVideo)
                        Positioned(
                          bottom: 6,
                          right: 6,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.44),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: AppText(
                              mediaItem["duration"],
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),

                      // Checkmark for selection
                      if (selectionMode)
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColor.primaryColor
                                    : AppColor.whiteColor,
                                width: 1,
                              ),
                              color: isSelected
                                  ? AppColor.primaryColor
                                  : Colors.transparent,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              isSelected ? Icons.check : null,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
