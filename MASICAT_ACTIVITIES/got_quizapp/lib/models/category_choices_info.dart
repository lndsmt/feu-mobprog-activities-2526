class CategoryChoicesInfo {
  const CategoryChoicesInfo(this.categoryDescription, this.categoryItems);

  final String categoryDescription;
  final List<String> categoryItems;

  List<String> getShuffledList() {
    final List<String> shuffledList = List.of(categoryItems);
    shuffledList.shuffle();

    return shuffledList;
  }
}
