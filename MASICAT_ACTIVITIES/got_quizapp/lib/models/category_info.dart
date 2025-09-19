class CategoryInfo {
  const CategoryInfo(this.infoDescription, this.infoItems, this.correctAnswer);

  final String infoDescription;
  final List<String> infoItems;
  final String correctAnswer;

  List<String> getShuffledList() {
    final List<String> shuffledList = List.of(infoItems);
    shuffledList.shuffle();

    return shuffledList;
  }
}
