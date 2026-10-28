import 'package:flutter/material.dart';

import '../../academics/presentation/academics_screen.dart';
import '../../ai_assistant/presentation/ai_assistant_screen.dart';
import '../../clubs/presentation/clubs_screen.dart';
import '../../communities/presentation/communities_screen.dart';
import '../../events/presentation/events_screen.dart';
import '../../recommendations/presentation/recommendations_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),

              const SizedBox(height: 24),

              _buildWelcomeCard(),

              const SizedBox(height: 28),

              _buildSectionTitle(
                'Quick Access',
                'Everything you need on campus',
              ),

              const SizedBox(height: 14),

              _buildQuickAccessGrid(context),

              const SizedBox(height: 28),

              _buildRecommendationsCard(context),

              const SizedBox(height: 28),

              _buildSectionTitle(
                'Upcoming Events',
                'Events happening around campus',
              ),

              const SizedBox(height: 14),

              _buildUpcomingEvents(context),

              const SizedBox(height: 28),

              _buildSectionTitle(
                'Communities',
                'Find students with similar interests',
              ),

              const SizedBox(height: 14),

              _buildCommunities(context),

              const SizedBox(height: 28),

              _buildAiAssistantCard(context),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFFEEF2FF),
          child: Text(
            'NJ',
            style: TextStyle(
              color: Color(0xFF4F46E5),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day, Noel',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Welcome back 👋',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: 27,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeCard() {
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
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.school_outlined,
            color: Colors.white,
            size: 32,
          ),
          SizedBox(height: 16),
          Text(
            'Your campus,\nconnected.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              height: 1.15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Discover events, communities, academic resources and more.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
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

  Widget _buildQuickAccessGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.45,
      children: [
        _buildQuickAccessItem(
          context,
          Icons.school_outlined,
          'Academics',
          const Color(0xFF4F46E5),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AcademicsScreen(),
              ),
            );
          },
        ),
        _buildQuickAccessItem(
          context,
          Icons.event_outlined,
          'Events',
          const Color(0xFF059669),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EventsScreen(),
              ),
            );
          },
        ),
        _buildQuickAccessItem(
          context,
          Icons.groups_outlined,
          'Clubs',
          const Color(0xFFD97706),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ClubsScreen(),
              ),
            );
          },
        ),
        _buildQuickAccessItem(
          context,
          Icons.forum_outlined,
          'Communities',
          const Color(0xFFDB2777),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CommunitiesScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildQuickAccessItem(
    BuildContext context,
    IconData icon,
    String title,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: iconColor.withValues(alpha: 0.10),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationsCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RecommendationsScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF4F46E5),
              Color(0xFF7C3AED),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white24,
              child: Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 27,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended for You',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Discover communities and events based on your interests.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEvents(BuildContext context) {
    return Column(
      children: [
        _buildEventCard(
          context,
          title: 'Tech Fest 2026',
          date: '20 OCT 2026',
          category: 'Academic',
          location: 'Main Campus',
          icon: Icons.computer_outlined,
        ),
        const SizedBox(height: 12),
        _buildEventCard(
          context,
          title: 'Freshers Meet',
          date: '22 SEP 2026',
          category: 'Cultural',
          location: 'Main Campus',
          icon: Icons.celebration_outlined,
        ),
        const SizedBox(height: 12),
        _buildEventCard(
          context,
          title: 'AI & Machine Learning Workshop',
          date: '26 SEP 2026',
          category: 'Workshop',
          location: 'Computer Lab',
          icon: Icons.smart_toy_outlined,
        ),
      ],
    );
  }

  Widget _buildEventCard(
    BuildContext context, {
    required String title,
    required String date,
    required String category,
    required String location,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EventsScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF059669),
                size: 27,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xFF059669),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 9),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          location,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
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

  Widget _buildCommunities(BuildContext context) {
    return Column(
      children: [
        _buildCommunityCard(
          context,
          name: 'Developers Community',
          category: 'Technology',
          members: '128',
          icon: Icons.code,
        ),
        const SizedBox(height: 12),
        _buildCommunityCard(
          context,
          name: 'Photography Club',
          category: 'Photography',
          members: '86',
          icon: Icons.camera_alt_outlined,
        ),
        const SizedBox(height: 12),
        _buildCommunityCard(
          context,
          name: 'Gaming Community',
          category: 'Gaming',
          members: '94',
          icon: Icons.sports_esports_outlined,
        ),
      ],
    );
  }

  Widget _buildCommunityCard(
    BuildContext context, {
    required String name,
    required String category,
    required String members,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CommunitiesScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: const Color(0xFFEEF2FF),
              child: Icon(
                icon,
                color: const Color(0xFF4F46E5),
                size: 27,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xFF4F46E5),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$members members',
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

  Widget _buildAiAssistantCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AiAssistantScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white12,
              child: Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 27,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Campus AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Ask about academics, events, communities and campus resources.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}