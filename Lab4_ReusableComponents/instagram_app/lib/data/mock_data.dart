import '../models/chat_model.dart';

// Mock users for stories and chats
final List<User> users = [
  User(
    username: 'jesslynelvi...',
    fullName: 'Jesslyn Elvis',
    profileImage: '👩',
    hasStory: true,
  ),
  User(
    username: 'dmrhdz.iq',
    fullName: 'Damar Hadziq',
    profileImage: '🧑',
    hasStory: true,
  ),
  User(
    username: 'george.ru...',
    fullName: 'George Russell',
    profileImage: '👨',
    hasStory: true,
  ),
  User(
    username: 'lbjcute23',
    fullName: 'Lebron James',
    profileImage: '🏃',
    hasStory: false,
  ),
  User(
    username: 'jlopez',
    fullName: 'Jennifer Lopez',
    profileImage: '🎬',
    hasStory: false,
  ),
  User(
    username: 'grup remaja wihara',
    fullName: 'Grup Remaja Wihara',
    profileImage: '👥',
    hasStory: false,
  ),
  User(
    username: 'Ngawi Grup',
    fullName: 'Masyarakat Ngawi',
    profileImage: '🏘️',
    hasStory: false,
  ),
  User(
    username: 'selenagamis',
    fullName: 'Selena Gamis',
    profileImage: '🌊',
    hasStory: false,
  ),
];

// Story users (first 5 users including "Your story")
final List<User> storyUsers = [
  User(
    username: 'Your story',
    fullName: 'Your Story',
    profileImage: '📷',
    hasStory: false,
  ),
  ...users.sublist(0, 4),
];

// Mock posts for homepage
final List<Post> posts = [
  Post(
    user: users[3], // lbjcute23
    postImage: 'assets/images/images.jpg',
    likes: 129,
    caption: 'peace of mind.',
    timeAgo: '13 hours ago',
  ),
  Post(
    user: users[4], // jlopez
    postImage: '🎥',
    likes: 2453,
    caption: 'Check out this amazing content!',
    timeAgo: '1 day ago',
  ),
  Post(
    user: users[1], // dmrhdz.iq
    postImage: '🏎️',
    likes: 892,
    caption: 'Speed is everything 🔥',
    timeAgo: '2 days ago',
  ),
  Post(
    user: users[0], // jesslynelvi
    postImage: '☕',
    likes: 567,
    caption: 'Coffee time ☀️',
    timeAgo: '3 days ago',
  ),
];

// Mock chats for direct messages
final List<Chat> chats = [
  Chat(
    user: users[5],
    lastMessage: 'Aga sent an attachment.',
    time: '6h',
    hasAttachment: true,
  ),
  Chat(
    user: users[6],
    lastMessage: 'Felix sent an attachment.',
    time: '6h',
    hasAttachment: true,
  ),
  Chat(
    user: users[7],
    lastMessage: 'You sent an attachment.',
    time: '16h',
    hasAttachment: true,
  ),
  Chat(
    user: User(
      username: 'Jonathan Olivier',
      fullName: 'Jonathan Olivier',
      profileImage: '👔',
    ),
    lastMessage: 'Halo Vincent Salam kenal ya! Saya sem...',
    time: '22h',
  ),
  Chat(
    user: User(username: 'nuthun', fullName: 'Nathan', profileImage: '🎸'),
    lastMessage: 'You: nohohoho',
    time: '2d',
  ),
];

// Mock messages for detail chat - Different conversations for each user
final Map<String, List<Message>> userMessages = {
  'grup remaja wihara': [
    Message(
      sender: 'grup remaja wihara',
      message: 'Aga sent an attachment.',
      time: '6h',
      isSent: false,
    ),
    Message(
      sender: 'You',
      message: 'Nice! Thanks for sharing',
      time: '',
      isSent: true,
    ),
    Message(
      sender: 'grup remaja wihara',
      message: 'See you at the event tomorrow! 🙏',
      time: '',
      isSent: false,
    ),
    Message(
      sender: 'You',
      message: 'Yes, will be there early!',
      time: '',
      isSent: true,
    ),
  ],
  'Ngawi Grup': [
    Message(
      sender: 'Ngawi Grup',
      message: 'Felix sent an attachment.',
      time: 'Yesterday',
      isSent: false,
    ),
    Message(sender: 'You', message: 'Looking good!', time: '', isSent: true),
    Message(
      sender: 'Ngawi Grup',
      message: 'Meeting at 3 PM today, don\'t forget!',
      time: '',
      isSent: false,
    ),
    Message(
      sender: 'Ngawi Grup',
      message: 'We\'ll discuss the new project',
      time: '',
      isSent: false,
    ),
  ],
  'selenagamis': [
    Message(
      sender: 'You',
      message: 'You sent an attachment.',
      time: '16h',
      isSent: true,
    ),
    Message(
      sender: 'selenagamis',
      message: 'Wow, beautiful photo! 📸',
      time: '',
      isSent: false,
    ),
    Message(
      sender: 'You',
      message: 'Thank you! You beautiful too 😊',
      time: '',
      isSent: true,
    ),
    Message(
      sender: 'selenagamis',
      message: 'hoho, makasih om!',
      time: '',
      isSent: false,
    ),
    Message(sender: 'You', message: 'xixixi', time: '', isSent: true),
  ],
  'Jonathan Olivier': [
    Message(
      sender: 'Jonathan Olivier',
      message: 'Halo Vincent Salam kenal ya! Saya semester berapa sekarang?',
      time: '22h',
      isSent: false,
    ),
    Message(
      sender: 'You',
      message: 'Kok nanya gw bang',
      time: '',
      isSent: true,
    ),
    Message(
      sender: 'Jonathan Olivier',
      message: 'Oh nice! Same here 😊',
      time: '',
      isSent: false,
    ),
    Message(sender: 'You', message: 'Gak nyambung woy', time: '', isSent: true),
    Message(
      sender: 'Jonathan Olivier',
      message: 'Definitely! Let me know when you\'re free',
      time: '',
      isSent: false,
    ),
  ],
  'nuthun': [
    Message(
      sender: 'nuthun',
      message: 'Hey bro, main game yuk malam ini?',
      time: '2d',
      isSent: false,
    ),
    Message(sender: 'You', message: 'nohohoho', time: '', isSent: true),
    Message(
      sender: 'nuthun',
      message: 'Ayolah, bentar aja 😂',
      time: '',
      isSent: false,
    ),
    Message(
      sender: 'You',
      message: 'Okay fine, jam 8 ya',
      time: '',
      isSent: true,
    ),
    Message(
      sender: 'nuthun',
      message: 'Siap! I\'ll invite the squad',
      time: '',
      isSent: false,
    ),
  ],
};

// Helper function to get messages for a user
List<Message> getMessagesForUser(String username) {
  return userMessages[username] ?? [];
}
