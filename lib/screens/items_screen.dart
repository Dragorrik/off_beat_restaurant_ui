import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/constants/colors.dart';
import 'package:off_beat_restaurant/screens/item_details_screen.dart';
import 'package:off_beat_restaurant/widgets/bottom_sheet_widget.dart';
import 'package:off_beat_restaurant/widgets/item_widget.dart'; // Ensure this import is correct

class CustomTabBarWithScroll extends StatefulWidget {
  const CustomTabBarWithScroll({super.key});

  @override
  State<CustomTabBarWithScroll> createState() => _CustomTabBarWithScrollState();
}

class _CustomTabBarWithScrollState extends State<CustomTabBarWithScroll> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _menuData = [
    {
      "category": "Pizza",
      "items": [
        {
          "name": "Margherita Pizza",
          "action": "navigate", // Navigates to item details page
        },
        {
          "name": "Pepperoni Pizza",
          "action": "modal", // Shows a modal bottom sheet
        },
      ],
    },
    {
      "category": "Rice",
      "items": [
        {
          "name": "Fried Rice",
          "action": "navigate",
        },
        {
          "name": "Biryani",
          "action": "modal",
        },
      ],
    },
    {
      "category": "Burger",
      "items": [
        {
          "name": "Cheeseburger",
          "action": "navigate",
        },
        {
          "name": "Veggie Burger",
          "action": "modal",
        },
      ],
    },
    {
      "category": "Platter",
      "items": [
        {
          "name": "Chicken Platter",
          "action": "navigate",
        },
        {
          "name": "Veg Platter",
          "action": "modal",
        },
      ],
    },
    {
      "category": "Pasta",
      "items": [
        {
          "name": "Spaghetti",
          "action": "navigate",
        },
        {
          "name": "Mac and Cheese",
          "action": "modal",
        },
      ],
    },
  ];

  final List<String> _sections = [
    'Pizza',
    'Rice',
    'Burger',
    'Platter',
    'Pasta'
  ];
  final List<Image> _sectionsIcon = [
    Image.asset('assets/icons/pizza_icon.png', scale: 2.5),
    Image.asset('assets/icons/rice.png', scale: 2.5),
    Image.asset('assets/icons/burger.png', scale: 28),
    Image.asset('assets/icons/meal.png', scale: 28),
    Image.asset('assets/icons/pasta.png', scale: 28),
  ];

  int _activeIndex = 0;

  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final double offset = _scrollController.offset;
    final double sectionHeight = MediaQuery.of(context).size.height * 0.4;

    int newIndex = (offset / sectionHeight).floor();
    if (newIndex < 0) newIndex = 0;
    if (newIndex >= _sections.length) newIndex = _sections.length - 1;

    if (_activeIndex != newIndex) {
      setState(() {
        _activeIndex = newIndex;
      });
    }
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      final position =
          context.findRenderObject()!.getTransformTo(null).getTranslation();
      _scrollController.animateTo(
        position.y,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
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
                  _scrollToSection(index); // Scroll to the selected section
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
          height: 25,
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: _menuData.length,
            itemBuilder: (context, index) {
              final section = _menuData[index];
              final sectionIcon = _sectionsIcon[index];
              return Column(
                key: _sectionKeys[index], // Assign the key to the section
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        section["category"],
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
                  GestureDetector(
                    onTap: () {
                      final item = section["items"][0];
                      if (item["action"] == "navigate") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ItemDetailsScreen(
                              itemName: item["name"],
                            ),
                          ),
                        );
                      }
                    },
                    child: itemWidget(
                      context,
                      mqh,
                      mqw,
                      section["items"][0]["name"],
                      section["category"],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      final item = section["items"][1];
                      if (item["action"] == "modal") {
                        showItemDetailsModal(context, mqw, mqh, item["name"]);
                      }
                    },
                    child: itemWidget(
                      context,
                      mqh,
                      mqw,
                      section["items"][1]["name"],
                      section["category"],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
