import '../../domain/entities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    super.id,
    super.posterId,
    super.title,
    super.content,
    super.imageUrl,
    super.topics,
    super.updatedAt,
    super.posterName,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] as String?,
      posterId: json['poster_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      imageUrl: json['image_url'] as String?,
      topics: List<String>.from(json['topics'] ?? []),
      updatedAt: json['updated_at'] == null ? DateTime.now() : DateTime.parse(json['updated_at']),
    );
  }

  Map<String?, dynamic> toJson() {
    return {
      'id': id,
      'poster_id': posterId,
      'title': title,
      'content': content,
      'image_url': imageUrl,
      'topics': topics,
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  BlogModel copyWith({
    String? id,
    String? posterId,
    String? title,
    String? content,
    String? imageUrl,
    List<String>? topics,
    DateTime? updatedAt,
    String? posterName,
  }) {
    return BlogModel(
      id: id ?? this.id,
      posterId: posterId ?? this.posterId,
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      topics: topics ?? this.topics,
      updatedAt: updatedAt ?? this.updatedAt,
      posterName: posterName ?? this.posterName,
    );
  }
}
