// import 'package:dienstleisto/frontend/screens/functionality/auth/register/customer/customerForm.dart';
// import 'package:dienstleisto/frontend/screens/functionality/auth/register/seller/sellerForm.dart';
// import 'package:dienstleisto/frontend/widgets/button.dart';
// import 'package:dienstleisto/frontend/widgets/textStyle.dart';
// import 'package:flutter/material.dart';

// class RegisterCustomerSeller extends StatefulWidget {
//   const RegisterCustomerSeller({super.key});

//   @override
//   State<RegisterCustomerSeller> createState() => _RegisterCustomerSellerState();
// }

// class _RegisterCustomerSellerState extends State<RegisterCustomerSeller> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     bool showCustomerForm = true;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: Column(
//             children: <Widget>[
//               const SizedBox(height: 120.0),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: RichText(
//                   text: TextSpan(
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: 'Welcome',
//                         style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.w400,
//                           color: Theme.of(context).colorScheme.primary,
//                           fontStyle: FontStyle.italic,
//                           fontFamily: "ABeeZee",
//                         ),
//                       ),
//                       TextSpan(
//                         text: '\nuser',
//                         style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.w400,
//                           color: Theme.of(context).colorScheme.primary,
//                           fontStyle: FontStyle.italic,
//                           fontFamily: "ABeeZee",
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),

//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: MyText(
//                   text: "Sign up to join",
//                   fontSize: 17,
//                   fontWeight: FontWeight.w400,
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                 ),
//               ),
//               // const SizedBox(height: 15),
//               SizedBox(height: size.height * 0.02),

//               //Row contain Two Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: () => {
//                       setState(() {
//                         showCustomerForm = true;
//                       })
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           Theme.of(context).colorScheme.background),
//                       side: MaterialStateProperty.all(BorderSide(
//                           color: Theme.of(context).colorScheme.secondary)),
//                       shape: MaterialStateProperty.all(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                       minimumSize:
//                           MaterialStateProperty.all(const Size(150, 50)),
//                     ),
//                     child: Text(
//                       "Customer",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.primary,
//                         fontSize: 15,
//                         fontFamily: "ABeeZee",
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () => {
//                       setState(() {
//                         showCustomerForm = false;
//                       })
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                         Theme.of(context).colorScheme.background,
//                       ),
//                       side: MaterialStateProperty.all(BorderSide(
//                           color: Theme.of(context).colorScheme.secondary)),
//                       shape: MaterialStateProperty.all(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                       minimumSize:
//                           MaterialStateProperty.all(const Size(150, 50)),
//                     ),
//                     child: Text(
//                       "Seller",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.primary,
//                         fontSize: 15,
//                         fontFamily: "ABeeZee",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 300),
//                 transitionBuilder: (Widget child, Animation<double> animation) {
//                   return SlideTransition(
//                     position: Tween<Offset>(
//                       begin: const Offset(0.3, 0.0),
//                       end: Offset.zero,
//                     ).animate(animation),
//                     child: child,
//                   );
//                 },
//                 child:
//                     showCustomerForm ? const CustomerForm() : const SellForm(),
//               ),a
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

/// This is a implementation of the Country State City Picker.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSC Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'CSC Picker',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Variables to store country state city data in onChanged method.
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 600,
          child: Column(
            children: [
              ///Adding CSC Picker Widget in app
              CSCPicker(
                showStates: false,

                /// Enable disable city drop down [OPTIONAL PARAMETER]
                showCities: true,

                ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                flagState: CountryFlag.ENABLE,

                ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                dropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),

                ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                ///placeholders for dropdown search field
                countrySearchPlaceholder: "Country",
                stateSearchPlaceholder: "State",
                citySearchPlaceholder: "City",

                ///labels for dropdown
                countryDropdownLabel: "*Country",
                stateDropdownLabel: "*State",
                cityDropdownLabel: "*City",

                ///selected item style [OPTIONAL PARAMETER]
                selectedItemStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),

                ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                dropdownHeadingStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),

                ///DropdownDialog Item style [OPTIONAL PARAMETER]
                dropdownItemStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),

                ///Dialog box radius [OPTIONAL PARAMETER]
                dropdownDialogRadius: 10.0,

                ///Search bar radius [OPTIONAL PARAMETER]
                searchBarRadius: 10.0,

                ///triggers once country selected in dropdown
                onCountryChanged: (value) {
                  setState(() {
                    ///store value in country variable
                    countryValue = value;
                  });
                },

                ///triggers once state selected in dropdown
                onStateChanged: (value) {
                  setState(() {
                    ///store value in state variable
                    stateValue = value!;
                  });
                },

                ///triggers once city selected in dropdown
                onCityChanged: (value) {
                  setState(() {
                    ///store value in city variable
                    cityValue = value!;
                  });
                },
              ),

              ///print newly selected country state and city in Text Widget
              TextButton(
                  onPressed: () {
                    setState(() {
                      address = "$cityValue, $stateValue, $countryValue";
                    });
                  },
                  child: Text("Print Data")),
              Text(address)
            ],
          ),
        ),
      ),
    );
  }
}
