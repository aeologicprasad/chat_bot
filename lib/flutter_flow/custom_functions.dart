import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

List<dynamic> prepareChatHistory(
  List<dynamic> chats,
  String message,
) {
  chats.add({"role": "user", "content": message.trim()});
  return chats;
}

List<dynamic> refreshChatHistory(
  List<dynamic> chats,
  String message,
) {
  chats.add({"role": "assistant", "content": message});
  if (chats.length == 1) {
    chats.clear();
    chats.add({"role": "assistant", "content": message});
  }
  return chats;
}

dynamic generateAPIRequest(String message) {
  return {
    "model": "gpt-3.5-turbo",
    "messages": [
      {"role": "user", "content": message}
    ],
  };
}

dynamic prepareSavedChats(
  String title,
  String description,
  List<dynamic> chats,
) {
  dynamic savedChat = {
    "title": title,
    "description": description,
    "history": chats,
  };

  return savedChat;
}
