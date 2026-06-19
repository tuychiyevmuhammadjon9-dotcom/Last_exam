class Infomodel {
  final int age;
  final double weight;
  final double height;
  final String goal;

  Infomodel({
    required this.age,
    required this.weight,
    required this.height,
    required this.goal,
  });
  Infomodel copyWith({
    int? age,
    double? weight,
    double? height,
    String? goal,
  }) {
    return Infomodel(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      goal: goal ?? this.goal,
    );
  }

  factory Infomodel.fromJson(Map<String, dynamic> json) {
    return Infomodel(
      age: json['age'],
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      goal: json['goal'],
    );
  }
}
