import 'package:flutter/material.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      'isUser': false,
      'message':
          'Hello! I’m Campus AI. How can I help you with your university today?',
    },
  ];

  final List<String> suggestions = [
    'Where is the library?',
    'What events are happening?',
    'Find technology communities',
    'Show academic resources',
  ];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void sendMessage([String? suggestion]) {
    final text = suggestion ?? messageController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'isUser': true,
        'message': text,
      });

      messages.add({
        'isUser': false,
        'message': _generateMockResponse(text),
      });
    });

    messageController.clear();
  }

  String _generateMockResponse(String message) {
    final query = message.toLowerCase();

    if (query.contains('library')) {
      return 'The university library is located on the main campus. I can provide more details once the campus database is connected.';
    }

    if (query.contains('event')) {
      return 'There are several upcoming campus events, including Tech Fest 2026, Freshers Meet and an AI & Machine Learning Workshop.';
    }

    if (query.contains('community') ||
        query.contains('club')) {
      return 'Based on your interests, I can recommend communities such as Developers, Photography and Gaming.';
    }

    if (query.contains('academic') ||
        query.contains('resource')) {
      return 'I can help you find academic resources, courses and university materials once the academic database is connected.';
    }

    return 'I can help you with campus information, events, communities, academics and university resources.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7FB),
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFE8EAF6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                color: Color(0xFF3949AB),
                size: 21,
              ),
            ),
            const SizedBox(width: 11),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Campus AI',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                Text(
                  'Your campus assistant',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              children: [
                _buildIntroCard(),
                const SizedBox(height: 22),
                _buildSuggestionSection(),
                const SizedBox(height: 20),
                ...messages.map(
                  (message) => _buildMessage(
                    isUser: message['isUser'] as bool,
                    message: message['message'] as String,
                  ),
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildIntroCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF303F9F),
            Color(0xFF5C6BC0),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(height: 15),
          Text(
            'How can I help?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Ask me about your campus, academics, events, communities and more.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Try asking',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: suggestions.map((suggestion) {
            return GestureDetector(
              onTap: () => sendMessage(suggestion),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFE5E7EB),
                  ),
                ),
                child: Text(
                  suggestion,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF3949AB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMessage({
    required bool isUser,
    required String message,
  }) {
    return Align(
      alignment:
          isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 310,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? const Color(0xFF3949AB)
              : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(17),
            topRight: const Radius.circular(17),
            bottomLeft: Radius.circular(isUser ? 17 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 17),
          ),
          border: isUser
              ? null
              : Border.all(
                  color: const Color(0xFFE5E7EB),
                ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser
                ? Colors.white
                : const Color(0xFF1A1A2E),
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE5E7EB),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => sendMessage(),
              decoration: InputDecoration(
                hintText: 'Ask Campus AI...',
                hintStyle: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 13,
                ),
                filled: true,
                fillColor: const Color(0xFFF7F7FB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 9),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFF3949AB),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }
}