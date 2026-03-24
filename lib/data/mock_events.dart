import '../models/event.dart';

/// ============================================================
/// MOCK DATA - "Man Behind the Curtain"
/// ============================================================
/// This file simulates what you'd normally fetch from a backend.
///
/// WHERE YOU'D PLUG IN A REAL BACKEND:
///   - Firebase Firestore: Replace this list with a StreamBuilder
///     listening to a Firestore collection
///   - REST API: Replace with an HTTP GET call using the `http` package
///   - Supabase: Replace with a Supabase query
///
/// For now, this lets us focus on building the UI without
/// worrying about authentication, API keys, or network errors.
/// ============================================================

final List<Event> mockEvents = [
  Event(
    id: '1',
    title: 'HCI Design Critique Session',
    description:
        'Bring your Figma prototypes for peer feedback. Each team gets 10 '
        'minutes to present their current iteration and receive structured '
        'critique from classmates and the instructor. Focus areas: navigation '
        'flow, visual hierarchy, and accessibility.',
    location: 'Math & Science Center W201',
    date: 'Today',
    time: '2:00 PM',
    category: 'Academic',
    imageUrl: 'https://picsum.photos/seed/hci/400/200',
    currentAttendees: 28,
    maxCapacity: 35,
    status: 'Happening Now',
  ),
  Event(
    id: '2',
    title: 'Flutter Workshop: Firebase Integration',
    description:
        'Hands-on workshop covering Firebase setup, Firestore CRUD operations, '
        'and Firebase Auth. Bring your laptop with Flutter SDK installed. '
        'We\'ll build a simple chat feature from scratch.',
    location: 'Atwood Chemistry Center 215',
    date: 'Today',
    time: '4:30 PM',
    category: 'Workshop',
    imageUrl: 'https://picsum.photos/seed/flutter/400/200',
    currentAttendees: 18,
    maxCapacity: 40,
    status: 'Open',
  ),
  Event(
    id: '3',
    title: 'Intramural Basketball Finals',
    description:
        'Championship game between the CS Debuggers and the Math Primes. '
        'Come support your department! Concessions available. '
        'Overflow seating in the adjacent court.',
    location: 'Woodruff PE Center',
    date: 'Today',
    time: '7:00 PM',
    category: 'Sports',
    imageUrl: 'https://picsum.photos/seed/basketball/400/200',
    currentAttendees: 145,
    maxCapacity: 150,
    status: 'Almost Full',
  ),
  Event(
    id: '4',
    title: 'Startup Pitch Night',
    description:
        'Five student startups pitch their MVPs to a panel of local investors '
        'and alumni founders. Networking reception follows. '
        'Great opportunity to see real pitches and ask questions.',
    location: 'Goizueta Business School',
    date: 'Tomorrow',
    time: '6:00 PM',
    category: 'Networking',
    imageUrl: 'https://picsum.photos/seed/startup/400/200',
    currentAttendees: 55,
    maxCapacity: 100,
    status: 'Open',
  ),
  Event(
    id: '5',
    title: 'Outdoor Yoga on the Quad',
    description:
        'Unwind with a guided yoga session on the main quad. All levels '
        'welcome. Mats provided, but bring your own if you prefer. '
        'Rain location: Student Activity Center Room 110.',
    location: 'McDonough Field',
    date: 'Tomorrow',
    time: '8:00 AM',
    category: 'Wellness',
    imageUrl: 'https://picsum.photos/seed/yoga/400/200',
    currentAttendees: 12,
    maxCapacity: 30,
    status: 'Open',
  ),
  Event(
    id: '6',
    title: 'Film Screening: Student Shorts',
    description:
        'Showcase of short films produced by students in the Film & Media '
        'Studies program this semester. Q&A with directors after the screening. '
        'Popcorn provided.',
    location: 'White Hall 208',
    date: 'Friday',
    time: '7:30 PM',
    category: 'Arts',
    imageUrl: 'https://picsum.photos/seed/film/400/200',
    currentAttendees: 30,
    maxCapacity: 60,
    status: 'Starting Soon',
  ),
  Event(
    id: '7',
    title: 'Coffee Tasting: Pour-Over Techniques',
    description:
        'Learn three pour-over methods (V60, Chemex, Kalita Wave) with a '
        'local roaster. Taste the difference grind size and water temperature '
        'make. Beans and equipment provided.',
    location: 'Kaldi\'s Coffee Lab',
    date: 'Saturday',
    time: '10:00 AM',
    category: 'Workshop',
    imageUrl: 'https://picsum.photos/seed/coffee/400/200',
    currentAttendees: 8,
    maxCapacity: 15,
    status: 'Open',
  ),
];

/// All unique categories extracted from mock data.
/// In production, you'd query these from your backend or
/// define them as an enum.
final List<String> eventCategories = [
  'All',
  'Academic',
  'Workshop',
  'Sports',
  'Networking',
  'Wellness',
  'Arts',
];
