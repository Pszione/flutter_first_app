import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'package:flutter_first_app/riverpod_providers.dart';

class MySecondaryHomePage extends StatelessWidget {
  const MySecondaryHomePage({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Simplified')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Username'),
            // Consumer(
            //   builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
            //     watch is the key part of the builder
            //     return watch(userProvider).when(
            //       // .maybeWhen OR .maybeMap
            //       error: (Object error, StackTrace stackTrace) {
            //       // error: (AsyncError<String> value)
            //         return Text('Error');
            //       },
            //       loading: () {
            //         // loading: (AsyncLoading<String> value)
            //         return Text('Loading...'); // CircularProgressIndicator();
            //       },
            //       data: (String value) {
            //         // data: (AsyncData<String> value) then Text(value.value)
            //         return Text('SUCCESS!'); // return Text(value);
            //       },
            //     );
            //   },
            // ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'state counter',
            ),
            // Consumer(
            //   builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
            //     return Text('State: ' + watch(counterController).toString());
            //   },
            // ),
            const SizedBox(
              height: 100,
            ),
            const Text('Fake Database Counter'),
            // Consumer(
            //   builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
            //     watch is the key part of the builder
            //     return watch(counterAsyncController).when(
            //       data: (int value) {
            //         return Text('AsyncValue: ' + value.toString());
            //       },
            //       error: (Object error, StackTrace stackTrace){
            //         return Text('Error');
            //       },
            //       loading:(){
            //         return CircularProgressIndicator();
            //       },
            //     );
            //   },
            // ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                print('clicked! add');
                //context.read(counterController).add();
                //context.read(counterAsyncController).add();
              },
              child: const Text('Add'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                print('clicked! subtract');
                //context.read(counterController).subtract();
                //context.read(counterAsyncController).subtract();
              },
              child: const Text(
                'Subtract',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const TaskItem(
              label: 'Be handsome today!',
              checkValue: false,
            ),
            const TaskItem(
              label: 'Study hard to buy that Porsche!',
              checkValue: true,
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({Key key, @required this.label, @required this.checkValue})
      : super(key: key);

  final String label;
  final bool checkValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(onChanged: null, value: checkValue),
        Text(label),
      ],
    );
  }
}
