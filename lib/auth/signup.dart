import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup extends StatefulWidget{
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  void initState()  {
    FirebaseAuth.instance.signOut();

  super.initState();
  }

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top:50, right:30, left:30),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    )
                  ),
                ),


                 Container(
                  margin: const EdgeInsets.only(top: 10),
                   child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      )
                    ),
                                   ),
                 ),

                       Container(
                        margin: const EdgeInsets.only(top: 10),
                         child: TextFormField(
                          controller: _password,
                                           decoration: InputDecoration(
                                             hintText: 'Password',
                                             contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                             filled: true,
                                             fillColor: Colors.grey[200],
                                             border: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(10),
                                               borderSide: const BorderSide(color: Colors.grey),
                                             ),
                                             enabledBorder: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(10),
                                               borderSide: const BorderSide(color: Colors.grey),
                                             )
                                           ),
                                         ),
                       ),
              ],
            ),
                 MaterialButton(
                  color: Colors.blue[400],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("Signup"),
                  onPressed: () async {
                   try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        // username: username,
                        email: _email.text,
                        password: _password.text,
                      );
                      Navigator.of(context).pushReplacementNamed('homePage');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      Navigator.of(context).pushReplacementNamed('login');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                  ),

                            MaterialButton(
                  color: Colors.blue[400],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("Sign In With google "),
                  onPressed: () {
                 signInWithGoogle();
                  }
                  ),

          
          ],
        ),
      ),
    );
  }
}