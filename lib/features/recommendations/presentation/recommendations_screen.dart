import 'package:flutter/material.dart';

import '../../communities/presentation/community_details_screen.dart';
import '../../events/presentation/event_details_screen.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

  final List<Map<String, dynamic>> recommendedCommunities = const [
    {
      'name': 'Developers Community',
      'category': 'Technology',
      'members': '128',
      'icon': Icons.code,
      'reason': 'Matches your interest in Programming',
    },
    {
      'name': 'Photography Club',
      'category': 'Photography',
      'members': '86',
      'icon': Icons.camera_alt_outlined,
      'reason': 'Matches your interest in Photography',
    },
  ];

  final List<Map<String, dynamic>> recommendedEvents = const [
    {
      'title': 'AI & Machine Learning Workshop',
      'date': '26 SEP 2026',
      'time': '2:00 PM',
      'location': 'Computer Lab',
      'category': 'Workshop',
      'icon': Icons.smart_toy_outlined,
      'reason': 'Recommended based on Technology',
    },
    {
      'title': 'Tech Fest 2026',
      'date': '20 OCT 2026',
      'time': '10:00 AM',
      'location': 'Main Campus',
      'category': 'Academic',
      'icon': Icons.computer_outlined,
      'reason': 'Popular among technology students',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'Recommended for You',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIntroCard(),

            const SizedBox(height: 28),

            _buildSectionTitle(
              'Recommended Communities',
              'Based on your interests',
            ),

            const SizedBox(height: 12),

            ...recommendedCommunities.map(
              (community) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildCommunityCard(
                  context,
                  community,
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(
              'Recommended Events',
              'Events you may be interested in',
            ),

            const SizedBox(height: 12),

            ...recommendedEvents.map(
              (event) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildEventCard(
                  context,
                  event,
                ),
              ),
            ),

            const SizedBox(height: 20),

            _buildHowItWorksCard(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4F46E5),
            Color(0xFF7C3AED),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.auto_awesome,
            color: Colors.white,
            size: 32,
          ),
          SizedBox(height: 14),
          Text(
            'Personalised for you',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Discover communities and events that match your interests and campus activities.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    String title,
    String subtitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildCommunityCard(
    BuildContext context,
    Map<String, dynamic> community,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CommunityDetailsScreen(
              communityName: community['name'],
              category: community['category'],
              members: community['members'],
              icon: community['icon'],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 29,
              backgroundColor: const Color(0xFFEEF2FF),
              child: Icon(
                community['icon'],
                color: const Color(0xFF4F46E5),
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    community['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    community['category'],
                    style: const TextStyle(
                      color: Color(0xFF4F46E5),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    community['reason'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(
    BuildContext context,
    Map<String, dynamic> event,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EventDetailsScreen(
              title: event['title'],
              date: event['date'],
              time: event['time'],
              location: event['location'],
              category: event['category'],
              icon: event['icon'],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                event['icon'],
                color: const Color(0xFF059669),
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    event['category'],
                    style: const TextStyle(
                      color: Color(0xFF059669),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    event['reason'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${event['date']} • ${event['location']}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHowItWorksCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.psychology_outlined,
                color: Color(0xFF4F46E5),
              ),
              SizedBox(width: 10),
              Text(
                'How recommendations work',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Recommendations can use your interests, communities, events, academic information and interaction history to suggest relevant campus activities.',
            style: TextStyle(
              color: Colors.black54,
              height: 1.5,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}