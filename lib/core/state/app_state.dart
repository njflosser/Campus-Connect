import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  AppState._privateConstructor();

  static final AppState instance = AppState._privateConstructor();

  final List<String> joinedCommunities = [
    'Developers Community',
    'Photography Club',
  ];

  final List<String> registeredEvents = [
    'Tech Fest 2026',
    'AI & Machine Learning Workshop',
  ];

  bool isCommunityJoined(String communityName) {
    return joinedCommunities.contains(communityName);
  }

  bool isEventRegistered(String eventName) {
    return registeredEvents.contains(eventName);
  }

  void toggleCommunity(String communityName) {
    if (joinedCommunities.contains(communityName)) {
      joinedCommunities.remove(communityName);
    } else {
      joinedCommunities.add(communityName);
    }

    notifyListeners();
  }

  void toggleEvent(String eventName) {
    if (registeredEvents.contains(eventName)) {
      registeredEvents.remove(eventName);
    } else {
      registeredEvents.add(eventName);
    }

    notifyListeners();
  }
}