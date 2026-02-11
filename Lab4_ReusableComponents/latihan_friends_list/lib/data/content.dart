import '../models/contact_model.dart';
import '../models/message_model.dart';

final List<Contact> contacts = [
  Contact(
    name: 'Alice Johnson',
    avatarUrl:
        'https://ui-avatars.com/api/?name=Alice+Johnson&background=random&color=fff&size=150',
    lastMessage: 'Hey! How are you doing?',
    time: '10:30 AM',
    isOnline: true,
  ),
  Contact(
    name: 'Bob Smith',
    avatarUrl:
        'https://ui-avatars.com/api/?name=Bob+Smith&background=random&color=fff&size=150',
    lastMessage: 'See you tomorrow!',
    time: '9:15 AM',
    isOnline: false,
  ),
  Contact(
    name: 'Charlie Brown',
    avatarUrl:
        'https://ui-avatars.com/api/?name=Charlie+Brown&background=random&color=fff&size=150',
    lastMessage: 'Thanks for your help!',
    time: 'Yesterday',
    isOnline: true,
  ),
  Contact(
    name: 'Jeffrey Dahmer',
    avatarUrl:
        'https://ui-avatars.com/api/?name=Jeffrey+Dahmer&background=random&color=fff&size=150',
    lastMessage: 'That sounds great!',
    time: 'Yesterday',
    isOnline: false,
  ),
  Contact(
    name: 'Ethan Hunt',
    avatarUrl:
        'https://ui-avatars.com/api/?name=Ethan+Hunt&background=random&color=fff&size=150',
    lastMessage: 'Mission completed ✓',
    time: '2 days ago',
    isOnline: true,
  ),
];

Map<String, List<Message>> chatMessages = {
  'Alice Johnson': [
    Message(text: 'Hi there!', isSentByMe: false, time: '10:25 AM'),
    Message(text: 'Hello! How are you?', isSentByMe: true, time: '10:26 AM'),
    Message(
      text: 'I\'m doing great, thanks!',
      isSentByMe: false,
      time: '10:28 AM',
    ),
    Message(
      text: 'Hey! How are you doing?',
      isSentByMe: false,
      time: '10:30 AM',
    ),
  ],
  'Bob Smith': [
    Message(
      text: 'Are we meeting tomorrow?',
      isSentByMe: false,
      time: '9:10 AM',
    ),
    Message(text: 'Yes, at 3 PM', isSentByMe: true, time: '9:12 AM'),
    Message(text: 'See you tomorrow!', isSentByMe: false, time: '9:15 AM'),
  ],
  'Charlie Brown': [
    Message(
      text: 'Can you help me with this?',
      isSentByMe: false,
      time: '8:00 AM',
    ),
    Message(text: 'Sure! What do you need?', isSentByMe: true, time: '8:05 AM'),
    Message(text: 'Thanks for your help!', isSentByMe: false, time: '8:30 AM'),
  ],
  'Diana Prince': [
    Message(
      text: 'Let\'s grab lunch sometime',
      isSentByMe: true,
      time: '12:00 PM',
    ),
    Message(text: 'That sounds great!', isSentByMe: false, time: '12:15 PM'),
  ],
  'Ethan Hunt': [
    Message(
      text: 'Did you complete the task?',
      isSentByMe: true,
      time: '3:00 PM',
    ),
    Message(text: 'Mission completed ✓', isSentByMe: false, time: '3:30 PM'),
  ],
};
