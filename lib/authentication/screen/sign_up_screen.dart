import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_app_mzizi/screens/home_page_screen.dart';
import '../../provider/auth_provider.dart';
import '../../screens/widgets/TextFormField.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailValid = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateEmail);
  }

  void validateEmail() {
    final email = emailController.text.trim();
    final isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    setState(() {
      emailValid = isValid;
    });
  }

  @override
  void dispose() {
    emailController.removeListener(validateEmail);
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<UserSignUpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Create an account',
                  style: GoogleFonts.dmSans(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Invest and double your income now',
                  style: GoogleFonts.openSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(height: 70),
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: nameController,
                      hintText: 'Full name',
                      inputType: TextInputType.text,
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      hintText: "Email address",
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return " Email required";
                        }
                        if (!emailValid) {
                          return "Enter valid Email address";
                        }
                        return null;
                      },
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 290,
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            hintText: "Password", border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                  width: 344,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (emailValid && nameController.text.isNotEmpty) {
                        setState(() {
                          isLoading =
                              true; // Set isLoading to true when button is pressed
                        });
        
                        authProvider
                            .signUp(emailController.text, passwordController.text,
                                nameController.text, context)
                            .then((_) {
                          authProvider.storeUserCredentials(emailController.text,
                              passwordController.text, nameController.text);
                          // Set isLoading to false when signup is successful
                          setState(() {
                            isLoading = false;
                          });
                        }).catchError((error) {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'An error occurred. Please try again.')));
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Please verify details')));
                      }
                      FocusScope.of(context).unfocus();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (!isLoading)
                          Text(
                            'Create account',
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        if (isLoading)
                          const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 30),
            Text(
              'Already have an account?',
              style: GoogleFonts.inter(
                  fontSize: 17, fontWeight: FontWeight.w600, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
