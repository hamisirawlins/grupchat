import 'package:flutter/material.dart';
import 'package:grupchat/common/widgets/images/cards_slider.dart';
import 'package:grupchat/features/home/screens/widgets/home_header.dart';
import 'package:grupchat/common/widgets/images/pool_card.dart';
import 'package:grupchat/features/home/screens/widgets/section_header_title.dart';
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
            const CardsSlider(items: [
              PoolCard(
                isNetworkImage: true,
                imageUrl:
                    'https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg?auto=compress&cs=tinysrgb&w=800',
                text: 'Mombasa Trip',
              ),
              PoolCard(
                isNetworkImage: false,
                imageUrl: 'assets/icons/banknote-envelope.png',
                text: 'Mombasa Trip',
              )
            ]),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            const SectionHeader(text: "Latest Transactions"),
          ],
        ),
      ),
    );
  }
}
