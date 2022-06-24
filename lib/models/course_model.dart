class CourseModel {
  final String title;
  final String author;
  final Rating rating;
  final Price fees;
  late bool isBestSeller;
  late String imgSource;

  CourseModel({
    required this.title,
    required this.author,
    required this.rating,
    required this.fees,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      title: json['title'],
      author: json['author'],
      rating: Rating.fromJson(json['rating']),
      fees: Price.fromJson(json['fees']),
    );
  }
}

class Price {
  final String currency;
  final String currencySymbol;
  final String value;

  Price(
      {required this.currency,
      required this.currencySymbol,
      required this.value});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      currencySymbol: json['currency_symbol'],
      value: json['value'],
      currency: json['currency'],
    );
  }
}

class Rating {
  final String avgRating;
  final String totalGivenBy;

  Rating({required this.avgRating, required this.totalGivenBy});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      avgRating: json['avg_rating'],
      totalGivenBy: json['total_given_by']
    );
  }
}
