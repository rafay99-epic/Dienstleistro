import 'package:csc_picker/csc_picker.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/constants/widgets/textfeild2.dart';
import 'package:flutter/material.dart';

class UpdateContactInformation extends StatefulWidget {
  const UpdateContactInformation({super.key});

  @override
  State<UpdateContactInformation> createState() =>
      _UpdateContactInformationState();
}

class _UpdateContactInformationState extends State<UpdateContactInformation> {
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              MyText(
                text: "Update Contanct Information",
                fontSize: 25,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                fontFamily: "ABeeZee",
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextField(
                hintText: 'Phone Number',
                icon: Icons.phone,
                controller: phoneController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                hintText: 'Address',
                icon: Icons.location_on,
                controller: phoneController,
              ),
              const SizedBox(
                height: 15,
              ),
              CSCPicker(
                showStates: true,
                showCities: true,
                flagState: CountryFlag.ENABLE,
                dropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primary, width: 1),
                ),
                disabledDropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.shade300,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primary, width: 1),
                ),
                countrySearchPlaceholder: countryController.text,
                stateSearchPlaceholder: stateController.text,
                citySearchPlaceholder: cityController.text,
                countryDropdownLabel: "*Country",
                stateDropdownLabel: "*State",
                cityDropdownLabel: "*City",
                selectedItemStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                ),
                dropdownHeadingStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                dropdownItemStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                ),
                dropdownDialogRadius: 10.0,
                searchBarRadius: 10.0,
                onCountryChanged: (value) {
                  setState(() {
                    countryController.text = 'Country: $value';
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateController.text = 'State: $value';
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityController.text = 'City: $value';
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.background,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Handle button 1 click
                      },
                      child: MyText(
                        text: 'Update',
                        color: Theme.of(context).colorScheme.background,
                        fontFamily: 'ABeeZee',
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      onPressed: () {
                        countryController.clear();
                        stateController.clear();
                        cityController.clear();
                        phoneController.clear();
                      },
                      child: MyText(
                        text: 'Cancel',
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: 'ABeeZee',
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
