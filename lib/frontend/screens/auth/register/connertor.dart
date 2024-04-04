import 'package:dienstleisto/frontend/screens/auth/register/customer/customerForm.dart';
import 'package:dienstleisto/frontend/screens/auth/register/seller/sellerForm.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class RegisterCustomerSeller extends StatefulWidget {
  const RegisterCustomerSeller({Key? key}) : super(key: key);

  @override
  _RegisterCustomerSellerState createState() => _RegisterCustomerSellerState();
}

class _RegisterCustomerSellerState extends State<RegisterCustomerSeller> {
  bool showCustomerForm = true;

  void toggleForms() {
    setState(() {
      showCustomerForm = !showCustomerForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          fontStyle: FontStyle.italic,
                          fontFamily: "ABeeZee",
                        ),
                      ),
                      TextSpan(
                        text: '\nUser',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          fontStyle: FontStyle.italic,
                          fontFamily: "ABeeZee",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),

              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Sign up to join",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              // const SizedBox(height: 15),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showCustomerForm = true;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.background),
                      side: MaterialStateProperty.all(BorderSide(
                          color: Theme.of(context).colorScheme.secondary)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 50)),
                    ),
                    child: MyText(
                      text: "Customer",
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: "ABeeZee",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showCustomerForm = false;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.background),
                      side: MaterialStateProperty.all(BorderSide(
                          color: Theme.of(context).colorScheme.secondary)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 50)),
                    ),
                    child: MyText(
                      text: "Seller",
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: "ABeeZee",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final slideAnimation = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  );
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.3, 0.0),
                      end: Offset.zero,
                    ).animate(slideAnimation),
                    child: child,
                  );
                },
                child: showCustomerForm
                    ? const CustomerForm()
                    : const SellerForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
