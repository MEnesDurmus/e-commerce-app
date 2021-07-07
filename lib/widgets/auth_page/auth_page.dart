import 'package:e_commerce_app/redux/store.dart';
import 'package:e_commerce_app/styles/app_text_styles.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

part 'forgot_password_widget.dart';
part 'log_in_widget.dart';
part 'sign_up_widget.dart';

const selectedTitle = titleStyle;
const unSelectedTitle = TextStyle(
    color: Color(0x44515c6f), fontSize: 30, fontWeight: FontWeight.bold);

class AuthPage extends StatelessWidget {
  static List<Widget> _widgetOptions = <Widget>[
    SignUpWidget(),
    LogInWidget(),
    ForgotPasswordWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Sign Up',
                            style: titleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Log In',
                            style: unSelectedTitle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Forgot Password',
                            style: unSelectedTitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _widgetOptions.elementAt(state.authState.authPage)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
