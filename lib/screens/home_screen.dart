import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/constants/colors.dart';
import 'package:off_beat_restaurant/constants/text_styles.dart';
import 'package:off_beat_restaurant/screens/items_screen.dart';
import 'package:off_beat_restaurant/services/fetch_res_info.dart';
import 'package:off_beat_restaurant/widgets/discount_widget.dart';
import 'package:off_beat_restaurant/widgets/top_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? _restaurantInfo;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    try {
      final data = await fetchRestaurantInfo();
      setState(() {
        _restaurantInfo = data['data'];
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _errorMessage = "Failed to load data: $error";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;

    if (_isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        body: Center(child: Text(_errorMessage!)),
      );
    }

    if (_restaurantInfo == null) {
      return Scaffold(
        body: Center(child: Text("No data found")),
      );
    }

    final restaurant = _restaurantInfo!;

    return Scaffold(
      body: SizedBox(
        height: mqh,
        width: mqw,
        child: Stack(
          children: [
            topWidget(mqh, mqw),
            Positioned(
              top: mqh * 0.26,
              child: Container(
                padding: EdgeInsets.all(15),
                height: mqh,
                width: mqw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              restaurant['Name'] ?? 'Off-Beat Restaurant',
                              style: TextStyles.offBeatTitle(context),
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              'assets/icons/bi_info.png',
                              scale: 3.2,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/star.png',
                                  scale: 3.2,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  restaurant['AverageRating'] ?? '4.8',
                                  style: TextStyle(
                                    fontSize: mqw * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${restaurant['TotalRating'] ?? '4.8'} ratings",
                              style: TextStyle(
                                fontSize: mqw * 0.027,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/clock.png',
                              scale: 3.2,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Delivery",
                              style: TextStyles.otherTitle(context)
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(width: 5),
                            Text(
                              restaurant['AverageDeliveryTime'] ?? 'N/A',
                              style: TextStyles.otherTitle(context)
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              'assets/icons/dot.png',
                              scale: 3.2,
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              'assets/icons/navigation.png',
                              scale: 3.2,
                            ),
                            SizedBox(width: 5),
                            Text(
                              restaurant['Distance'] ?? '0 km',
                              style: TextStyles.otherTitle(context)
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "away",
                              style: TextStyles.otherTitle(context)
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Text(
                          "Review",
                          style: TextStyles.otherTitle(context).copyWith(
                            color: purpleColoredTexts,
                            fontSize: mqw * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/delivery rider.png',
                              scale: 3.2,
                            ),
                            SizedBox(width: 5),
                            Text(
                              restaurant['DeliveryMode'] ?? 'Free delivery',
                              style: TextStyles.otherTitle(context).copyWith(
                                fontWeight: FontWeight.bold,
                                color: purpleColoredTexts,
                              ),
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              'assets/icons/dot.png',
                              scale: 3.2,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Min order",
                              style: TextStyles.otherTitle(context)
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${restaurant['MinOrderAmount'] ?? 0} ${restaurant['Currency'] ?? 'AED'}",
                              style: TextStyles.otherTitle(context)
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 235, 233, 233),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/bi_info.png',
                                scale: 4,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "More info",
                                style: TextStyles.otherTitle(context).copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: mqw * 0.025,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: mqh * 0.13,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          discountWidget(
                              context, purpleColoredTexts, "10", "100"),
                          SizedBox(width: 15),
                          discountWidget(
                              context, Colors.deepOrangeAccent, "20", "300"),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: CustomTabBarWithScroll(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
