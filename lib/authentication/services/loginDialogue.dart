import 'package:flutter/material.dart';

Future<bool> showLoginDialog(context) async {
    
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Do you love cats?"),
        actions: [
          TextButton(
              child: Text("no", style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.pop(context, false);
              }),
          TextButton(
              child: Text("yes!", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.pop(context, true);
              })
        ],
      ),
    );
  }