import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:edcapp/app/sign_in/sign_in_button.dart';
import 'package:edcapp/app/sign_in/social_sign_in_button.dart';
import 'package:edcapp/custom_widgets/custom_raised_button.dart';
import 'package:edcapp/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    required Key key,
    required this.auth,
    required this.onSignIn,
  }) : super(key: key);
  final void Function(User) onSignIn;
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      final user = await auth.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[400],
    );
  }

  @override
  Widget _buildContent() {
    return Padding(
      //color: Colors.orange,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'images/images/edc-logo.png',
            width: 200,
            height: 200,
          ),
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          SocialSignInButton(
            assetName: 'images/images/google-logo.png',
            text: 'sign in with google',
            textColor: Colors.black87,
            color: Colors.white,
            //borderRadius: 4.0,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: 'images/images/facebook-logo.png',
            text: 'sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Go annonymous',
            textColor: Colors.white,
            color: Colors.lime[700],
            onPressed: _signInAnonymously,
          ),
          // CustomRaisedButton(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Image.asset('images/images/google-logo.png'),
          //       Text(
          //         'sign in with Google',
          //       ),
          //       Opacity(
          //         opacity: 0.0,
          //         child: Image.asset('images/images/google-logo.png'),
          //       ),
          //     ],
          //   ),
          //   color: Colors.white,
          //   onPressed: () {},
          // )
        ],
      ),
    );
  }
}
