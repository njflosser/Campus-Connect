import 'package:flutter/material.dart';

import 'community_details_screen.dart';

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = 'All';

  final List<Map<String, dynamic>> communities = [
    {
      'name': 'Developers Community',
      'category': 'Technology',
      'members': '128',
      'icon': Icons.code,
    },
    {
      'name': 'Photography Club',
      'category': 'Photography',
      'members': '86',
      'icon': Icons.camera_alt_outlined,
    },
    {
      'name': 'Gaming Community',
      'category': 'Gaming',
      'members': '94',
      'icon': Icons.sports_esports_outlined,
    },
    {
      'name': 'Music Society',
      'category': 'Music',
      'members': '72',
      'icon': Icons.music_note_outlined,
    },
    {
      'name': 'Sports Club',
      'category': 'Sports',
      'members': '91',
      'icon': Icons.sports_soccer_outlined,
    },
    {
      'name': 'Arts & Culture Club',
      'category': 'Arts & Culture',
      'members': '63',
      'icon': Icons.palette_outlined,
    },
  ];

  final List<String> categories = [
    'All',
    'Technology',
    'Arts & Culture',
    'Sports',
    'Photography',
    'Music',
    'Gaming',
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredCommunities {
    final query = searchController.text.toLowerCase().trim();

    return communities.where((community) {
      final name = community['name'].toString().toLowerCase();
      final category = community['category'].toString();

      final matchesSearch =
          query.isEmpty ||
          name.contains(query) ||
          category.toLowerCase().contains(query);

      final matchesCategory =
          selectedCategory == 'All' ||
          category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredCommunities;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'Communities',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSearchSection(),
          _buildCategoryFilters(),
          Expanded(
            child: filtered.isEmpty
                ? _buildEmptyState()
                : _buildCommunityList(filtered),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: TextField(
        controller: searchController,
        onChanged: (_) {
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: 'Search communities...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() {});
                  },
                )
              : null,
          filled: true,
          fillColor: const Color(0xFFF1F3F6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return Container(
      height: 58,
      color: Colors.white,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = selectedCategory == category;

          return ChoiceChip(
            label: Text(category),
            selected: selected,
            onSelected: (_) {
              setState(() {
                selectedCategory = category;
              });
            },
            selectedColor: const Color(0xFF4F46E5),
            backgroundColor: const Color(0xFFF1F3F6),
            labelStyle: TextStyle(
              color: selected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            side: BorderSide.none,
          );
        },
      ),
    );
  }

  Widget _buildCommunityList(
    List<Map<String, dynamic>> filtered,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: filtered.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final community = filtered[index];

        return _buildCommunityCard(community);
      },
    );
  }

  Widget _buildCommunityCard(
    Map<String, dynamic> community,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        _openCommunity(
          community['name'],
          community['category'],
          community['members'],
          community['icon'],
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
              radius: 28,
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
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    community['category'],
                    style: const TextStyle(
                      color: Color(0xFF4F46E5),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${community['members']} members',
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
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 60,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              'No communities found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different search or category.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCommunity(
    String name,
    String category,
    String members,
    IconData icon,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CommunityDetailsScreen(
          communityName: name,
          category: category,
          members: members,
          icon: icon,
        ),
      ),
    );
  }
}