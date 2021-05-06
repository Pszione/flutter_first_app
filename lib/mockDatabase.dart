import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<MockDatabase>((ref) => MockDatabase()); // static
const int waitFor = 3;

class MockDatabase{
  Future<String> getUserData(){
    return Future.delayed(Duration(seconds: waitFor), () {
      return 'Pedross';
    });
  }

  int fakeDatabase;

  Future<void> initDatabase() async{
    fakeDatabase = 0;
  }

  Future<int> increment() async{
    return Future.delayed(Duration(seconds: waitFor), () {
      return fakeDatabase = fakeDatabase + 1;
    });
  }

  Future<int> decrement() async{
    return Future.delayed(Duration(seconds: waitFor), () {
      return fakeDatabase = fakeDatabase > 0 ? fakeDatabase - 1 : 0;
    });
  }
}