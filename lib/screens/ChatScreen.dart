import 'package:chat_app/Chat/Message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter chat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                  value: "logout",
                  child: Container(
                    child: Row(children: [
                      const Icon(Icons.exit_to_app),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("logout")
                    ]),
                  ))
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == "logout") {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(children: [Expanded(child: Message())]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          FirebaseFirestore.instance
              .collection("chat")
              .add({"text": "this was added by me"});
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
