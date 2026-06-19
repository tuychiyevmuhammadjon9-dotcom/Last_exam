class   Homemodel {
  final String id;
  final String title;
  final String image;
  final int duration;
  final double kcal;

  Homemodel({
    required this.id,
    required this.title,
    required this.image,
    required this.duration,
    required this.kcal, 
  });

  factory Homemodel.fromJson(Map<String, dynamic> json, String id) {
    return Homemodel(
      id: id,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      duration: json['duration'] ?? 0,
      kcal: json['kcal'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'image': image, 'duration': duration, 'kcal': kcal};
  }

  Homemodel copyWith({
    String? id,
    String? title,
    String? image,
    int? duration,
    double? kcal,
  }) {
    return Homemodel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      duration: duration ?? this.duration,
      kcal: kcal ?? this.kcal,
    );
  }
}
