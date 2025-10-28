import 'package:flutter/material.dart';
import 'package:pertemuan4/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String nama;
  const HomeScreen({super.key, required this.nama});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _noTelpController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  final List<String> _noTelpList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                "Holla ${widget.nama}",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Form(
                key: _globalKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _noTelpController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          hintText: 'Masukkan nama',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          setState(() {
                            _noTelpList.add(_noTelpController.text);
                            _noTelpController.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Nomor telepon berhasil ditambahkan',
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              ListView.builder(
                shrinkWrap: true,
                itemCount: _noTelpList.length,
                itemBuilder: (context, index) {
                  return Text(_noTelpList[index]);
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
