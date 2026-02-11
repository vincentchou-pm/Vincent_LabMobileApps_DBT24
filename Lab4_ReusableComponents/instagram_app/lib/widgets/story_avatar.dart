import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class StoryAvatar extends StatelessWidget {
  final User user;
  final bool isFirstStory;

  const StoryAvatar({super.key, required this.user, this.isFirstStory = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: user.hasStory
                      ? const LinearGradient(
                          colors: [
                            Color(0xFFFBAA47),
                            Color(0xFFD91A46),
                            Color(0xFFA60F93),
                          ],
                        )
                      : null,
                  border: !user.hasStory
                      ? Border.all(color: Colors.grey, width: 1)
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[900],
                    ),
                    child: Center(
                      child: Text(
                        user.profileImage,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ),
              if (isFirstStory)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Icon(Icons.add, size: 12, color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: 65,
            child: Text(
              user.username,
              style: const TextStyle(fontSize: 11, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
