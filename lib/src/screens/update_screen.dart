//Create a screen that will display the elements of the selected score in highscore screen

import 'package:flutter/material.dart';
import 'package:wack_a_mole/src/data/entities/score_entity.dart';

class UpdateScreen extends StatefulWidget {
  final id;
  final String name;
  final score;

  UpdateScreen({required ScoreEntity scoreEntity})
      : id = scoreEntity.id,
        name = scoreEntity.name,
        score = scoreEntity.score;

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
                  Navigator.pop(context, {
                    'id': widget.id,
                    'name': _nameController.text,
                    'score': int.parse(_scoreController.text),
                  });
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