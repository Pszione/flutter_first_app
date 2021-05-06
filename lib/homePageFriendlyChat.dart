import 'package:flutter/material.dart';

String _username = 'Pedro Santos'; // here!

class ChatMessage extends StatelessWidget {
  ChatMessage({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              child: Text(_username[0]),
            ),
          ),
          //
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _username,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(text),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendly Chat'),
      ),
      // body holds the list of incoming messages
      body: Column(
        children: [
          //
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              reverse: true, // interesting!
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          //
          Divider(
            height: 1,
            thickness: 2,
          ),
          //
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: buildTextComposer(), // here!
          ),
        ],
      ),
    );
  }

  Widget buildTextComposer() {
    return IconTheme(
      data:
          IconThemeData(color: Theme.of(context).accentColor), // IconThemeData
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
                  focusNode: _focusNode,
                  //keyboardType: , // ?
                  //obscureText: false,
                  cursorWidth: 3,
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
    var message = ChatMessage(
      text: text,
    );

    setState(() {
      _messages.insert(0, message); // add first index
    });
    _focusNode.requestFocus();
  }
}
