import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//O objeto StatefulWidget é imutável, podendo ser descartado e gerado novamente,
// mas o objeto State persiste durante o ciclo de vida do widget.
class RandomWords extends StatefulWidget {
  const RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
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
        return _buildRow(_suggestions[index]);
      },
    );
  }

  _buildRow(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);

    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggestFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        // size: 15,
      ),
    );
  }
}
