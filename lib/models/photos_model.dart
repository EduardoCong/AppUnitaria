class Photo {
  final String id;
  final String url;
  final String description;

  Photo({required this.id, required this.url, required this.description});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      url: json['urls']['small'],
      description: json['description'] ?? 'Sin descripción',
    );
  }
}
