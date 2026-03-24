import 'package:flutter/material.dart';

/// A horizontal bar showing how full an event is.
///
/// STATELESS widget - purely a visual representation of the
/// capacity percentage passed in.
///
/// PackTrack teams: this is basically your gym crowd meter!
/// Swap out the label and colors and you're most of the way there.
class CapacityIndicator extends StatelessWidget {
  final int current;
  final int max;

  const CapacityIndicator({
    super.key,
    required this.current,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    final percent = current / max;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The bar itself
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 6,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(_getBarColor(percent)),
          ),
        ),
        const SizedBox(height: 4),
        // Label below the bar
        Text(
          '$current / $max spots filled',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Color _getBarColor(double percent) {
    if (percent > 0.9) return Colors.red.shade600;
    if (percent > 0.7) return Colors.orange.shade600;
    return Colors.green.shade600;
  }
}
