import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
		MaterialApp(
    	title: "Login",
      debugShowCheckedModeBanner: false,
    	theme: ThemeData(
      	// primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
    	),
    	home: const HomePage(),
  	)
	);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: const TextStyle(
					fontSize: 24,
					fontWeight: FontWeight.bold
				),
      ),
      body: Padding(
          padding: const EdgeInsets.only(
						top: 30,
						bottom: 0,
						right: 10,
						left: 10
					),
          child: Center(
            child: Column(children: <Widget>[
              TextField(
                controller: _email,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "example@mail.com",
                    border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(
											Radius.circular(10.0)
                    )
                	)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _password,
                autocorrect: false,
                enableSuggestions: false,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
              	    borderSide: BorderSide(),
                	  borderRadius: BorderRadius.all(
												Radius.circular(10.0)
										)
									),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
								style: ElevatedButton.styleFrom(
									minimumSize: const Size.fromHeight(50),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
								),
								onPressed: () {
									final String email = "Email: ${_email.text}";
									final String password = "Password: ${_password.text}";
									print(
											"Email and Password were Submitted \n$email \n$password"
									);
								},
								child: const Text(
                  "Login",
                )
							),
            ],
					),
        ),
			),
    );
  }
}
