const String loadRoomsQuery = '''
  query loadRooms {
    chat_room {
      id
      title
      created_at
      enabled
    }
  }
''';

const String loadRoomMessagesQuery = r'''
  subscription loadRoomMessages($roomId: Int!) {
    chat_room_message(where:{
      chat_room_id:{_eq: $roomId}
    } order_by:{registered_at:desc}) {
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
