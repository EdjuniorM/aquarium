import 'package:aquarium/app/interactor/user/actions/auth_action.dart';
import 'package:aquarium/app/interactor/user/atoms/auth_atoms.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!authState.value) 
                  ElevatedButton(
                    onPressed: () async {
                      await createUser(); 
                    },
                    child: const Text('Sign in with Google'),
                  )
                else
                  Column(
                    children: [
                      const Text('Você está logado!'),
                      ElevatedButton(
                        onPressed: () async {
                          await signOut();
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}