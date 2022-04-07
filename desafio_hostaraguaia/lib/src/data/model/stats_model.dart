import 'stat_model.dart';

class StatsModel{
  final int? baseStat;
  final int? effort;
  final StatModel? stat;

  StatsModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  static StatsModel fromJson(Map<String, dynamic> json) {
    return StatsModel(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: StatModel.fromJson(json['stat']),
    );
  }
}
