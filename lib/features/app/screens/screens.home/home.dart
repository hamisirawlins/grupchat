import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grupchat/common/widgets/images/cards_slider.dart';
import 'package:grupchat/common/widgets/images/horizontal_image_card.dart';
import 'package:grupchat/features/app/screens/screens.pools/pool_details.dart';
import 'package:grupchat/features/app/screens/widgets/home/home_header.dart';
import 'package:grupchat/common/widgets/images/pool_card.dart';
import 'package:grupchat/features/app/screens/widgets/common/section_header_title.dart';
import 'package:grupchat/utils/constants/sys_util.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(searchController: _searchController),
            SizedBox(
              height: SizeConfig.screenHeight * 0.016,
            ),
            const SectionHeader(text: "Active Pools"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.016,
            ),
            CardsSlider(items: [
              PoolCard(
                onPressed: () => Get.to(() => const PoolDetails(
                      image:
                          'https://images.pexels.com/photos/3607399/pexels-photo-3607399.jpeg?auto=compress&cs=tinysrgb&w=800',
                      isNetworkImage: true,
                      name: 'Baby Shower',
                    )),
                isNetworkImage: true,
                imageUrl:
                    'https://images.pexels.com/photos/3607399/pexels-photo-3607399.jpeg?auto=compress&cs=tinysrgb&w=800',
                text: 'Baby Shower',
              ),
              PoolCard(
                onPressed: () => Get.to(() => const PoolDetails(
                      image:
                          'https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg?auto=compress&cs=tinysrgb&w=800',
                      isNetworkImage: true,
                      name: 'Mombasa Trip',
                    )),
                isNetworkImage: true,
                imageUrl:
                    'https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg?auto=compress&cs=tinysrgb&w=800',
                text: 'Mombasa Trip',
              ),
              PoolCard(
                onPressed: () => Get.to(() => const PoolDetails(
                      image:
                          'https://images.pexels.com/photos/1595108/pexels-photo-1595108.jpeg?auto=compress&cs=tinysrgb&w=800g',
                      isNetworkImage: true,
                      name: 'Sunday Visit',
                    )),
                isNetworkImage: true,
                imageUrl:
                    'https://images.pexels.com/photos/1595108/pexels-photo-1595108.jpeg?auto=compress&cs=tinysrgb&w=800g',
                text: 'Sunday Visit',
              ),
            ]),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            const SectionHeader(text: "Completed Pools"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            SizedBox(
                height: SizeConfig.screenHeight * 0.28,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => const PoolDetails(
                            image:
                                'https://images.pexels.com/photos/7932264/pexels-photo-7932264.jpeg?auto=compress&cs=tinysrgb&w=800',
                            isNetworkImage: true,
                            name: 'House Warming Kitty',
                          )),
                      child: HorizontalImageCard(
                          text: "House Warming Kitty",
                          isNetworkImage: true,
                          image:
                              "https://images.pexels.com/photos/7932264/pexels-photo-7932264.jpeg?auto=compress&cs=tinysrgb&w=800"),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => const PoolDetails(
                            image:
                                'https://images.pexels.com/photos/164938/pexels-photo-164938.jpeg?auto=compress&cs=tinysrgb&w=800',
                            isNetworkImage: true,
                            name: 'Music Equipment',
                          )),
                      child: HorizontalImageCard(
                          text: "Music Equipment",
                          isNetworkImage: true,
                          image:
                              "https://images.pexels.com/photos/164938/pexels-photo-164938.jpeg?auto=compress&cs=tinysrgb&w=800"),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
