import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!value.contains("@")) {
                      return 'Harus dengan format @';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Masukkan email Anda',
                  ),
                ),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
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
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('SUBMIT'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('BACK'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
