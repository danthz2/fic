import 'package:fic_bootcamp/data/models/furniture_item_model.dart';
import 'package:fic_bootcamp/ui/screen/detail_furniture.dart';
import 'package:flutter/material.dart';

class FurnitureItem extends StatelessWidget {
  final FurnitureItemModel furnitureItem;
  final int selectedIndex;
  const FurnitureItem({Key? key, required this.furnitureItem, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailFurniture.routeName, arguments: [furnitureItem, selectedIndex]),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Flexible(
                flex: 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      furnitureItem.image,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.favorite_outline,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(furnitureItem.text),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${furnitureItem.price}'),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                            ),
                            Text('${furnitureItem.rating}'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
