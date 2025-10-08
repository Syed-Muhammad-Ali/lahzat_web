
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/variables.dart';

class PhotoSelector extends StatefulWidget {
  const PhotoSelector({super.key});

  @override
  _PhotoSelectorState createState() => _PhotoSelectorState();
}

class _PhotoSelectorState extends State<PhotoSelector> {
  int selectedIndex = 0;

  final List<String> photos = [Appimage.s1, Appimage.s2];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: List.generate(photos.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                Variables.flavour = index == 0 ? 'one' : 'two';
              });
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColor.primaryColor
                      : Colors.transparent,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  photos[index],
                  width: MediaQuery.of(context).size.width < 600 ? 130 : 160,
                  height: MediaQuery.of(context).size.width < 600 ? 240 : 280,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
