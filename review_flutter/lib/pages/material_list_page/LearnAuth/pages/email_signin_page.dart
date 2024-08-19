part of 'pages.dart';

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  Future<User?> SignIn(TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* TITLE
              Text(
                'SIGN IN WITH EMAIL/PASSWORD',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              //* SIGN IN STATUS
              // CODE HERE: Change status based on current user
              StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Text(
                          'You are signed in ${snapshot.data?.email.toString()}');
                    } else {
                      return const Text("You haven't signed in yet");
                    }
                  }),

              //* EMAIL TEXTFIELD
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: emailController,
                  cursorColor: Colors.orange,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Email'),
                ),
              ),

              //* PASSWORD TEXTFIELD
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: passwordController,
                  cursorColor: Colors.orange,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Password'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* SIGN UP BUTTON
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.orange.shade900)),
                        onPressed: () async {
                          // CODE HERE: Sign up with email & password / Sign out from firebase
                        },
                        // CODE HERE: Change button text based on current user
                        child: const Text("Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                  ),
                  const SizedBox(
                    width: 15,
                  ),

                  //* SIGN IN BUTTON
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.orange.shade900)),
                        onPressed: () async {
                          // CODE HERE: Sign in with email & password / Sign out form firebase
                          User? user =
                              await SignIn(emailController, passwordController);

                          if (user != null) {
                            print("Signed in as: ${user.email}");
                          } else {
                            print("Failed to sign in");
                          }
                        },
                        // CODE HERE: Change button text based on current user
                        child: StreamBuilder(
                            stream: FirebaseAuth.instance.userChanges(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Text("Sign Out",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ));
                              } else {
                                return Text("Sign In",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ));
                              }
                            })),
                  ),
                ],
              ),

              //* RESET PASSWORD BUTTON
              TextButton(
                  onPressed: () async {
                    // CODE HERE: Send reset code to the given email
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.orange.shade900),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orange.shade900,
        content: Text(message.toString())));
  }
}
