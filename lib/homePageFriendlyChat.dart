import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendly Chat'),
      ),
      body: buildTextComposer(),
    );
  }

  Widget buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor), // IconThemeData
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          // Using a Row allows you to place the Send button adjacent to the input field.
          child: Row(
            children: [
              //
              Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Send a message',
                  ),
                  //keyboardType: , // ?
                  //obscureText: false,
                ),
              ),
              //
              // IconButton inside a Container lets you customize the margin spacing
              // of the button so that it visually fits better
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: () {
                    _handleSubmitted(_textController.text);
                  },
                ),
              ),
            ],
          )),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}
