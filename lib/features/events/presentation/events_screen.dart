import 'package:flutter/material.dart';

import 'event_details_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Academic',
    'Cultural',
    'Sports',
    'Workshop',
  ];

  final List<Map<String, dynamic>> events = [
    {
      'title': 'Tech Fest 2026',
      'date': '20 OCT 2026',
      'time': '10:00 AM',
      'location': 'Main Campus',
      'category': 'Academic',
      'icon': Icons.computer_outlined,
    },
    {
      'title': 'Freshers Meet',
      'date': '22 SEP 2026',
      'time': '10:00 AM',
      'location': 'Main Campus',
      'category': 'Cultural',
      'icon': Icons.celebration_outlined,
    },
    {
      'title': 'AI & Machine Learning Workshop',
      'date': '26 SEP 2026',
      'time': '2:00 PM',
      'location': 'Computer Lab',
      'category': 'Workshop',
      'icon': Icons.smart_toy_outlined,
    },
    {
      'title': 'Inter-Department Football',
      'date': '30 SEP 2026',
      'time': '4:00 PM',
      'location': 'University Ground',
      'category': 'Sports',
      'icon': Icons.sports_soccer_outlined,
    },
    {
      'title': 'Cultural Night',
      'date': '05 OCT 2026',
      'time': '6:00 PM',
      'location': 'Auditorium',
      'category': 'Cultural',
      'icon': Icons.music_note_outlined,
    },
    {
      'title': 'Research & Innovation Seminar',
      'date': '10 OCT 2026',
      'time': '11:00 AM',
      'location': 'Seminar Hall',
      'category': 'Academic',
      'icon': Icons.science_outlined,
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredEvents {
    final query = searchController.text.toLowerCase().trim();

    return events.where((event) {
      final title = event['title'].toString().toLowerCase();
      final category = event['category'].toString().toLowerCase();
      final location = event['location'].toString().toLowerCase();

      final matchesSearch =
          query.isEmpty ||
          title.contains(query) ||
          category.contains(query) ||
          location.contains(query);

      final matchesCategory =
          selectedCategory == 'All' ||
          event['category'] == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredEvents;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'Events',
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
                : _buildEventList(filtered),
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
          hintText: 'Search events...',
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
            selectedColor: const Color(0xFF059669),
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

  Widget _buildEventList(
    List<Map<String, dynamic>> filtered,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: filtered.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _buildEventCard(filtered[index]);
      },
    );
  }

  Widget _buildEventCard(
    Map<String, dynamic> event,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        _openEvent(event);
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
                  const SizedBox(height: 6),
                  Text(
                    event['category'],
                    style: const TextStyle(
                      color: Color(0xFF059669),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 13,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        event['date'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 13,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          event['location'],
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

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.event_busy_outlined,
              size: 60,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              'No events found',
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

  void _openEvent(Map<String, dynamic> event) {
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
  }
}