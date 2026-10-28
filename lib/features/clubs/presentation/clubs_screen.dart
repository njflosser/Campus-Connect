import 'package:flutter/material.dart';

class ClubsScreen extends StatelessWidget {
  const ClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'Clubs',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Discover student clubs and activities.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _searchBar(),
                  const SizedBox(height: 28),
                  const Text(
                    'Student Clubs',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _clubCard(
                    Icons.code_rounded,
                    'Programming Club',
                    'Technology',
                    '64 members',
                  ),
                  const SizedBox(height: 12),
                  _clubCard(
                    Icons.camera_alt_rounded,
                    'Photography Club',
                    'Arts & Media',
                    '48 members',
                  ),
                  const SizedBox(height: 12),
                  _clubCard(
                    Icons.sports_rounded,
                    'Sports Club',
                    'Sports',
                    '91 members',
                  ),
                  const SizedBox(height: 12),
                  _clubCard(
                    Icons.music_note_rounded,
                    'Music Club',
                    'Arts & Culture',
                    '53 members',
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _searchBar() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search clubs...',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xFF6B7280),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  static Widget _clubCard(
    IconData icon,
    String name,
    String category,
    String members,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EAF6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF3949AB),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$category • $members',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }
}