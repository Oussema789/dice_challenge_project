import 'package:hive/hive.dart';

part 'score.g.dart';

@HiveType(typeId: 2)
class Score {
  Score({
    required this.value,
});
  @HiveField(0)
  int value;

}

List <int> result = [0];