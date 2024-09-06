class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);

  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}

class UserProfile{
  final String profilePic;
  final String name;
  final String username;
  final String last;
  final String status;
  final String emoji;

  final List<int> stories;

  UserProfile(this.profilePic, this.name, this.username, this.last, this.status, this.stories, this.emoji);
}