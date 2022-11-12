import 'package:fic_bootcamp/data/models/furniture_item_model.dart';
import 'package:flutter/material.dart';
class DetailFurniture extends StatelessWidget {
  static const routeName = '/detail_furniture';
  const DetailFurniture({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final furnitureItem = ModalRoute.of(context)?.settings.arguments as FurnitureItemModel;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            furnitureItem.image,
            height: MediaQuery.of(context).size.height / 1.5,
            fit: BoxFit.fill,
          ),
          ListView(
            children: [
              const SizedBox(
                height: 400,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
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
                      decoration: BoxDecoration(
                        color: Color(0xffD8D8D8),
                        borderRadius: const BorderRadius.all(
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
                              style: TextStyle(
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
                                  color: furnitureItem.rating.round() < e ? Color(0xffDDDDDD) : Color(0xffEEA427),
                                  size: 18,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Text(
                          "\$${furnitureItem.price}",
                          style: TextStyle(
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
                          children: [1, 2, 3, 4]
                              .map((e) => const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.grey,
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 13,
                                          backgroundColor: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}