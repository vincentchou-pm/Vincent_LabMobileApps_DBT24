class User {
  final String username;
  final String fullName;
  final String profileImage;
  final bool hasStory;

  User({
    required this.username,
    required this.fullName,
    required this.profileImage,
    this.hasStory = false,
  });
}

class Message {
  final String sender;
  final String message;
  final String time;
  final bool isSent;

  Message({
    required this.sender,
    required this.message,
    required this.time,
    required this.isSent,
  });
}

class Chat {
  final User user;
  final String lastMessage;
  final String time;
  final bool hasAttachment;

  Chat({
    required this.user,
    required this.lastMessage,
    required this.time,
    this.hasAttachment = false,
  });
}

class Post {
  final User user;
  final String postImage;
  final int likes;
  final String caption;
  final String timeAgo;

  Post({
    required this.user,
    required this.postImage,
    required this.likes,
    required this.caption,
    required this.timeAgo,
  });
}
