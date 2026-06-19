import 'package:meta/meta.dart';

@immutable
class SetupState {
  final String? gender;
  final int? age;
  final double? weight;
  final double? height;

  const SetupState({this.gender, this.age, this.weight, this.height});

  SetupState copyWith({
    String? gender,
    int? age,
    double? weight,
    double? height,
  }) {
    return SetupState(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }
}
