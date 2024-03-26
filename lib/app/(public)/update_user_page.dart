import 'package:aquarium/app/interactor/user/actions/auth_action.dart';
import 'package:aquarium/app/interactor/user/models/update_user_model.dart';
import 'package:flutter/material.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar Usuário'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua idade';
                  }
                  return null;
                },
                onSaved: (value) => _age = int.tryParse(value ?? '0') ?? 0,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updateUserModel = UpdateUserModel(name: _name, age: _age);
                    createDataUser(updateUserModel);
                    // Aqui você pode adicionar uma lógica para feedback ao usuário
                  }
                },
                child: const Text('Atualizar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}