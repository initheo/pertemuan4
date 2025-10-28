import 'package:flutter/material.dart';
import 'package:pertemuan4/home_screen.dart';
import 'package:pertemuan4/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _namaCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan nama Anda',
                      icon: Icon(Icons.person),
                    ),
                  ),

                  TextFormField(
                    controller: _passwordCtr,
                    obscureText: _isObscureText,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Masukkan password Anda',
                      icon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscureText = !_isObscureText;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(nama: _namaCtr.text),
                            ),
                          );
                        }
                      },
                      child: const Text('SUBMIT'),
                    ),
                  ),

                  SizedBox(height: 30),

                  const Text("Ini Halaman Login"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(nama: _namaCtr.text),
                        ),
                      );
                    },
                    child: const Text("To Home"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text("To Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
