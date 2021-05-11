import 'package:flutter_first_app/mock_database.dart'; // simple_example
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

// static user state for the app
// we could use a StateNotifierProvider
final userProvider = FutureProvider<String>((ref) async {
  return ref.read(databaseProvider).getUserData();
});

// static counter state notifier for the app
// Controller because you can actually control the data within here
final counterController =
    StateNotifierProvider<CounterNotifier, dynamic>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  int add() {
    state = state + 1; // subclass
    return state;
  }

  int subtract() {
    state = state - 1; // subclass
    return state;
  }
}

// async state notifier provider (for state that doesn't change in real time)
final counterAsyncController =
    StateNotifierProvider<CounterNotifierAsync, AsyncValue<int>>(
        (ref) => CounterNotifierAsync(ref.read /*(databaseProvider)*/));

class CounterNotifierAsync extends StateNotifier<AsyncValue<int>> {
  CounterNotifierAsync(this.read) : super(AsyncLoading()) {
    _init();
  }

  final Reader read;

  void _init() async {
    await read(databaseProvider).initDatabase();
    state = AsyncData(0);
  }

  void add() async {
    state =
        AsyncLoading(); // we are in a loading state until we get our response
    int count = await read(databaseProvider).increment(); // subclass
    state = AsyncData(count);
    // return state;
  }

  void subtract() async {
    state = AsyncLoading();
    int count = await read(databaseProvider).decrement(); // subclass
    state = AsyncData(count);
  }
}
