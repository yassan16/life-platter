/// 作った料理のエンティティ
class Cooking {
  final String id;
  final String? userId;
  // 料理名
  final String name;
  // 料理の種類
  final String category;
  // 食材id
  final List<String>? ingredientIds;
  // 調理手法id
  final List<String>? cookingMethodIds;
  // 料理の写真URL
  final List<String>? imageUrlList;
  // 詳細
  final String? description;
  // コメント
  final String? comment;
  // 作った日付
  final DateTime madeDateTime;

  Cooking({
    required this.id,
    this.userId,
    required this.name,
    required this.category,
    this.ingredientIds,
    this.cookingMethodIds,
    this.imageUrlList,
    this.description,
    this.comment,
    required this.madeDateTime,
  });

  /// 開発用のダミーデータを生成
  static createDuumyData() {
    return Cooking(
      id: '0001',
      name: 'ダミー料理',
      category: 'ダミーカテゴリー',
      madeDateTime: DateTime.now(),
    );
  }
}
