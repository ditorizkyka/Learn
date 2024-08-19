part of 'pages.dart';

class AnonSignInPage extends StatelessWidget {
  const AnonSignInPage({super.key});

  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* TITLE
            Text(
              'SIGN IN ANONYMOUSLY',
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            //* SIGN IN STATUS
            // CODE HERE: Change status based on current user
            StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  // print(snapshot.data);
                  if (snapshot.hasData) {
                    return Text('You are signed in ${snapshot.data!.uid}');
                  } else {
                    return const Text("You haven't signed in yet");
                  }
                }),
            const SizedBox(height: 15),

            //* SIGN IN BUTTON
            ElevatedButton(
              onPressed: () async {
                User? user = await signInAnonymously();
                if (user != null) {
                  print("Signed in anonymously as: ${user.uid}");
                } else {
                  print("Failed to sign in anonymously");
                }
              },
              child: Text("Sign in Anonymously"),
            ),
          ],
        ),
      ),
    );
  }
}
