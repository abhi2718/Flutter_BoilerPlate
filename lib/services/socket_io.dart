import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io_client;

class SocketService with ChangeNotifier {
  final socket = socket_io_client.io('http://192.168.1.4:1010', {
    "transports": ['websocket'],
    "autoConnect": false,
  });
  void connect() {
    socket.connect();
    socket.onConnect((data) => print('connected'));
    socket.emit("join_room", "123");
    socket.on('receive_message', (data) {
      print(data);
    });
  }
}
