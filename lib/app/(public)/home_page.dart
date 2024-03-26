import 'package:aquarium/app/interactor/user/actions/auth_action.dart';
import 'package:aquarium/app/interactor/user/atoms/auth_atoms.dart';
import 'package:asp/asp.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getDataUser().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userAuth = FirebaseAuth.instance.currentUser;

    return RxBuilder(
      builder: (_) {
         if (isLoading) {
        return Scaffold(
          appBar: AppBar(title: const Text('HomePage')),
          body: const Center(child: CircularProgressIndicator()),
        );
      }
        final user = userState.value;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Olá ${user?.name}!, Esse é seu Guia aquaristico',
              style: TextStyle(fontSize: 18),
              
              ),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Nome: ${user?.name}'),
              Text('Idade: ${user?.age}'),
            ],
          )),
          
        );
      },
    );
  }
}
