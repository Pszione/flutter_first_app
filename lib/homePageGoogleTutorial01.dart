import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// The object StatefulWidget is immutable, and can be discarded and then
// generated again. But the State data will persist through all widget cycle
class RandomWords extends StatefulWidget {
  const RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{}; // and empty list
  final _biggestFont = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(
    //   wordPair.asPascalCase,
    //   style: TextStyle(fontSize: 20),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name generator'),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            icon: Icon(
              Icons.playlist_add_check_rounded,
              size: 33,
            ),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return Divider(); // 1px

        // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
        // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
        // This calculates the actual number of word pairings
        // in the ListView,minus the divider widgets.
        final int index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); // add 10 more
        }
        return _buildRow(_suggestions[index], index);
      },
    );
  }

  _buildRow(WordPair wordPair, int index) {
    final alreadySaved = _saved.contains(wordPair);

    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggestFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        //color: alreadySaved ? Colors.red : null,
        color: alreadySaved ? Theme.of(context).colorScheme.secondary : null,
        size: 16,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
      onLongPress: () {
        setState(() {
          if (!alreadySaved) {
            _suggestions.removeAt(index);
            return; // setState will rebuild the widget without this list item
          }
        });
      },
    );
  }

  _pushSaved() {
    Navigator.of(context).push(
      // navigator works as a stack pile of widgets - push and pop
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          //
          final tiles = _saved.map(
            (WordPair wordPair) {
              return ListTile(
                title: Text(
                  wordPair.asPascalCase,
                  style: _biggestFont,
                ),
              );
            },
          );
          //
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          // rebuild widget
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }
}
