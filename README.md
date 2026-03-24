# Campus Pulse 🎓

A campus event feed app built for the **CS584 HCI Design Studio** Flutter demo.

## What This Demonstrates

| Concept | Where to Look |
|---|---|
| Stateless widgets | `StatusChip`, `CapacityIndicator`, `EventCard`, `CategoryFilter` |
| Stateful widget | `FeedScreen` (manages bookmarks + selected category) |
| Layouts: Row, Column, Stack | `EventCard` widget tree |
| ListView.builder (lazy lists) | `FeedScreen` body |
| Navigation (push/pop) | `FeedScreen` → `EventDetailScreen` |
| Material 3 theming | `main.dart` |
| Reusable widget composition | Cards built from smaller widgets |
| Mock data pattern | `data/mock_events.dart` |

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- [VS Code](https://code.visualstudio.com/) with the Flutter extension
- Chrome browser (for web) or iOS Simulator / Android Emulator

### Run It

```bash
# Clone the repo
git clone <your-repo-url>
cd campus_pulse

# Get dependencies
flutter pub get

# Run in Chrome (works on any OS)
flutter run -d chrome

# Or run on iOS Simulator (macOS only)
flutter run

# Or run on Android Emulator
flutter run -d android
```

### Hot Reload
While the app is running, save any file (Cmd+S / Ctrl+S) to see changes instantly.

## Project Structure

```
lib/
├── main.dart                  # App entry point, theme config
├── models/
│   └── event.dart             # Event data model
├── data/
│   └── mock_events.dart       # Fake backend data
├── screens/
│   ├── feed_screen.dart       # Main feed (StatefulWidget)
│   └── event_detail_screen.dart  # Detail view (StatelessWidget)
└── widgets/
    ├── event_card.dart        # Card component
    ├── status_chip.dart       # Status badge
    ├── capacity_indicator.dart # Capacity progress bar
    └── category_filter.dart   # Horizontal filter chips
```

## Customization Challenges

1. **Change the theme**: In `main.dart`, swap `Colors.deepPurple` for another color and hot reload.
2. **Add a new event**: Add an `Event(...)` entry in `mock_events.dart`.
3. **Add a new category**: Add a string to `eventCategories` and use it in your new event.
4. **Change the status colors**: Edit `_getStatusColor()` in `status_chip.dart`.
5. **Add a new info row**: In `event_detail_screen.dart`, add another `_buildInfoRow()` call.

## Where You'd Plug In Real Backends

Look for `TODO` comments throughout the code. Key integration points:

- **`mock_events.dart`** → Replace with Firestore `StreamBuilder`, REST API calls, or Supabase queries
- **Register button** in `event_detail_screen.dart` → POST to your API
- **Bookmark state** in `feed_screen.dart` → Persist to user profile in your database
- **Images** → Swap `picsum.photos` URLs for your own image storage (Firebase Storage, S3, etc.)

## Built With

- [Flutter](https://flutter.dev/) 3.x
- [Material 3](https://m3.material.io/)
- Dart
