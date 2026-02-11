import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/story_avatar.dart';
import '../widgets/feeds_box.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Stories section
          SliverToBoxAdapter(
            child: Container(
              height: 105,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[900]!, width: 0.5),
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storyUsers.length,
                itemBuilder: (context, index) {
                  return StoryAvatar(
                    user: storyUsers[index],
                    isFirstStory: index == 0,
                  );
                },
              ),
            ),
          ),
          // Feeds section
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return FeedsBox(post: posts[index]);
            }, childCount: posts.length),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
