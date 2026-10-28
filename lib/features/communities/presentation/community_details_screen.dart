import 'package:flutter/material.dart';

import '../../../core/state/app_state.dart';

class CommunityDetailsScreen extends StatefulWidget {
  final String communityName;
  final String category;
  final String members;
  final IconData icon;

  const CommunityDetailsScreen({
    super.key,
    required this.communityName,
    required this.category,
    required this.members,
    required this.icon,
  });

  @override
  State<CommunityDetailsScreen> createState() =>
      _CommunityDetailsScreenState();
}

class _CommunityDetailsScreenState
    extends State<CommunityDetailsScreen> {
  final AppState appState = AppState.instance;

  @override
  Widget build(BuildContext context) {
    final bool isJoined =
        appState.isCommunityJoined(widget.communityName);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Community',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(isJoined),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAboutSection(),
                  const SizedBox(height: 24),
                  _buildStatsSection(),
                  const SizedBox(height: 24),
                  _buildActivitiesSection(),
                  const SizedBox(height: 24),
                  _buildMembersSection(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(bool isJoined) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4F46E5),
            Color(0xFF7C3AED),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: Colors.white,
            child: Icon(
              widget.icon,
              size: 40,
              color: const Color(0xFF4F46E5),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.communityName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            widget.category,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${widget.members} members',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _toggleCommunity,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF4F46E5),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                isJoined ? 'Joined ✓' : 'Join Community',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return _buildCard(
      title: 'About',
      child: const Text(
        'Connect with students who share similar interests, '
        'participate in discussions, collaborate on projects, '
        'and take part in community activities.',
        style: TextStyle(
          color: Colors.black54,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            Icons.people_outline,
            widget.members,
            'Members',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            Icons.event_outlined,
            '12',
            'Activities',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            Icons.chat_bubble_outline,
            '24',
            'Posts',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    IconData icon,
    String value,
    String label,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF4F46E5),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitiesSection() {
    return _buildCard(
      title: 'Community Activities',
      child: Column(
        children: [
          _buildActivity(
            Icons.code,
            'Coding Session',
            'Tomorrow • 4:00 PM',
          ),
          const Divider(height: 24),
          _buildActivity(
            Icons.groups_outlined,
            'Community Meetup',
            '28 September • 2:00 PM',
          ),
          const Divider(height: 24),
          _buildActivity(
            Icons.lightbulb_outline,
            'Project Discussion',
            '2 October • 5:00 PM',
          ),
        ],
      ),
    );
  }

  Widget _buildActivity(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFEEF2FF),
          child: Icon(
            icon,
            color: const Color(0xFF4F46E5),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
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
    );
  }

  Widget _buildMembersSection() {
    return _buildCard(
      title: 'Members',
      child: Column(
        children: [
          _buildMember(
            'AS',
            'Alex Sharma',
            'Community Admin',
          ),
          const Divider(height: 22),
          _buildMember(
            'RM',
            'Rahul Mehta',
            'Member',
          ),
          const Divider(height: 22),
          _buildMember(
            'PS',
            'Priya Sharma',
            'Member',
          ),
        ],
      ),
    );
  }

  Widget _buildMember(
    String initials,
    String name,
    String role,
  ) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFEEF2FF),
          child: Text(
            initials,
            style: const TextStyle(
              color: Color(0xFF4F46E5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                role,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  void _toggleCommunity() {
    appState.toggleCommunity(widget.communityName);

    setState(() {});

    final bool joined =
        appState.isCommunityJoined(widget.communityName);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          joined
              ? 'Joined ${widget.communityName}'
              : 'Left ${widget.communityName}',
        ),
      ),
    );
  }
}