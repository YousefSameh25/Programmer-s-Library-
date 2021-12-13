import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:programer_library/UI/home_screen.dart';
import 'package:programer_library/UI/sign_up.dart';
import 'package:programer_library/database/database.dart';
import 'package:programer_library/theme/theme.dart';

// ignore: camel_case_types
class sign_in extends StatefulWidget {
  @override
  _sign_inState createState() => _sign_inState();
}

// ignore: camel_case_types
class _sign_inState extends State<sign_in> {
  var formkey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  var email_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  var password_controller = TextEditingController();

  AudioCache player = AudioCache();

  @override
  void initState() 
  {
    super.initState();
    create_database();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: appbar_color,
        title: Text(
          'Library',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/pictures/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image(
              image: AssetImage('assets/pictures/sign_in2.png'),
              height: 150,
              color: Colors.white,
            ),
            Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 50, 0),
                      child: TextFormField(
                        controller: email_controller,
                        style: TextStyle(color: Colors.white),
                        validator: (String value) {
                          if (value.isEmpty || !value.contains('@')) 
                          {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        cursorHeight: 23,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.red[900]),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.white),
                          ),
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 50, 0),
                      child: TextFormField(
                        controller: password_controller,
                        style: TextStyle(color: Colors.white),
                        validator: (String value)
                         {
                          if (value.isEmpty) 
                          {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        cursorHeight: 23,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.red[900]),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(hide_password
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                hide_password = !hide_password;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.white),
                          ),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: hide_password,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            Container(
              // ignore: deprecated_member_use
              child: RaisedButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    player.play('audio/sign_click.mp3');
                    get_data(
                            email: email_controller.text,
                            password: password_controller.text)
                        .then((value) 
                        {
                      if (value[0] != null)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => home_screen(),
                            ));
                    });
                    if (formkey.currentState.validate()) {
                      return;
                    }
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: button_color),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Does not have an account ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                  onPressed: () {
                    player.play('assets/audio/sign_click.mp3');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => sign_up(),
                        ));
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 15, color: button_color),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
