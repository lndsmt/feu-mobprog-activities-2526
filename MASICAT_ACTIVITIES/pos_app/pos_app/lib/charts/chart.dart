import 'package:flutter/material.dart';
import 'package:pos_app/charts/chart_bar.dart';
import 'package:pos_app/models/games.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.game,
  });

  final List<GameItem> game;

  List<GameBucket> get buckets {
    return [
      GameBucket.forCategory(game, GameCategory.fps),
      GameBucket.forCategory(game, GameCategory.adventure),
      GameBucket.forCategory(game, GameCategory.horror),
    ];
  }

  double get maxTotalExpense {
    double maxTotalAmount = 0;

    for (final bucket in buckets) {
      if (bucket.totalAmount > maxTotalAmount) {
        maxTotalAmount = bucket.totalAmount;
      }
    }
    return maxTotalAmount;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalAmount == 0
                        ? 0
                        : bucket.totalAmount / maxTotalExpense,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: buckets
                .map(
                  (buckets) => Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 4,
                      ),
                      child: Icon(
                        categoryIcon[buckets.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
