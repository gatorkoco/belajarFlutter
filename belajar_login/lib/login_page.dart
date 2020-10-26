import 'package:flutter/material.dart';
import 'package:belajar_login/register_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool isHidePassword = false;
  // final FocusNode _emailFocus = FocusNode();
  void passwordVisibility() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List();
    Widget buildBackground() => new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Icon(Icons.close, color: Colors.grey),
          ),
        );
    children.add(buildBackground());
    final logo = Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.contain,
                image: new AssetImage('assets/images/logo2.png'))),
      ),
    );
    final emailTxt = TextFormField(
        autofocus: false,
        // focusNode: _emailFocus,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            // contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            hintText: 'Masukan Email Anda',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5))));
    final passTxt = TextFormField(
        autofocus: false,
        obscureText: isHidePassword,
        initialValue: '',
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            // contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            hintText: 'Masukan Password Anda',
            suffixIcon: GestureDetector(
              onTap: () {
                passwordVisibility();
              },
              child: Icon(
                isHidePassword ? Icons.visibility_off : Icons.visibility,
                color: isHidePassword ? Colors.grey : Colors.black,
              ),
            ),
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5))));
    final forgotLabel = FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: null,
        child: Stack(
          children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Lupa Password?'),
              ),
            )
          ],
        ));
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
        child: MaterialButton(
          onPressed: null,
          minWidth: 200,
          height: 42,
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final daftarButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Belum Punya Akun ?',
          style: TextStyle(fontSize: 15.0),
        ),
        GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RegisterPage.tag);
            },
            child: Text(
              'Daftar',
              style: TextStyle(fontSize: 15.0, color: Colors.blue),
            ))
      ],
    );
    final widgets = Container(
      padding: EdgeInsets.all(15),
      child: Card(
        margin: EdgeInsets.fromLTRB(15, 150, 15, 15),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(25),
          children: <Widget>[
            logo,
            SizedBox(
              height: 20,
            ),
            emailTxt,
            SizedBox(
              height: 20,
            ),
            passTxt,
            forgotLabel,
            loginButton,
            daftarButton
          ],
        ),
      ),
    );
    children.add(widgets);
    return Scaffold(
      body: Stack(
        children: children,
      ),
    );
  }
}
