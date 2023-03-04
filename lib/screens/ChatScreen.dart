import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chats/2vDKciFOiNJVfH63WdQK/messages")
            .snapshots(),
        builder: (ctx, snapshot) {
          final documents = snapshot.data?.docs;
          return ListView.builder(
              itemCount: documents?.length,
              itemBuilder: (ctx, index) => Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(documents?[index]["text"]),
                  ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          FirebaseFirestore.instance
              .collection("chats/2vDKciFOiNJVfH63WdQK/messages")
              .add({"text": "this was added by me"});
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
