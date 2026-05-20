# Exercise 2: Memory Matching Flutter Game

**Course:** COMP5450 / CS5450 Mobile Programming  
**Student:** Liang Mingchen  
**Instructor:** Dr. Sabah Mohammed  
**Type:** Individual exercise (30 points)

Flutter/Dart implementation of a **Memory Match** game with a **4×5 card grid** (10 animal pairs), matching the course mockup: purple title bar, move counter, colorful card backs with **?**, animal faces when flipped, and a **Restart** button.

## Assignment requirements (checklist)

| Requirement | Status |
|-------------|--------|
| 1. Flutter/Dart source code | Done |
| 2. `README.pdf` — configure, run, screenshots, exact project structure | Done (`README.pdf`) |
| 3. Public GitHub — full project | Done (link below) |
| 4. D2L ZIP — Dart files, images, `README.pdf` | Done (`MemoryMatch-Exercise2.zip`) |

## GitHub

https://github.com/achenachena/comp5450-exercise-2-memory-match

## Features (functional)

- **4 columns × 5 rows** = 20 cards, **10 pairs** of animals (emoji: 🦘🦓🐯🦁🐻🐼🦊🐵🐨🐧)
- Tap two cards per turn; **match** stays face-up, **mismatch** flips back after a short delay
- **Move counter** in the app bar (target-style badge, like the mockup)
- Subtitle: **Find all matching pairs! 🐾**
- **Restart** shuffles the deck and resets moves
- **Win dialog** when all pairs are found
- **3D flip animation** on cards

## Configure (first-time setup)

1. Install **Flutter SDK** (stable): https://docs.flutter.dev/get-started/install  
2. Install **Android Studio** (recommended) with Flutter and Dart plugins.  
3. Verify tooling:

```bash
flutter doctor
```

Fix any issues `flutter doctor` reports (Android licenses, Xcode for iOS, etc.).

4. Clone or download this project, then:

```bash
cd exercises/exercise-2   # or your clone path
flutter pub get
```

### Open in Android Studio

1. **File → Open** and select the `exercise-2` folder (project root with `pubspec.yaml`).  
2. Wait for **Pub get** / Gradle sync to finish.  
3. Choose a device (Android emulator, iOS simulator, or connected phone).  
4. Click **Run**.

> For grading: run on an **Android emulator** or **physical device**, not only Chrome, to avoid the rubric’s “web only” adjustment.

## Run

```bash
flutter pub get
flutter run
```

**Android APK (debug):**

```bash
flutter build apk --debug
# Output: build/app/outputs/flutter-apk/app-debug.apk
```

**Chrome (optional preview):**

```bash
flutter run -d chrome
```

## Exact project structure

```text
exercise-2/
├── lib/
│   ├── main.dart                         # App entry, theme, MaterialApp
│   ├── models/
│   │   └── memory_card_data.dart         # Card model (symbol, face state)
│   ├── game/
│   │   └── memory_game.dart              # Shuffle, flip logic, moves, win
│   ├── screens/
│   │   └── memory_match_screen.dart      # App bar, grid, restart, dialogs
│   └── widgets/
│       └── memory_card_tile.dart         # Card UI + flip animation
├── test/
│   ├── widget_test.dart                  # UI smoke tests
│   └── memory_game_test.dart             # Game logic unit tests
├── android/                              # Android host project (Gradle)
├── ios/                                  # iOS host project
├── web/                                  # Web host files
├── linux/ macos/ windows/                # Desktop host projects
├── pubspec.yaml                          # Dependencies & metadata
├── analysis_options.yaml                 # Linter rules
├── README.md                             # This file
├── README.pdf                            # Submission PDF (with screenshots)
├── screenshot-home.png                   # Screenshot: board face-down
├── screenshot-play.png                   # Screenshot: cards flipped
└── MemoryMatch-Exercise2.zip             # D2L package (generated locally)
```

**Dart source files (core logic):** all files under `lib/` and `test/` as listed above.

**Images in submission:** `screenshot-home.png`, `screenshot-play.png`, plus platform icons under `android/`, `ios/`, `web/`.

## Quality checks

```bash
flutter analyze    # no issues
flutter test       # widget + game logic tests
```

## Screenshots

Included in **README.pdf** and as PNG files in the project root:

- `screenshot-home.png` — home board with face-down cards  
- `screenshot-play.png` — gameplay with flipped animal cards  

## Grading rubric alignment (30 pts)

| Rubric area | How this project addresses it |
|-------------|-------------------------------|
| **Programming (Flutter/Dart)** | Layered `lib/` layout, unit + widget tests, clean `flutter analyze` |
| **Functionality (emulator/device)** | Full match flow, moves, restart, win; runs on Android/iOS |
| **App design & responsive UI** | Mockup-style colors, 4×5 grid, flip animation, centered layout on wide screens |

**Presentation:** Be ready to demo live in class (required for full marks).  
**Bonus (+2):** Demo on a **physical phone**.  
**Avoid (-2):** Chrome-only demo.

## Author

Liang Mingchen — individual work for Exercise 2.
