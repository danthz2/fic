// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FurnitureItemModel {
  String text;
  int price;
  String image;
  double rating;
  List<int> availableColor;
  FurnitureItemModel({
    required this.text,
    required this.price,
    required this.image,
    required this.rating,
    required this.availableColor,
  });

  FurnitureItemModel copyWith({
    String? text,
    int? price,
    String? image,
    double? rating,
    List<int>? availableColor,
  }) {
    return FurnitureItemModel(
      text: text ?? this.text,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      availableColor: availableColor ?? this.availableColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'price': price,
      'image': image,
      'rating': rating,
      'availableColor': availableColor,
    };
  }

  factory FurnitureItemModel.fromMap(Map<String, dynamic> map) {
    return FurnitureItemModel(
      text: map['text'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
      rating: map['rating'] as double,
      availableColor: List.from(
        (map['availableColor'] as List),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FurnitureItemModel.fromJson(String source) =>
      FurnitureItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FurnitureItemModel(text: $text, price: $price, image: $image, rating: $rating, availableColor: $availableColor)';
  }

  @override
  bool operator ==(covariant FurnitureItemModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.price == price &&
        other.image == image &&
        other.rating == rating &&
        listEquals(other.availableColor, availableColor);
  }

  @override
  int get hashCode {
    return text.hashCode ^ price.hashCode ^ image.hashCode ^ rating.hashCode ^ availableColor.hashCode;
  }
}

final List<Map<String, dynamic>> furnitureItemList = [
  {
    'text': 'Stylish Chair',
    'price': 170,
    'image': 'assets/images/fur_1.png',
    'rating': 2.5,
    'availableColor': [
      0xff9A9390,
      0xffEEA427,
      0xffE3E3E3,
      0xff80450A,
    ]
  },
  {
    'text': 'Modern Table',
    'price': 75,
    'image': 'assets/images/fur_2.png',
    'rating': 4.9,
    'availableColor': [
      0xff9A9390,
      0xffEEA427,
      0xffE3E3E3,
      0xff80450A,
    ]
  },
  {
    'text': 'Wooden Console',
    'price': 240,
    'image': 'assets/images/fur_3.png',
    'rating': 4.7,
    'availableColor': [
      0xff9A9390,
      0xffEEA427,
      0xffE3E3E3,
      0xff80450A,
    ]
  },
  {
    'text': 'Brown Armchair',
    'price': 210,
    'image': 'assets/images/fur_4.png',
    'rating': 4.9,
    'availableColor': [
      0xff9A9390,
      0xffEEA427,
      0xffE3E3E3,
      0xff80450A,
    ]
  },
];
