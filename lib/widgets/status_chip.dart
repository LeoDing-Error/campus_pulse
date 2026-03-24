import 'package:flutter/material.dart';

/// A small colored chip that shows event status.
///
/// This is a STATELESS widget - it just renders based on the
/// status string passed in. No internal state to manage.
///
/// Reusable pattern: You could adapt this for:
/// - PackTrack: "Packed", "Moderate", "Empty"
/// - Groupie: "In Progress", "Blocked", "Done"
/// - GrubAble: "Safe", "Contains Allergen", "Ask Server"
class StatusChip extends StatelessWidget {
  final String status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _getStatusColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case 'Happening Now':
        return Colors.green.shade600;
      case 'Starting Soon':
        return Colors.orange.shade600;
      case 'Almost Full':
        return Colors.red.shade600;
      default:
        return Colors.blue.shade600;
    }
  }
}
