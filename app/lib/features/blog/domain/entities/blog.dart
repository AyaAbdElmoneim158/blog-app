class Blog {
  final String? id;
  final String? posterId;
  final String? title;
  final String? content;
  final String? imageUrl;
  final List<String>? topics;
  final DateTime? updatedAt;
  final String? posterName;

  Blog({
    this.id,
    this.posterId,
    this.title,
    this.content,
    this.imageUrl,
    this.topics,
    this.updatedAt,
    this.posterName,
  });
}
