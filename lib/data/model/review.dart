class Review {
  String id;
  String content;
  double mapX;
  double mapY;
  DateTime createdAt;

  Review({
    required this.id,
    required this.content,
    required this.mapX,
    required this.mapY,
    required this.createdAt,
  });

  Review.fromJson(Map<String, dynamic> map)
    : id = map['id'] ?? '',
      content = map['content'] ?? '',
      mapX = (map['mapX'] as num).toDouble(),
      mapY = (map['mapY'] as num).toDouble(),
      createdAt = map['createdAt'] is DateTime
          ? map['createdAt']
          : DateTime.tryParse(map['createdAt'].toString()) ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "content": content,
      "mapX": mapX,
      "mapY": mapY,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
