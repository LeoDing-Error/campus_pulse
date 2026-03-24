import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/status_chip.dart';
import '../widgets/capacity_indicator.dart';

/// ============================================================
/// EventDetailScreen - Shown when user taps an event card
/// ============================================================
///
/// Demonstrates NAVIGATION in Flutter.
/// We got here via Navigator.push() from FeedScreen.
/// The back arrow uses Navigator.pop() automatically.
///
/// This screen is STATELESS - it receives everything it needs
/// from the parent via constructor parameters.
///
/// LAYOUT:
///   Scaffold
///   ├── SliverAppBar (collapsing image header)
///   └── SliverList (scrollable content)
///       ├── Status + Category row
///       ├── Title
///       ├── Info rows (location, time)
///       ├── Capacity indicator
///       ├── Description
///       └── "Register" button
///
class EventDetailScreen extends StatelessWidget {
  final Event event;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const EventDetailScreen({
    super.key,
    required this.event,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CustomScrollView lets us use a collapsing app bar image
      body: CustomScrollView(
        slivers: [
          // ---- COLLAPSING HEADER IMAGE ----
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                event.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: Colors.grey.shade300);
                },
              ),
            ),
            actions: [
              // Bookmark button in the app bar
              IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.deepPurple : Colors.white,
                ),
                onPressed: onBookmarkToggle,
              ),
            ],
          ),

          // ---- DETAIL CONTENT ----
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status and category row
                  Row(
                    children: [
                      StatusChip(status: event.status),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          event.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Title
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Location
                  _buildInfoRow(
                    Icons.location_on_outlined,
                    event.location,
                  ),

                  const SizedBox(height: 8),

                  // Date and time
                  _buildInfoRow(
                    Icons.access_time,
                    '${event.date} · ${event.time}',
                  ),

                  const SizedBox(height: 20),

                  // Capacity
                  const Text(
                    'Availability',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CapacityIndicator(
                    current: event.currentAttendees,
                    max: event.maxCapacity,
                  ),

                  const SizedBox(height: 20),

                  // Description
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Register button
                  // TODO: Connect to your backend here!
                  // Firebase: call a Cloud Function
                  // REST API: POST to /api/events/{id}/register
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Registration would connect to your backend here!',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Register for Event',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
