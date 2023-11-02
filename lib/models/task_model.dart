class Todo {
  String judul;
  String detailtask;
  bool isCompleted;
  DateTime? completionDate;

  Todo({
    required this.judul,
    required this.detailtask,
    this.isCompleted = false,
    this.completionDate,
  });
}