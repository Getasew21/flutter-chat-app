import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy("createdAt", descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = chatSnapshot.data?.docs;

        return ListView.builder(
            reverse: true,
            itemCount: chatDocs?.length,
            itemBuilder: (ctx, index) => Text(
                  chatDocs![index]["text"],
                ));
      },
    );
  }
}
