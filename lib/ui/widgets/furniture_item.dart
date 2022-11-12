import 'package:fic_bootcamp/data/models/furniture_item_model.dart';
import 'package:fic_bootcamp/ui/screen/detail_furniture.dart';
import 'package:flutter/material.dart';

class FurnitureItem extends StatefulWidget {
  final FurnitureItemModel furnitureItem;
  const FurnitureItem({
    Key? key,
    required this.furnitureItem,
  }) : super(key: key);

  @override
  State<FurnitureItem> createState() => _FurnitureItemState();
}

class _FurnitureItemState extends State<FurnitureItem> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailFurniture.routeName, arguments: widget.furnitureItem),
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
                      widget.furnitureItem.image,
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
                        child: GestureDetector(
                          onTap: () => setState(() {
                            _isFavorite = !_isFavorite;
                          }),
                          child: Icon(
                            _isFavorite ? Icons.favorite : Icons.favorite_outline,
                            size: 20,
                            color: Colors.red,
                          ),
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
                    Text(
                      widget.furnitureItem.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff4A4543),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.furnitureItem.price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Color(0xff9A9390),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xffEEA427),
                              size: 15,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '${widget.furnitureItem.rating}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xffBBBBBB),
                              ),
                            ),
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
