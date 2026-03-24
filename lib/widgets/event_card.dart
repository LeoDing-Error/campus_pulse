import 'package:flutter/material.dart';
import '../models/event.dart';
import 'status_chip.dart';
import 'capacity_indicator.dart';

/// A card displaying a single event in the feed.
///
/// This widget is STATELESS - the bookmark state is managed by the
/// parent (FeedScreen) and passed down via [isBookmarked] and
/// [onBookmarkToggle]. This is a common Flutter pattern:
/// "state up, callbacks down."
///
/// Layout structure (the widget tree for this card):
///   Card
///   └── Column
///       ├── Stack (image + status chip overlay)
///       │   ├── Image
///       │   └── Positioned → StatusChip
///       └── Padding
///           └── Column
///               ├── Row (title + bookmark icon)
///               ├── Row (location info)
///               ├── Row (date/time info)
///               └── CapacityIndicator
class EventCard extends StatelessWidget {
  final Event event;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.isBookmarked,
    required this.onBookmarkToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- Image with status chip overlay ----
            Stack(
              children: [
                // Event image
                Image.network(
                  event.imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Placeholder while image loads
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 140,
                      color: Colors.grey.shade200,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  // Fallback if image fails to load
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 140,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 40),
                      ),
                    );
                  },
                ),
                // Status chip in top-left corner
                Positioned(
                  top: 8,
                  left: 8,
                  child: StatusChip(status: event.status),
                ),
                // Category tag in top-right
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      event.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ---- Card content below the image ----
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title row with bookmark button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Expanded makes the title take remaining space
                      Expanded(
                        child: Text(
                          event.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // Bookmark toggle button
                      // onBookmarkToggle fires, parent updates state,
                      // widget rebuilds with new isBookmarked value
                      IconButton(
                        icon: Icon(
                          isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: isBookmarked
                              ? Colors.deepPurple
                              : Colors.grey,
                        ),
                        onPressed: onBookmarkToggle,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Location row
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          event.location,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Date and time row
                  Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(
                        '${event.date} · ${event.time}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Capacity bar
                  CapacityIndicator(
                    current: event.currentAttendees,
                    max: event.maxCapacity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
