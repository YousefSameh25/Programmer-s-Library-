import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:programer_library/UI/sign_in.dart';
import 'package:programer_library/database/database.dart';
import 'package:programer_library/theme/theme.dart';

class sign_up extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  var name_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  var phone_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  var email_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  var password_controller = TextEditingController();
  AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar_color,
        title: Text(
          'Sign up',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/pictures/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
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
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 50, 0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          controller: name_controller,
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
                              Icons.person,
                              color: Colors.white,
                            ),
                            hintText: 'User Name',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 50, 0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                          controller: phone_controller,
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
                              Icons.call,
                              color: Colors.white,
                            ),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 50, 0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (String value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          controller: email_controller,
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
                          style: TextStyle(color: Colors.white),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          controller: password_controller,
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
                          obscureText: true,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                // ignore: deprecated_member_use
                child: RaisedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      player.play('audio/sign_click.mp3');
                      if (formkey.currentState.validate()) {
                        insert_to_database(
                            email: email_controller.text,
                            name: name_controller.text,
                            password: password_controller.text,
                            phone: phone_controller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => sign_in(),
                            ));
                      }
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    color: button_color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
