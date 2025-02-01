import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/constants/colors.dart';
import 'package:off_beat_restaurant/widgets/item_widget.dart'; // Ensure this import is correct

class CustomTabBarWithScroll extends StatefulWidget {
  const CustomTabBarWithScroll({super.key});

  @override
  State<CustomTabBarWithScroll> createState() => _CustomTabBarWithScrollState();
}

class _CustomTabBarWithScrollState extends State<CustomTabBarWithScroll> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _sections = [
    'Pizza',
    'Rice',
    'Burger',
    'Platter',
    'Pasta'
  ];
  final List<Image> _sectionsIcon = [
    Image.asset(
      'assets/icons/pizza_icon.png',
      scale: 2.5,
    ),
    Image.asset(
      'assets/icons/rice.png',
      scale: 2.5,
    ),
    Image.asset(
      'assets/icons/pizza_icon.png',
      scale: 2.5,
    ),
    Image.asset(
      'assets/icons/pizza_icon.png',
      scale: 2.5,
    ),
    Image.asset(
      'assets/icons/pizza_icon.png',
      scale: 2.5,
    ),
  ];
  int _activeIndex = 0; // Tracks the active section

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final double offset = _scrollController.offset;
    final double sectionHeight =
        MediaQuery.of(context).size.height * 0.4; // Height of each section

    // Determine which section is currently visible
    int newIndex = (offset / sectionHeight).floor();
    if (newIndex < 0) newIndex = 0;
    if (newIndex >= _sections.length) newIndex = _sections.length - 1;

    if (_activeIndex != newIndex) {
      setState(() {
        _activeIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: mqh * 0.05,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _sections.map((section) {
              int index = _sections.indexOf(section);
              return GestureDetector(
                onTap: () {
                  // Scroll to the selected section
                  final double sectionOffset = index * 120.0;
                  _scrollController.animateTo(
                    sectionOffset,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: _activeIndex == index
                        ? purpleColoredTexts
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _activeIndex == index
                          ? purpleColoredTexts
                          : Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          section,
                          style: TextStyle(
                            color: _activeIndex == index
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: mqh * 0.02,
                          ),
                        ),
                        SizedBox(width: 5),
                        _activeIndex == index
                            ? Image.asset(
                                'assets/icons/fire.png',
                                scale: 3,
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        // Scrollable List of Food Items
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _sections.length,
            itemBuilder: (context, index) {
              final section = _sections[index];
              final sectionIcon = _sectionsIcon[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        section,
                        style: TextStyle(
                          fontSize: mqh * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      sectionIcon,
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Two items per section
                  itemWidget(context, mqh, mqw, section),
                  SizedBox(height: 15),
                  itemWidget(context, mqh, mqw, section),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 100), // Add some bottom padding
      ],
    );
  }
}
