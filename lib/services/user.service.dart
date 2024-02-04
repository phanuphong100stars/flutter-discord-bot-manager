import "package:discord_bot_manager/services/api.service.dart";

class PostApi extends Api<Post> {
  @override
  Post _fromJson(Map<String, dynamic> json) {
    return Post.fromJson(json);
  }
}

class Post {
  final String id;
  final String title;
  // Add other post properties as needed

  Post({required this.id, required this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      // Parse other post properties from the JSON as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      // Include other post properties in the JSON as needed
    };
  }
}
