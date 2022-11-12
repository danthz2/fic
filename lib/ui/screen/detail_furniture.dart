// ignore_for_file: prefer_const_constructors

import 'package:fic_bootcamp/data/models/furniture_item_model.dart';
import 'package:flutter/material.dart';

class DetailFurniture extends StatefulWidget {
  static const routeName = '/detail_furniture';
  const DetailFurniture({Key? key}) : super(key: key);

  @override
  State<DetailFurniture> createState() => _DetailFurnitureState();
}

class _DetailFurnitureState extends State<DetailFurniture> {
  int _selectedIndex = -1;
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    final furnitureItem = ModalRoute.of(context)?.settings.arguments as FurnitureItemModel;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              furnitureItem.image,
              height: MediaQuery.of(context).size.height / 1.5,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0).copyWith(bottom: 20),
                    width: 40,
                    height: 3,
                    decoration: const BoxDecoration(
                      color: Color(0xffD8D8D8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            furnitureItem.text,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          Row(
                            children: [1, 2, 3, 4, 5].map((e) {
                              return Icon(
                                Icons.star,
                                color: furnitureItem.rating.round() < e
                                    ? const Color(0xffDDDDDD)
                                    : const Color(0xffEEA427),
                                size: 18,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Text(
                        "\$${furnitureItem.price * _count}",
                        style: const TextStyle(
                          fontSize: 26.0,
                          color: Color(0xff9A9390),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Choose a Color :',
                        style: TextStyle(
                          color: Color(0xff7A8D9C),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        children: List.generate(furnitureItem.availableColor.length, (index) {
                          var colorHex = furnitureItem.availableColor[index];
                          return furnitureAvailableColor(
                            colorHex: colorHex,
                            colorIndex: index,
                          );
                        }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 19.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Select Quality :',
                        style: TextStyle(
                          color: Color(0xff7A8D9C),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          border: Border.all(
                            color: const Color(0xffEAEBEC),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  if (_count > 1) {
                                    _count--;
                                  }
                                }),
                                child: const Icon(
                                  Icons.remove,
                                  color: Color(0xff9A9390),
                                ),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                color: const Color(0xffEAEBEC),
                                child: Text(
                                  _count.toString(),
                                )),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  _count++;
                                }),
                                child: const Icon(
                                  Icons.add,
                                  color: Color(0xff9A9390),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  const Text(
                    'Curabitur commodo turpis id placerat mattis. Mauris euismod arcu id orci fringilla sodales. Proin congue eleifend ipsum, eleifend porttitor mi ullamcorper.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffADADAD),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 48),
                      shape: const StadiumBorder(),
                      primary: Color(0xff9A9390),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget furnitureAvailableColor({
    required int colorHex,
    required int colorIndex,
  }) {
    return GestureDetector(
      onTap: () => setState(() {
        _selectedIndex = colorIndex;
      }),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: _selectedIndex == colorIndex ? Color(colorHex) : Colors.transparent,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(colorHex),
            ),
          ),
        ),
      ),
    );
  }
}
