/// Event model for Campus Pulse
///
/// In your own project, this model maps to whatever entity you're displaying:
/// - Groupie: a Task or Sprint
/// - PackTrack: a Gym or Facility
/// - Curate.ai: a Beverage Recipe
/// - The Directors: a Film Listing or Actor Profile
/// - GrubAble: a Restaurant or Menu Item
class Event {
  final String id;
  final String title;
  final String description;
  final String location;
  final String date;
  final String time;
  final String category;
  final String imageUrl;
  final int currentAttendees;
  final int maxCapacity;
  final String status; // "Happening Now", "Starting Soon", "Almost Full", "Open"

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.time,
    required this.category,
    required this.imageUrl,
    required this.currentAttendees,
    required this.maxCapacity,
    required this.status,
  });

  /// Capacity as a percentage (0.0 to 1.0)
  /// PackTrack teams: this is exactly the kind of derived property
  /// you'd use for gym crowd levels!
  double get capacityPercent => currentAttendees / maxCapacity;
}
