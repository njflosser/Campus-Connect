import 'package:flutter/material.dart';

import '../../../core/state/app_state.dart';

class EventDetailsScreen extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final String category;
  final IconData icon;

  const EventDetailsScreen({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.category,
    required this.icon,
  });

  @override
  State<EventDetailsScreen> createState() =>
      _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final AppState appState = AppState.instance;

  @override
  Widget build(BuildContext context) {
    final bool isRegistered =
        appState.isEventRegistered(widget.title);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'Event Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(isRegistered),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInformationCard(),
                  const SizedBox(height: 24),
                  _buildAboutCard(),
                  const SizedBox(height: 24),
                  _buildScheduleCard(),
                  const SizedBox(height: 24),
                  _buildOrganizerCard(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(bool isRegistered) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF059669),
            Color(0xFF0D9488),
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
              color: const Color(0xFF059669),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.category,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _toggleRegistration,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF059669),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                isRegistered
                    ? 'Registered ✓'
                    : 'Register for Event',
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

  Widget _buildInformationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            Icons.calendar_today_outlined,
            'Date',
            widget.date,
          ),
          const Divider(height: 24),
          _buildInfoRow(
            Icons.access_time_outlined,
            'Time',
            widget.time,
          ),
          const Divider(height: 24),
          _buildInfoRow(
            Icons.location_on_outlined,
            'Location',
            widget.location,
          ),
          const Divider(height: 24),
          _buildInfoRow(
            Icons.category_outlined,
            'Category',
            widget.category,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        CircleAvatar(
          radius: 19,
          backgroundColor: const Color(0xFFECFDF5),
          child: Icon(
            icon,
            size: 20,
            color: const Color(0xFF059669),
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
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAboutCard() {
    return _buildCard(
      title: 'About',
      child: const Text(
        'Join fellow students for an engaging campus event. '
        'This event provides an opportunity to learn, connect '
        'with other students, and participate in campus activities.',
        style: TextStyle(
          color: Colors.black54,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildScheduleCard() {
    return _buildCard(
      title: 'Schedule',
      child: Column(
        children: [
          _buildScheduleItem(
            '10:00 AM',
            'Registration',
          ),
          _buildScheduleItem(
            '10:30 AM',
            'Opening Session',
          ),
          _buildScheduleItem(
            '11:00 AM',
            'Main Event',
          ),
          _buildScheduleItem(
            '1:00 PM',
            'Closing Session',
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(
    String time,
    String activity,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              time,
              style: const TextStyle(
                color: Color(0xFF059669),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF059669),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              activity,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrganizerCard() {
    return _buildCard(
      title: 'Organiser',
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xFFECFDF5),
            child: Icon(
              Icons.school_outlined,
              color: Color(0xFF059669),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Campus Connect',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Student Activities',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.verified,
            color: Color(0xFF059669),
          ),
        ],
      ),
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

  void _toggleRegistration() {
    appState.toggleEvent(widget.title);

    setState(() {});

    final bool registered =
        appState.isEventRegistered(widget.title);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          registered
              ? 'Registered for ${widget.title}'
              : 'Registration cancelled',
        ),
      ),
    );
  }
}