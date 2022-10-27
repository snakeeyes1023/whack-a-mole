import 'package:flutter/material.dart';
import 'package:wack_a_mole/src/data/entities/score_entity.dart';
import 'package:wack_a_mole/src/data/services/score_services.dart';

class UpdateScreen extends StatefulWidget {
  final id;
  final String name;
  final score;

  UpdateScreen({required ScoreEntity scoreEntity})
      : id = scoreEntity.id,
        name = scoreEntity.name,
        score = scoreEntity.score;

        final dbHelper = ScoreService();

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _scoreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _scoreController.text = widget.score.toString();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Score'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _scoreController,
              decoration: InputDecoration(
                labelText: 'Score',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a score';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.dbHelper.updateScore(ScoreEntity(widget.id, int.parse(_scoreController.text), _nameController.text));
                  Navigator.pop(context, {});
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}