import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home_screen.dart';
import 'package:flutter_ecommerce_app/utils/color_utils.dart';
import 'package:flutter_ecommerce_app/widgets/register.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';

  const SignUpScreen({ Key? key }) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SignUpScreen(),
    );
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Registrarse',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),
          ],begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.12, 20, 0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    reusableTextField("Introduce un nombre", Icons.person_outline, false, _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Introduce un correo", Icons.person_outline, false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Introduce una contraseña", Icons.lock_outlined, true, _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    signInSignUpButton(context, false, () {

                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text)
                      .then((value) {
                        print("Nuevo usuario creado: ${_userNameTextController}");
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });

                    }),

                    
                  ],
                  
                ),
                
              ),
              
            ),
            Lottie.asset(
              'assets/images/animation.json',
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.scaleDown,
            ),
            SvgPicture.asset('assets/images/wave.svg',alignment: Alignment.bottomCenter,height: 223,),
          ],
        ),
      ),
    );
  }
  
}