// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fic_bootcamp/data/models/furniture_item_model.dart';
import 'package:flutter/material.dart';

import '../widgets/furniture_item.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> categoryList = [
    {
      'text': 'All',
      'textColor': Colors.white,
      'bgColor': const Color(0xff4A4543),
    },
    {
      'text': 'Living Room',
      'textColor': const Color(0xff4A4543),
      'bgColor': Colors.transparent,
    },
    {
      'text': 'Bedroom',
      'textColor': const Color(0xff4A4543),
      'bgColor': Colors.transparent,
    },
    {
      'text': 'Dining Room',
      'textColor': const Color(0xff4A4543),
      'bgColor': Colors.transparent,
    },
    {
      'text': 'Kitchen',
      'textColor': const Color(0xff4A4543),
      'bgColor': Colors.transparent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color(0xff4A4543),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/ic_menu.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/ic_search.png'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
            child: Text(
              'Discover the most\nmodern furniture',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xff4A4543),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categoryList.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 14 : 0),
                child: CategoryItem(
                  text: categoryList[index]['text'],
                  textColor: categoryList[index]['textColor'],
                  bgColor: categoryList[index]['bgColor'],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'Recommended Furnitures',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff4A4543),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2 / 2.5,
              ),
              itemCount: furnitureItemList.length,
              itemBuilder: (context, index) {
                var data = furnitureItemList
                    .map(
                      (item) => FurnitureItemModel.fromMap(item),
                    )
                    .toList();
                return FurnitureItem(
                  furnitureItem: data[index],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Text('tes'),
            activeIcon: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(14.0),
                ),
                color: Color(0xff9A9390),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/icons/ic_home.png",
                fit: BoxFit.fill,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/ic_shop.png",
              fit: BoxFit.fill,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/ic_star.png",
              fit: BoxFit.fill,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/ic_account.png",
              fit: BoxFit.fill,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  const CategoryItem({
    Key? key,
    required this.text,
    required this.textColor,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
