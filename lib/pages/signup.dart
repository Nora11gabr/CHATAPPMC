import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  String? Email;

  String? Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Form(
            child: ListView(
              children: [
                Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 33,
                  ),
                ),
                Center(
                  child: SvgPicture.asset(
                    "scr/main/res/Icons Assets/signup.svg",
                    height: 222,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(66),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Erorr';
                      }
                    },
                    onChanged: (data) {
                      Email = data;
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.purple[800],
                        ),
                        hintText: "Your Email :",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(66),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Erorr';
                      }
                    },
                    onChanged: (data) {
                      Password = data;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        suffix: Icon(
                          Icons.visibility,
                          color: Colors.purple[900],
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.purple[800],
                          size: 19,
                        ),
                        hintText: "Password :",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      var auth = FirebaseAuth.instance;
                      UserCredential user =
                          await auth.createUserWithEmailAndPassword(
                              email: Email!, password: Password!);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Success')));
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('The password provided is too weak.')));
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'The account already exists for that email.')));
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27))),
                  ),
                  child: Text(
                    "sign up",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an accout? "),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                Row(children: [
                  Expanded(
                      child: Divider(
                    height: 5,
                    thickness: 2,
                    color: Colors.purple[900],
                  )),
                  Text(
                    " OR ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Divider(
                    height: 5,
                    thickness: 2,
                    color: Colors.purple[900],
                  )),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.purpleAccent, width: 1)),
                        child: SvgPicture.asset(
                          "scr/main/res/Icons Assets/facebook.svg",
                          color: Colors.purpleAccent,
                          height: 15,
                        ),
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.purpleAccent, width: 1)),
                        child: SvgPicture.asset(
                          "scr/main/res/Icons Assets/google-plus.svg",
                          color: Colors.purpleAccent,
                          height: 15,
                        ),
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.purpleAccent, width: 1)),
                        child: SvgPicture.asset(
                          "scr/main/res/Icons Assets/twitter.svg",
                          color: Colors.purpleAccent,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ])
              ],
            ),
          ),
          Positioned(
              left: 0,
              child: Image.asset(
                "scr/main/res/Image Assets/signup_top.png",
                height: 222,
              )),
        ],
      ),
    ));
  }
}
