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

const String loadRoomMessagesQuery = '''
  subscription loadRoomMessages(\$roomId: Int!) {
    chat_room_message(where:{
      chat_room_id:{_eq: \$roomId}
    }) {
      id
      message
      registered_at
      chat_user {
        id
        login
        online
      }
      chat_room {
        id
        title
        enabled
        created_at
      }
    }
  }
''';
