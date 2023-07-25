# Frontend of Smart Booking

## Project installation and run

Before start be sure that you have installed git, [Flutter](https://flutter.dev) sdk and `dart` and `flutter` commands are added to path.

1. Go to the root directory of the project
```console
cd frontend
```

2. Get all dependencies
```console
dart pub get
```

3. Add `.env` file to root project directory with the following content:
```
RPC_URL=https://goerli.infura.io/v3/<YOUR_API_KEY_TO_NODE>
CONTRACT_ADDRESS=<ADDRESS_OF_CONTRACT>
```

4. Run codegen command:
```console
dart run build_runner build --delete-conflicting-outputs
```

6. Run project
```console
flutter run --target lib/main_development.dart
```
