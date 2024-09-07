import 'package:flutter/material.dart';
import 'package:althhimer_app/features/home/widgets/post.dart';
import 'package:althhimer_app/features/home/widgets/custom_home_app_bar.dart';
import 'package:althhimer_app/features/home/widgets/post_card.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  final List<Post> posts = [
    Post('maddie', 'Cairo, Egypt', 'assets/persons/maddie.jpg',
        'Hello from maddie!', 'just now'),
    Post(
      'anne',
      'Mumbai, India',
      'assets/persons/anne.jpg',
      'how a Beautiful day !',
      '3 days ago',
    ),
    Post(
      'jessy',
      'Los Angeles, USA',
      'assets/persons/jessy.jpg',
      'Beautiful day at the beach!',
      '1 day ago',
    ),
    Post(
      'sara',
      'Mumbai, India',
      'assets/persons/sara.jpg',
      'Had an amazing day!',
      '4 days ago',
    ),
    Post(
      'ross',
      'Cairo, Egypt',
      'assets/persons/ross.jpg',
      'Good vibes only!',
      '2 days ago',
    ),
    Post(
      'Rory',
      'Mumbai, India',
      'assets/persons/rory.jpg',
      'Just finished a great shoot!',
      '5 days ago',
    ),
    Post(
      'luna',
      'Bangalore, India',
      'assets/persons/luna.jpg',
      'Feeling grateful!',
      '2 days ago',
    ),
    Post(
      'andy',
      'Los Angeles, USA',
      'assets/persons/andy.jpg',
      'Happy Family',
      '6 hours ago',
    ),
    Post(
      'Harry',
      'Hollywood, USA',
      'assets/persons/Harry.jpg',
      'Good morning',
      '3 days ago',
    ),
    Post(
      'Henry',
      'Miami, USA',
      'assets/persons/henry.jpg',
      'Love this place!',
      '2 days ago',
    ),
    Post(
      'Ellen',
      'Los Angeles, USA',
      'assets/persons/Ellen.jpg',
      'Great day ',
      '4 days ago',
    ),
    Post(
      'Adel',
      'Sydney, Australia',
      'assets/persons/adel.jpg',
      'Enjoying the weather!',
      '1 day ago',
    ),
    Post(
      'Courtney Cox',
      'Los Angeles, USA',
      'assets/persons/Courtney Cox_4.jpg',
      'Friends forever!',
      '5 days ago',
    ),
    Post(
      'Dwayne Johnson',
      'Los Angeles, USA',
      'assets/persons/Dwayne Johnson_21.jpg',
      'Working hard, as always!',
      '2 days ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomHomeAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return PostCard(post: posts[index]);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}
