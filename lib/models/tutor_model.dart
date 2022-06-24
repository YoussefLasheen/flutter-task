class TutorModel {
  final String name;
  final String image;

  TutorModel({
    required this.name,
    required this.image,
  });

  factory TutorModel.fromJson(Map<String, dynamic> json) {
    return TutorModel(
      name: json['name'],
      image: json['image'],
    );
  }
}
