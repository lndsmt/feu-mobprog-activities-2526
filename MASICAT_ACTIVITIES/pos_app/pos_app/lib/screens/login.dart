import 'package:flutter/material.dart';
import 'package:pos_app/screens/main_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class AppRegex {
  const AppRegex._();

  static final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$",
  );

  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$#!%*?&_])[A-Za-z\d@$#!%*?&_].{7,}$',
  );
}

class _LoginState extends State<Login> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  final String storedUsername = 'Admin';
  final String storedPassword = 'admin1234';

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateLogin() {
    final inputUsername = usernameController.text.trim();
    final inputPassword = passwordController.text.trim();

    if (inputUsername == storedUsername && inputPassword == storedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Login Failed!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            'Invalid Username or Password. Kindly check it again!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                'OK',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final loginForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          height: 50,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            controller: usernameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text(
                'Username',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: 400,
          height: 50,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              label: Text(
                'Password',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: 400,
          height: 50,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ElevatedButton(
            onPressed: validateLogin,
            child: const Text('Login'),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'LOGIN TO YOUR \nACCOUNT',
          style: TextStyle(fontSize: 34),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: screenWidth < 600
              ? loginForm
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [loginForm],
                ),
        ),
      ),
    );
  }
}
