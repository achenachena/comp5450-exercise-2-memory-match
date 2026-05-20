# Memory Match (Exercise 2)

COMP5450 — Liang Mingchen

Flutter memory game for Exercise 2. The board is 4×5 (20 cards, 10 pairs). You flip two cards at a time and try to find matching animals. The layout follows the handout mockup: purple header, move count on the right, colorful card backs with `?`, and a Restart button at the bottom.

## What it does

- 4×5 grid, 10 pairs (emoji animals: 🦘🦓🐯🦁🐻🐼🦊🐵🐨🐧)
- Two flips per turn; matching cards stay up, wrong pairs flip back after a beat
- Move counter in the app bar
- “Find all matching pairs! 🐾” under the title
- Restart clears the board and reshuffles
- Small win dialog when you clear the board

Game state lives in memory only—no API or database.

## Tech

- Flutter / Dart
- `lib/game/memory_game.dart` — shuffle, match check, moves
- `lib/screens/memory_match_screen.dart` — UI
- `lib/widgets/memory_card_tile.dart` — card + flip animation
- `test/memory_game_test.dart` and `test/widget_test.dart`

## Project layout

```text
lib/
  main.dart
  models/memory_card_data.dart
  game/memory_game.dart
  screens/memory_match_screen.dart
  widgets/memory_card_tile.dart
test/
  widget_test.dart
  memory_game_test.dart
android/  ios/  web/   (platform folders from flutter create)
pubspec.yaml
README.md
README.pdf
screenshot-home.png
screenshot-play.png
```

## Setup

Install Flutter and the Android Studio Flutter plugin, then:

```bash
flutter doctor
cd exercise-2    # or wherever you cloned this repo
flutter pub get
```

Open the folder in Android Studio (the one with `pubspec.yaml`), pick an emulator or a plugged-in phone, and hit Run.

I usually test on the Android emulator; the rubric mentions a small penalty if you only show it in Chrome, and a small bonus if you demo on a real device.

## Run

```bash
flutter pub get
flutter run
```

Debug APK:

```bash
flutter build apk --debug
```

APK path: `build/app/outputs/flutter-apk/app-debug.apk`

Web (quick check only):

```bash
flutter run -d chrome
```

Before submit I ran:

```bash
flutter analyze
flutter test
```

## Screenshots

`README.pdf` has the screenshots required for the exercise. PNG copies are in the repo root:

- `screenshot-home.png`
- `screenshot-play.png`

## GitHub

https://github.com/achenachena/comp5450-exercise-2-memory-match

## Submit to D2L

Zip the project (Dart files, images, `README.pdf`). I keep a local copy as `MemoryMatch-Exercise2.zip` (not in git because of size).

## Notes

Individual exercise. If something does not run on your machine, start with `flutter doctor` and make sure a device or emulator is listed when you run `flutter devices`.
