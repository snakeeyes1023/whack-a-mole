class ScoreEntity {
  final int id;
  final String name;
  final int score;
  late DateTime creationDate;

  ScoreEntity(this.id, this.score,this.name) {
    creationDate = DateTime.now();
  }

  static ScoreEntity FromMap(Map<String, dynamic> map) {
    var entity = ScoreEntity(map['id'], map['score'],map['name']);
    entity.creationDate = DateTime.parse(map['creation_date']);

    return entity;
  }

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'creation_date': creationDate.toIso8601String(),
      'name': name,
      'score': score,
    };
  }

  @override
  String toString() {
    return 'ScoreEntity{id: $id, name:$name, score: $score, creation_date: $creationDate}';
  }
}