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
  //final _suggestions = <WordPair>[];
  //final _biggestFont = const TextStyle(fontSize: 22);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(
      wordPair.asPascalCase,
      style: TextStyle(fontSize: 20),
    );
  }
}
