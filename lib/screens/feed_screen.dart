import 'package:flutter/material.dart';
import '../data/mock_events.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';
import '../widgets/category_filter.dart';
import 'event_detail_screen.dart';

/// ============================================================
/// FeedScreen - The main screen of Campus Pulse
/// ============================================================
///
/// This is a STATEFUL widget because it manages two pieces of
/// state that change based on user interaction:
///   1. _selectedCategory - which filter chip is active
///   2. _bookmarkedIds - which events the user has bookmarked
///
/// When the user taps a filter or toggles a bookmark, we call
/// setState() to trigger a rebuild with the updated state.
///
/// LAYOUT (widget tree):
///   Scaffold
///   ├── AppBar (title + actions)
///   └── Column (body)
///       ├── CategoryFilter (horizontal chip list)
///       ├── SizedBox (spacing)
///       └── Expanded → ListView.builder (scrollable event cards)
///
class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // ---- STATE VARIABLES ----
  String _selectedCategory = 'All';
  final Set<String> _bookmarkedIds = {};

  // ---- DERIVED DATA ----
  // Filter events based on selected category.
  // In production, you might do this filtering server-side
  // with a Firestore query or API parameter.
  List<Event> get _filteredEvents {
    if (_selectedCategory == 'All') return mockEvents;
    return mockEvents
        .where((e) => e.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---- APP BAR ----
      appBar: AppBar(
        title: const Text(
          'Campus Pulse',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          // Bookmark counter badge
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.bookmarks_outlined),
                onPressed: () {
                  // TODO: Navigate to a "My Bookmarks" screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${_bookmarkedIds.length} event(s) bookmarked',
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              if (_bookmarkedIds.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${_bookmarkedIds.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      // ---- BODY ----
      body: Column(
        children: [
          const SizedBox(height: 8),

          // Category filter chips
          CategoryFilter(
            categories: eventCategories,
            selectedCategory: _selectedCategory,
            onCategorySelected: (category) {
              // setState tells Flutter: "my state changed, rebuild!"
              setState(() {
                _selectedCategory = category;
              });
            },
          ),

          const SizedBox(height: 8),

          // Event feed list
          // Expanded fills remaining vertical space
          Expanded(
            child: _filteredEvents.isEmpty
                ? Center(
                    child: Text(
                      'No events in "$_selectedCategory"',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  )
                : ListView.builder(
                    // ListView.builder is lazy - it only builds
                    // widgets that are visible on screen. Critical
                    // for long lists (imagine 500 events).
                    itemCount: _filteredEvents.length,
                    itemBuilder: (context, index) {
                      final event = _filteredEvents[index];
                      return EventCard(
                        event: event,
                        isBookmarked: _bookmarkedIds.contains(event.id),
                        onBookmarkToggle: () {
                          setState(() {
                            if (_bookmarkedIds.contains(event.id)) {
                              _bookmarkedIds.remove(event.id);
                            } else {
                              _bookmarkedIds.add(event.id);
                            }
                          });
                        },
                        onTap: () {
                          // NAVIGATION: push a new screen onto the stack
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EventDetailScreen(
                                event: event,
                                isBookmarked:
                                    _bookmarkedIds.contains(event.id),
                                onBookmarkToggle: () {
                                  setState(() {
                                    if (_bookmarkedIds.contains(event.id)) {
                                      _bookmarkedIds.remove(event.id);
                                    } else {
                                      _bookmarkedIds.add(event.id);
                                    }
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
