import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _username = 'Pedro Santos'; // here!
String _appName = 'Friendly Chat';
bool _isDarkMode = false;

class ChatMessage extends StatelessWidget {
  ChatMessage(
      {Key key, @required this.text, @required this.animationController})
      //@required this.animationFade})
      : super(key: key);

  final String text;
  final AnimationController animationController;
  //final Animation animationFade;

  @override
  Widget build(BuildContext context) {
    //return FadeTransition(
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOutBack), // Curves.easeOut),
      axisAlignment: 0,
      //
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
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
            // because is a row child
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
                    child: Text(text), // here!
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  //with SingleTickerProviderStateMixin {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final FocusNode _focusNode = FocusNode();
  bool _isTexting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appName),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            icon: Icon(
              Icons.wb_incandescent,
              //size: 33,
            ),
            onPressed: _pushDarkToggle,
          )
        ],
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4,
      ),
      // body holds the list of incoming messages
      body: Container(
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey[200] /*!*/)) // nullable
                )
            : null,
        child: Column(
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
              color: Theme.of(context).accentColor,
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
      ),
    );
  }

  Widget buildTextComposer() {
    return IconTheme(
      data:
          IconThemeData(color: Theme.of(context).accentColor), // IconThemeData
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          // Using a Row allows you to place the Send button adjacent to the input field.
          child: Row(
            children: [
              //
              Flexible(
                child: TextField(
                  controller: _textController,
                  onChanged: (String text) {
                    // enables send button
                    setState(() {
                      _isTexting = text.isNotEmpty;
                    });
                  },
                  onSubmitted: _isTexting ? _handleSubmitted : null,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Send a message',
                  ),
                  focusNode: _focusNode,
                  cursorWidth: 3,
                  //keyboardType: , // ?
                  //obscureText: false,
                ),
              ),
              //
              // IconButton inside a Container lets you customize the margin spacing
              // of the button so that it visually fits better
              Container(
                margin: EdgeInsets.symmetric(horizontal: 1),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? CupertinoButton(
                        onPressed: _isTexting
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                        child: Text('Send'),
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.send_rounded,
                          size: 30,
                        ),
                        onPressed: _isTexting
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      ),
              ),
            ],
          )),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isTexting = false;
    });

    var message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 500), // too long duration!
        // The vsync is the source of heartbeats (the Ticker)
        // Implement interface TickerProviderStateMixin
        vsync: this,
      ),
      // animationFade = Tween(
      //     begin: 0,
      //     end: 1
      // ).animate(animationController);
    );

    setState(() {
      _messages.insert(0, message); // add first index
    });
    _focusNode.requestFocus();
    message.animationController.forward(); // start the animation
  }

  @override
  void dispose() {
    // It's good practice to dispose of your animation controllers
    // to free up your resources when they are no longer needed.
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  ThemeMode currentThemeMode() {
    //return ThemeMode.dark;
    return _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void _pushDarkToggle() {
    _isDarkMode = !_isDarkMode;
    print('Dark mode changed!');
  }
}
