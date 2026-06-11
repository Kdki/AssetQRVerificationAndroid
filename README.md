# Asset QR Verifier Android App

This Android Studio project verifies assets using the mobile phone camera instead of external QR scanner hardware.

## Main features

- Uses the Android mobile camera to scan QR codes and common barcodes.
- Matches scanned values against the embedded master Excel file: `asset_master.xlsx`.
- Checks these columns: `Asset Number`, `Serial Number`, and `OldAssetNo`.
- Shows asset details immediately after scan.
- Stores verified assets in memory during the session.
- Exports verified assets to a new `.xlsx` file with `Scanned QR Value` and `Verified DateTime` columns.

## Build instructions

1. Open this folder in Android Studio.
2. Allow Gradle sync to download the ZXing camera scanner dependency.
3. Build the APK from **Build > Build Bundle(s) / APK(s) > Build APK(s)**.
4. Install the APK on an Android phone.
5. Grant camera permission when prompted.

## Usage

1. Open the app.
2. Tap **Camera Scan QR Code**.
3. Point the phone camera at the asset QR code.
4. If the scanned value matches the master list, the asset is added to the verified list.
5. Tap **Save Verified Assets to Excel** to create the verified Excel file.

The exported file is saved inside the app's external documents folder under `AssetVerifier`.