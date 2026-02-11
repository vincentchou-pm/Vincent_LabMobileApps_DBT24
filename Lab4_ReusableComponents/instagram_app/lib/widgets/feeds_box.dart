import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class FeedsBox extends StatelessWidget {
  final Post post;

  const FeedsBox({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFBAA47),
                      Color(0xFFD91A46),
                      Color(0xFFA60F93),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[900],
                    ),
                    child: Center(
                      child: Text(
                        post.user.profileImage,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  post.user.username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ),
        // Post image
        Container(
          width: double.infinity,
          height: 400,
          color: Colors.grey[900],
          child: post.postImage.startsWith('assets/')
              ? Image.asset(
                  post.postImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text('X', style: const TextStyle(fontSize: 150)),
                    );
                  },
                )
              : Center(
                  child: Text(
                    post.postImage,
                    style: const TextStyle(fontSize: 150),
                  ),
                ),
        ),
        // Action buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            children: [
              const Icon(Icons.favorite_border, color: Colors.white, size: 28),
              const SizedBox(width: 16),
              const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 26,
              ),
              const SizedBox(width: 16),
              const Icon(Icons.send, color: Colors.white, size: 26),
              const Spacer(),
              const Icon(Icons.bookmark_border, color: Colors.white, size: 28),
            ],
          ),
        ),
        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            '${post.likes} likes',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${post.user.username} ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: post.caption,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        // Time ago
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text(
            post.timeAgo,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
