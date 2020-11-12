class Story {
  String _sharedBy;
  String _sharedImageUrl;

  Story(String sharedBy, String sharedImageUrl) {
    this._sharedBy = sharedBy;
    this._sharedImageUrl = sharedImageUrl;
  }

  String get sharedImageUrl => _sharedImageUrl;

  String get sharedBy => _sharedBy;
}
