# Memory Match (Exercise 2)

**Course:** COMP5450 Mobile Programming  
**Student:** Liang Mingchen  
**Assignment:** Exercise 2 — Memory Matching Flutter Game (30 points)

Flutter memory game for Exercise 2. The board is **4×5** (20 cards, 10 pairs). You flip two cards per turn and try to find matching animals. The UI follows the handout mockup: purple **Memory Match** title, move count on the right, colorful card backs with **?**, animal faces when flipped, and a **Restart** button.

## What the app does

- **Grid:** 4 columns × 5 rows (20 cards total, 10 matching pairs).
- **Animals:** 🦘 🦓 🐯 🦁 🐻 🐼 🦊 🐵 🐨 🐧 (shown as emoji on the card face).
- **Turn flow:** Tap one card, then another. If they match, both stay face-up. If not, they flip back after about 750 ms.
- **Moves:** Each time you compare two face-up cards, the move counter increases by 1 (first flip alone does not count).
- **Header:** “Find all matching pairs! 🐾” and a matched-pairs line under the title.
- **Restart:** Shuffles a new deck and resets moves.
- **Win:** Dialog when all 10 pairs are found.

There is no backend, database, or network code. Questions and board state are kept in memory inside the app.

## How the code is organized

| File | Role |
|------|------|
| `lib/main.dart` | Starts the app, sets theme, loads `MemoryMatchScreen`. |
| `lib/models/memory_card_data.dart` | One card: symbol, back color index, face-up / matched flags. |
| `lib/game/memory_game.dart` | Shuffle deck, handle taps, moves, win check. |
| `lib/screens/memory_match_screen.dart` | App bar, grid, restart button, win dialog. |
| `lib/widgets/memory_card_tile.dart` | Single card UI and flip animation. |
| `test/memory_game_test.dart` | Unit tests for game rules. |
| `test/widget_test.dart` | UI smoke tests (loads screen, restart, back button). |

## Configure (first-time setup)

1. **Install Flutter** (stable channel): https://docs.flutter.dev/get-started/install  
2. **Install Android Studio** and add the **Flutter** and **Dart** plugins.  
3. Open a terminal in the project folder and run:

```bash
flutter doctor
```

Fix anything marked with ✗ (common fixes: `flutter doctor --android-licenses`, install Xcode command-line tools on Mac for iOS).

4. Get packages:

```bash
cd exercise-2
flutter pub get
```

5. **Open in Android Studio:** File → Open → select this folder (the one that contains `pubspec.yaml`). Wait for Gradle sync / Pub get to finish.

6. **Pick a device:** Tools → Device Manager (Android emulator) or plug in a phone with USB debugging enabled. Run `flutter devices` to confirm Flutter sees it.

For marking, the exercise rubric prefers showing the app on an **emulator or phone**, not only in Chrome.

## Run the app

**From Android Studio:** Select the device, then click Run (green play).

**From terminal:**

```bash
flutter pub get
flutter run
```

**Debug APK:**

```bash
flutter build apk --debug
```

Output: `build/app/outputs/flutter-apk/app-debug.apk`

**Web (optional preview only):**

```bash
flutter run -d chrome
```

## Exact project structure

```text
exercise-2/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── memory_card_data.dart
│   ├── game/
│   │   └── memory_game.dart
│   ├── screens/
│   │   └── memory_match_screen.dart
│   └── widgets/
│       └── memory_card_tile.dart
├── test/
│   ├── memory_game_test.dart
│   └── widget_test.dart
├── android/                 # Android host (Gradle, MainActivity)
├── ios/                     # iOS host
├── web/                     # Web host
├── linux/ macos/ windows/   # Desktop hosts from flutter create
├── pubspec.yaml
├── analysis_options.yaml
├── README.md
├── README.pdf               # Submission document (this content + screenshots)
├── screenshot-home.png
└── screenshot-play.png
```

## Tests run before submit

```bash
flutter analyze
flutter test
```

Both complete with no errors in the final submission build.

## Screenshots

Included in this PDF and saved as PNG in the project root:

- **screenshot-home.png** — board with face-down cards  
- **screenshot-play.png** — gameplay with some cards flipped  

## GitHub

https://github.com/achenachena/comp5450-exercise-2-memory-match

## D2L submission

Upload a ZIP containing Dart source, images, and `README.pdf`. Local package name: `MemoryMatch-Exercise2.zip`.

## Notes

Individual exercise. If the app does not start, run `flutter doctor` and `flutter devices` first.
