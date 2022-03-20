import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/utils/color_utils.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signin';

  const SignInScreen({ Key? key }) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SignInScreen(),
    );
  }


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController _passwordTextController = TextEditingController();
TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),
          ], begin: Alignment.topCenter,end: Alignment.bottomCenter)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("assets/images/user.png"),
              SizedBox(
                height: 50,
              ),
              reusableTextField("Nombre de usuario", Icons.person_outline, false, _emailTextController),
              SizedBox(
                height: 50,
              ),
              reusableTextField("Contraseña", Icons.lock_outlined, true, _passwordTextController),       
              SizedBox(
                height: 30,
              ),
              signInSignUpButton(context, true, () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text
                  ).then((value) {
                    //Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
                    Navigator.pushNamedAndRemoveUntil(context, '/',(Route<dynamic> route) => false);
                    print(value.user!.email);
                  });
                } on FirebaseAuthException catch  (e) {
                  final snackBar = SnackBar(
                    content: Text('Usuario o contraseña incorrectos!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  print('Failed with error code: ${e.code}');
                  print(e.message);
                }
              }),
              signUpButton(),
            ],
          ),
            ),
          ),
        ),
    );
  }

  Row signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tienes cuenta?", style: TextStyle(color: Colors.white70, fontSize: 20)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Registrarse",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}