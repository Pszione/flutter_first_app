import 'package:flutter_first_app/mock_database.dart'; // simple_example
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

// static user state for the app
// we could use a StateNotifierProvider
final FutureProvider<String> userProvider =
    FutureProvider<String>((ProviderReference ref) async {
  return ref.read(databaseProvider).getUserData();
});

// static counter state notifier for the app
// Controller because you can actually control the data within here
// TODO: can not be Dynamic
final StateNotifierProvider<CounterNotifier, dynamic> counterController =
    StateNotifierProvider<CounterNotifier, dynamic>(
        (ProviderReference ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  int add() {
    return state = state + 1; // subclass
  }

  int subtract() {
    return state = state - 1; // subclass
  }
}

// async state notifier provider (for state that doesn't change in real time)
final StateNotifierProvider<CounterNotifierAsync, AsyncValue<int>>
    counterAsyncController =
    StateNotifierProvider<CounterNotifierAsync, AsyncValue<int>>(
        (ProviderReference ref) =>
            CounterNotifierAsync(ref.read /*(databaseProvider)*/));

class CounterNotifierAsync extends StateNotifier<AsyncValue<int>> {
  CounterNotifierAsync(this.read) : super(const AsyncLoading<int>()) {
    _init();
  }

  final Reader read;

  Future<void> _init() async {
    await read(databaseProvider).initDatabase();
    state = const AsyncData<int>(0);
  }

  Future<void> add() async {
    state = const AsyncLoading<
        int>(); // we are in a loading state until we get our response
    final int count = await read(databaseProvider).increment(); // subclass
    state = AsyncData<int>(count);
    // return state;
  }

  Future<void> subtract() async {
    state = const AsyncLoading<int>();
    final int count = await read(databaseProvider).decrement(); // subclass
    state = AsyncData<int>(count);
  }
}
