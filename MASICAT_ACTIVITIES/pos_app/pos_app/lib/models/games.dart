import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum GameCategory {
  fps,
  adventure,
  horror,
}

const categoryIcon = {
  GameCategory.fps: Icons.gamepad_rounded,
  GameCategory.adventure: Icons.forest_rounded,
  GameCategory.horror: Icons.groups_2_rounded,
};

class GameItem {
  GameItem({
    required this.title,
    required this.amount,
    required this.category,
    required this.image,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final GameCategory category;
  final String image;
}

class GameBucket {
  const GameBucket({
    required this.category,
    required this.games,
  });

  GameBucket.forCategory(List<GameItem> allGames, this.category)
    : games = allGames.where((game) => game.category == category).toList();

  final GameCategory category;
  final List<GameItem> games;

  double get totalAmount {
    double sum = 0;
    for (final game in games) {
      sum += game.amount;
    }
    return sum;
  }
}
