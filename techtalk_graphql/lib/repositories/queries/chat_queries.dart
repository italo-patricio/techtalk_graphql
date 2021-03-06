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

const String newUserMutation = r'''
  mutation newUser($name: String!) {
  insert_chat_user(objects:{
    login: $name
  } on_conflict:{
    constraint: chat_user_login_key,
    update_columns:[last_login_at]
  }){
    affected_rows
    returning{
      id
      login
      created_at
      online
    }
  }
}
''';

const String sendMessageMutation = r'''
mutation sendMessage($roomId: Int!, $userId: Int!, $message: String!){
  insert_chat_room_message(objects:{
    chat_room_id: $roomId,
    chat_user_id: $userId,
    message: $message
  }){
    affected_rows
  }
}
''';
