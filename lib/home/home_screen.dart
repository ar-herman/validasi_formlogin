import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Form"),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Name harus di isi!!!";
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Email harus di isi!!!";
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Password harus di isi!!!";
                  } else if (value.length < 5) {
                    return "Minimal 8 karakter";
                  }
                  return null;
                },
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (keyForm.currentState!.validate()) {}
                  // ignore: avoid_print
                  print(nameController.text);
                  // ignore: avoid_print
                  print(emailController.text);
                  // ignore: avoid_print
                  print(passwordController.text);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
