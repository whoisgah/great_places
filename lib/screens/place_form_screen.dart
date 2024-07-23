import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => PlaceFormScreenState();
}

class PlaceFormScreenState extends State<PlaceFormScreen> {
  
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if(_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

  Provider.of<GreatPlaces>(context, listen: false).addPlace(_titleController.text, _pickedImage!);

    Navigator.of(context).pop();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Novo Lugar'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ImageInput(_selectImage),
                    ],
                  ),
                ),
              ),
            ),
            TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Adicionar'),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.black,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: _submitForm,
            ),
          ],
        ));
  }
}
