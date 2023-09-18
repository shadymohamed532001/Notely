import 'package:hive/hive.dart';

part 'NoteModel.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  String date;

  @HiveField(4)
  int color;

  NoteModel({
    required this.date,
    required this.color,
    required this.title,
    required this.subtitle,
  });
}
