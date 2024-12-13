import 'package:flutter/material.dart';
import 'package:sangwisata3/view/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sangwisata3/service/authentication_service.dart';
import '../exception/auth_exception_handler.dart';
import '../common/loading_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handleSignUp() {
    // show loading dialog
    LoadingDialog.showLoadingDialog(context);

    AuthenticationService()
        .registerWithEmailAndPassword(
      name: controllerName.text,
      email: controllerEmail.text,
      password: controllerPass.text,
    )
        .then(
      (status) {
        // hide loading dialog
        LoadingDialog.hideLoadingDialog(context);

        if (status == AuthResultStatus.successful) {
          Fluttertoast.showToast(msg: "Sukses");
        } else {
          final errorMsg =
              AuthExceptionHandler.generateExceptionMessage(status);
          Fluttertoast.showToast(msg: errorMsg);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                height: h * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/img/bg1.png',
                        ),
                        fit: BoxFit.cover)),
              ),
              // WIDGET FIELD DKK
              Container(
                margin: const EdgeInsets.only(left: 32, right: 32),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Daftar Disini!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
        
                    SizedBox(
                      height: 40,
                    ),
        
                    // INPUT Nama
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextFormField(
                        controller: controllerName,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "Nama kamu",
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          border: InputBorder
                              .none, // Ini untuk menghilangkan garis bawah
                        ),
                      ),
                    ),
        
                    SizedBox(
                      height: 8,
                    ),
        
                    // INPUT EMAIL
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextFormField(
                        controller: controllerEmail,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email kamu",
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          border: InputBorder
                              .none, // Ini untuk menghilangkan garis bawah
                        ),
                      ),
                    ),
        
                    SizedBox(
                      height: 8,
                    ),
        
                    // INPUT PASSWORD
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextFormField(
                        controller: controllerPass,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "Password kamu",
                          prefixIcon: Icon(
                            Icons.password_rounded,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          border: InputBorder
                              .none, // Ini untuk menghilangkan garis bawah
                        ),
                      ),
                    ),
                    
                    SizedBox(
                      height: 40,
                    ),
        
                    // BUTTON
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // print('validate is done');
                          handleSignUp();
                        }
                      },
                      child: Text("Daftar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          )),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 42, 52, 64),
                          minimumSize: const Size.fromHeight(55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
        
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah punya akun?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            )),
                        SizedBox(width: 7),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ));
                          },
                          child: Text("Login disini!",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 48, 91, 60),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
