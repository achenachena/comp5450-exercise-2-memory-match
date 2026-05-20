# Memory Match (Exercise 2)

Flutter/Dart memory matching game for **COMP5450 Mobile Programming** (Exercise 2).

The app shows a **4×5 grid** (20 cards, 10 animal pairs). Players flip two cards at a time, try to find matching pairs, and can restart at any time. The header shows the current **move count**, similar to the course mockup.

## Tech stack

- Flutter / Dart
- Material 3 UI
- In-memory game state (no backend)

## Features

- Title bar: **Memory Match** with move counter badge
- Subtitle: **Find all matching pairs! 🐾**
- Colorful card backs with **?** and animal emoji on the front
- Flip animation and short delay before mismatched cards turn back
- Win dialog when all pairs are found
- **Restart** button to shuffle and play again
- Responsive layout (centered board on wider screens)

## Project structure

```text
exercise-2/
├── lib/
│   ├── main.dart                      App entry + theme
│   ├── models/memory_card_data.dart   Card model
│   ├── game/memory_game.dart          Shuffle, matching, moves, win logic
│   ├── screens/memory_match_screen.dart   Main UI
│   └── widgets/memory_card_tile.dart  Single card widget
├── test/widget_test.dart              Widget tests
├── pubspec.yaml
├── README.md
└── README.pdf                         Submission PDF (screenshots + structure)
```

## How to run

### Requirements

- Flutter SDK (stable channel)
- Android Studio and/or VS Code with Flutter extension
- Android emulator, iOS simulator, Chrome, or a physical device

Check setup:

```bash
flutter doctor
```

### Android / iOS / device

```bash
cd exercises/exercise-2
flutter pub get
flutter run
```

Pick your device when prompted. Running on a **physical phone** is recommended for the course rubric bonus.

### Chrome (web)

```bash
flutter run -d chrome
```

### Build APK (Android)

```bash
flutter build apk --debug
```

Output: `build/app/outputs/flutter-apk/app-debug.apk`

## Checks used during development

```bash
flutter analyze
flutter test
flutter build web
```

## Screenshots

Included in `README.pdf` and optional PNG files in this folder:

- `screenshot-home.png` — board with face-down cards
- `screenshot-play.png` — flipped animal cards

## Submission checklist (Exercise 2 brief)

- [x] Flutter/Dart implementation
- [x] `README.pdf` with run steps, structure, screenshots
- [ ] Public GitHub repository (upload full project)
- [ ] ZIP for D2L: Dart files, assets, `README.pdf`

## Grading notes (from rubric)

| Area | What we targeted |
|------|------------------|
| Programming (Flutter/Dart) | Clean structure, tests, `flutter analyze` clean |
| Functionality | Matching logic, moves, restart, win state |
| Design / responsive | Mockup-style colors, grid, phone-friendly layout |

**Tip:** Demo on an Android emulator or real device—not web only—to avoid the “Chrome only” penalty.

## Author

Liang Mingchen — individual exercise submission.
