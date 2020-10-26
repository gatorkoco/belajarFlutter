import 'package:flutter/material.dart';
import 'package:belajar_login/login_page.dart';
class RegisterPage extends StatefulWidget {
  static String tag = 'register-page';
  @override
  State<StatefulWidget> createState() {
    return new RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  bool isHidePassword = false;

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
            leading: Icon(
              Icons.close,
              color: Colors.grey,
            ),
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
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            hintText: 'Email',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5))));
    final usernameTxt = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_outline),
          hintText: 'Username',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
    final passTxt = TextFormField(
      autofocus: false,
      obscureText: isHidePassword,
      initialValue: '',
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          hintText: 'Kata Sandi',
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
    final confirmPassTxt = TextFormField(
      autofocus: false,
      obscureText: isHidePassword,
      initialValue: '',
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          hintText: 'Konfirmasi Kata Sandi',
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
    final daftarButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
        child: MaterialButton(
          onPressed: null,
          minWidth: 200,
          height: 42,
          child: Text('Daftar', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final loginButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sudah Punya Akun ?',
          style: TextStyle(fontSize: 15.0),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(LoginPage.tag);
          },
          child: Text(
            'Masuk',
            style: TextStyle(fontSize: 15.0,color: Colors.blue)
          ),
        )
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
            usernameTxt,
            SizedBox(
              height: 20,
            ),
            passTxt,
            SizedBox(
              height: 20,
            ),
            confirmPassTxt,
            SizedBox(
              height: 20,
            ),
            daftarButton,
            loginButton
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
