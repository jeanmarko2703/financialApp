class AmountModel {
  final double currentAmount;
  final double goalAmount;
  final String goalName;
  final String goalImage;

  AmountModel({
    required this.currentAmount,
    required this.goalAmount,
    required this.goalName,
    required this.goalImage,
  });

  // Método para crear una instancia vacía
  factory AmountModel.empty() {
    return AmountModel(
      currentAmount: 0.0,
      goalAmount: 0.0,
      goalName: '',
      goalImage: '',
    );
  }

  // Método copyWith para crear una copia con algunos cambios
  AmountModel copyWith({
    double? currentAmount,
    double? goalAmount,
    String? goalName,
    String? goalImage,
  }) {
    return AmountModel(
      currentAmount: currentAmount ?? this.currentAmount,
      goalAmount: goalAmount ?? this.goalAmount,
      goalName: goalName ?? this.goalName,
      goalImage: goalImage ?? this.goalImage,
    );
  }

  // Convertir un JSON a una instancia de AmountModel
  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      currentAmount: json['currentAmount'] as double,
      goalAmount: json['goalAmount'] as double,
      goalName: json['goalName'] as String,
      goalImage: json['goalImage'] as String,
    );
  }

  // Convertir una instancia de AmountModel a JSON
  Map<String, dynamic> toJson() {
    return {
      'currentAmount': currentAmount,
      'goalAmount': goalAmount,
      'goalName': goalName,
      'goalImage': goalImage,
    };
  }
}
