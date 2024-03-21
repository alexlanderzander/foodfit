import 'package:cloud_firestore/cloud_firestore.dart';

import 'food_nutrition.dart';

class Food{
  final List<FoodNutrition> nutritions;
  final DateTime createdAt;
  final String photoUrl;
  final String id;

  const Food({
    required this.nutritions,
    required this.createdAt,
    required this.photoUrl,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'nutritions': this.nutritions.map((e) => e.toMap()).toList(),
      'createdAt': this.createdAt,
      'photoUrl': this.photoUrl,
      'id': this.id,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      nutritions: (map['nutritions'] as List).map((e) => FoodNutrition.fromMap(e)).toList(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      photoUrl: map['photoUrl'] as String,
      id: map['id'] as String,
    );
  }
}