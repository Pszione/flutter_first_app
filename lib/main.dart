import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_first_app/riverpodProviders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke "hot reload"
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        textTheme: TextTheme(
          headline1: TextStyle(),
          headline4: GoogleFonts.lobster(color: Colors.redAccent, letterSpacing: 2,),
          bodyText2: TextStyle(fontSize: 18),
          subtitle1: TextStyle(fontStyle: FontStyle.italic, color: Color(0xFF00FF00),),
        ),
        accentIconTheme: IconThemeData(
          size: 33,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //primarySwatch: Colors.amber, // 0xFFFFC107
        //primarySwatch: MaterialColor(0xFFFFC107, {50: Color(), 100: Color()},),
        primaryColor: Color(0xFFFFC107), // let Material create all other variants
        accentColor: Color(0xFFFFFFFF), // 0xFF + copy HEX then (688e26)
      ),
      home: MyHomePage(title: 'Flutter First App'),
      //home: MySecondaryHomePage(title: 'Riverpod Simplified',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Like tapped $_counter times!',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 25,),
            Text(
              'another random text rs',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            // Text(
            //   'You have pushed the button this many times:',
            //   style: Theme.of(context).textTheme.subtitle1,
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline3,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(
          Icons.favorite,
          size: Theme.of(context).accentIconTheme.size,
          color: Colors.red,
        ),
      ),
      backgroundColor: Colors.black54,
    );
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
}

class MySecondaryHomePage extends StatelessWidget{
  MySecondaryHomePage({this.title});

  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Riverpod Simplified')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username'),
            Consumer(
              builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                // watch is the key part of the builder
                return watch(userProvider).when(
                  // .maybeWhen OR .maybeMap
                  error: (Object error, StackTrace stackTrace) {
                  // error: (AsyncError<String> value)
                    return Text('Error');
                  },
                  loading: () {
                    // loading: (AsyncLoading<String> value)
                    return Text('Loading...'); // CircularProgressIndicator();
                  },
                  data: (String value) {
                    // data: (AsyncData<String> value) then Text(value.value)
                    return Text('SUCCESS!'); // return Text(value);
                  },
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
            Text('state counter',),
            Consumer(
              builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                return Text('State: ' + watch(counterController).toString());
              },
            ),
            SizedBox(
              height: 100,
            ),
            Text('Fake Database Counter'),
            // Consumer(
            //   builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
            //     // watch is the key part of the builder
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
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                print('clicked!');
                context.read(counterController).add();
                //context.read(counterAsyncController).add();
              },
              child: Text('Add'),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                print('clicked');
                context.read(counterController).subtract();
                //context.read(counterAsyncController).subtract();
              },
              child: Text('Subtract',),
            ),
            SizedBox(
              height: 40,
            ),
            TaskItem(
              label: 'Be handsome today!',
              checkValue: false,
            ),
            TaskItem(
              label: 'Study hard to buy that Porsche!',
              checkValue: true,
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget{
  const TaskItem({Key key, @required this.label, @required this.checkValue}) : super(key: key);

  final String label;
  final bool checkValue;

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Checkbox(onChanged: null, value: checkValue),
        Text(label),
      ],
    );
  }
}
