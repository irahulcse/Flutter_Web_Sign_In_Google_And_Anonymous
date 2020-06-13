import 'package:flutter/material.dart';
import 'package:flutter_web_demo/ui/views/authentication/sign_in/sign_in_view_model.dart';
import 'package:flutter_web_demo/ui/views/authentication/sign_in/widgets/anonymous_sign_in_button.dart';
import 'package:flutter_web_demo/ui/views/authentication/sign_in/widgets/google_sign_in_button.dart';
import 'package:provider/provider.dart';

import 'app/constants/strings.dart';


class SignInView extends StatelessWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(context.read),
      builder: (_, child) {
        return const Scaffold(
          body: SignInViewBody._(),
        );
      },
    );
  }
}

class SignInViewBody extends StatelessWidget {
  const SignInViewBody._({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((SignInViewModel viewModel) => viewModel.isLoading);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              Strings.signInMessage,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: isLoading ? _loadingIndicator() : _signInButtons(context),
          ),
        ],
      ),
    );
  }

  Center _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Column _signInButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const AnonymousSignInButton(),
        const GoogleSignInButton(),
        const Spacer(),
      ],
    );
  }
}
