class BeritaModels {
  final String title;
  final String link;
  final String image;
  final String description;
  final String isoDate;

  BeritaModels({
    required this.title,
    required this.link,
    required this.image,
    required this.description,
    required this.isoDate,
  });

  factory BeritaModels.fromJson(Map<String, dynamic> json) {
    return BeritaModels(
      title: json['title'],
      link: json['link'],
      image: json['image'],
      description: json['description'],
      isoDate: json['isoDate'],
    );
  }
}
