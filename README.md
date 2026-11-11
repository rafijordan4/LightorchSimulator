# Lightorch Simulator — Android Starter

Godot 4.4.1 / GDScript / 2D top-down pixel-art prototype.

## Development model
- Termux: edit text/source files and use Git only.
- GitHub: store the project.
- GitHub Actions: install Godot, export templates, Java and Android SDK, then build the APK in the cloud.
- Android phone: install and test the resulting APK. No Godot Editor or Android build toolchain is required on the phone.

## Current prototype
- Top-down rented room scene.
- Simple pixel-style player drawn in code.
- WASD/arrow-key movement for desktop preview.
- E key interaction with the computer.
- Basic day/money HUD.

## Build debug APK
1. Push this folder to a GitHub repository on branch `main`.
2. Open the repository's Actions tab.
3. Run `Lightorch Simulator - Android Debug APK` (also runs on pushes to `main`).
4. Download the `LightorchSimulator-Android-Debug` artifact from the completed workflow run.

The workflow builds on GitHub-hosted Ubuntu; it does not compile on the phone.

## Current limitations
This is an early foundation, not the complete game. Touch controls, intro sequence, player naming and name filter, missions, puzzle systems, employees, office upgrades, economy, save slots, and release signing still need implementation.

## Release builds
A release APK needs a private signing keystore. Do not commit the keystore or passwords into the repository. Configure GitHub Actions secrets before enabling release export.
