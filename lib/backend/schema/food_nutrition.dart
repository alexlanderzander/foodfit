class FoodNutrition{
  final String name;
  final double amount;
  final String quantityPrefix;

  const FoodNutrition({
    required this.name,
    required this.amount,
    this.quantityPrefix = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'amount': this.amount,
      'quantityPrefix': this.quantityPrefix,
    };
  }

  factory FoodNutrition.fromMap(Map<String, dynamic> map) {
    return FoodNutrition(
      name: map['name'] as String,
      amount: map['amount'] as double,
      quantityPrefix: map['quantityPrefix'] as String,
    );
  }
}