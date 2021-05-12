import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<MockDatabase> databaseProvider =
    Provider<MockDatabase>((ProviderReference ref) => MockDatabase()); // static
const int waitFor = 3;

class MockDatabase {
  Future<String> getUserData() {
    return Future<String>.delayed(const Duration(seconds: waitFor), () {
      return 'Pedro S';
    });
  }

  int fakeDatabase;

  Future<void> initDatabase() async {
    fakeDatabase = 0;
  }

  Future<int> increment() async {
    return Future<int>.delayed(const Duration(seconds: waitFor), () {
      return fakeDatabase = fakeDatabase + 1;
    });
  }

  Future<int> decrement() async {
    return Future<int>.delayed(const Duration(seconds: waitFor), () {
      return fakeDatabase = fakeDatabase > 0 ? fakeDatabase - 1 : 0;
    });
  }
}
