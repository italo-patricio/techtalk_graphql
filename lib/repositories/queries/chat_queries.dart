const String loadRoomsQuery = '''
  subscription loadRooms {
    chat_room {
      id
      title
      created_at
      enabled
    }
  }
''';
