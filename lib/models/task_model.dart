class Task {
  final String title;
  bool isSelected;
  bool isFavorite;

  Task({this.title, this.isSelected = false, this.isFavorite = false});

  void toggleSelected() {
    isSelected = !isSelected;
  }

  void toggleisFavored() {
    isFavorite = !isFavorite;
  }
}
