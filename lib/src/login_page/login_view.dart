import 'package:bloc_project/global/custom_widgets/custom_snackbar.dart';
import 'package:bloc_project/global/routes/app_routes_name.dart';
import 'package:bloc_project/global/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global/custom_widgets/custom_loading_indicator.dart';
import '../../global/custom_widgets/custom_text_form_field.dart';
import 'login_bloc/login_bloc.dart';
import 'login_bloc/login_event.dart';
import 'login_bloc/login_state.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    debugPrint("Device Pixel Ratio: $devicePixelRatio");
    debugPrint("Device Height: $height");
    debugPrint("Device Width: $width");

    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) {
              return previous.isLoading != current.isLoading;
            },
            listener: (context, state) {
              print("Listener Loading");
              if (state.isLoading == true) {
                CustomLoadingIndicatorDialog.show(context);
              } else if (state.isLoading == false) {
                CustomLoadingIndicatorDialog.hide(context);
              }
            },
          ),
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) {
              return previous.isSubbmited != current.isSubbmited;
            },
            listener: (context, state) {
              print("Listener Snackbar");
              // TODO: implement listener
              if (state.isSubbmited == true) {
                customeSnackbar(context, state.message.toString(), true);
                Navigator.pushReplacementNamed(context, AppRoutesName.homePage);
              }
            },
          ),
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Page",
                style: TextStyle(fontSize: devicePixelRatio * 10),
              ),
              SizedBox(height: height / 20),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  debugPrint("state.emailValidation" +
                      state.emailValidation.toString());
                  return CustomTextFormField(
                    controller: emailController,
                    errorText: state.emailValidation,
                    labelText: "Email",
                    onChanged: (value) {
                      debugPrint("value" + value.toString());
                      BlocProvider.of<LoginBloc>(context)
                          .add(LoginEmailValidationEvent(value: value));
                    },
                  );
                },
              ),
              SizedBox(height: height / 40),
              Form(
                key: passwordFormKey,
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CustomTextFormField(
                      obscureText:
                          context.read<LoginBloc>().state.obscureTextPassword,
                      controller: passwordController,
                      labelText: "Password",
                      onChanged: (value) {
                        passwordFormKey.currentState!.validate();
                      },
                      validator: (value) {
                        return Validators().passwordValidation(value);
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginPasswordObsecureEvent(
                                  obscureTextPassword: context
                                      .read<LoginBloc>()
                                      .state
                                      .obscureTextPassword));
                        },
                        icon: state.obscureTextPassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height / 40),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text("Agree Conditions"),
                ],
              ),
              SizedBox(height: height / 40),
              ElevatedButton(
                onPressed: () {
                  // Ensure correct context is used
                  if (passwordFormKey.currentState!.validate() == true) {
                    BlocProvider.of<LoginBloc>(context)
                        .add(LoginButtonClickEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
