import 'dart:async';

import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  @override
  _MessageBoxState createState() => _MessageBoxState();

  final String msg;
  final String owner;

  const MessageBox({Key key, this.msg, this.owner}) : super(key: key);
}

class _MessageBoxState extends State<MessageBox> {
  bool writing = true;

  @override
  initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      setState(() {
        writing = false;
      });
    });
  }

  Image avatar({String owner}) {
    return owner == 'user'
        ? Image(
            image: AssetImage('assets/small/robot.png'),
          )
        : null;
  }

  Container message({BuildContext context, String msg, String owner}) {
    return Container(
      alignment: owner == 'user' ? Alignment.bottomRight : Alignment.bottomLeft,
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          avatar(owner: owner),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                child: Text(
                  msg,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Container messageLoading({String owner}) {
    return Container(
      alignment: owner == 'user' ? Alignment.bottomRight : Alignment.bottomLeft,
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.70,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(21),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
              child: Image.asset(
                "assets/original/loading-message.gif",
                height: 125.0,
                width: 125.0,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return writing
        ? messageLoading(owner: widget.owner)
        : message(context: context, msg: widget.msg, owner: widget.owner);
  }
}
