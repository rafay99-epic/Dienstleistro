import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/choiceChip.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ApplyJob extends StatelessWidget {
  const ApplyJob({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _coverController = TextEditingController();
    // Get the screen size
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: size.width * 0.02, // 2% of screen width
        toolbarHeight: size.height * 0.1, // 10% of screen height
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: MyText(
          text: 'Apply',
          color: Theme.of(context).colorScheme.primary,
          fontFamily: "ABeeZee",
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          fontSize: size.width * 0.04,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Handle the save action
            },
            child: MyText(
              text: 'Cancel',
              fontFamily: "ABeeZee",
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              const Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage(
                        'assets/images/image.jpg'), // Replace with your profile image path
                  ),
                  title: Text('Job Title'), // Replace with your job title
                  subtitle: Text('Location'), // Replace with your location
                ),
              ),
              SizedBox(height: size.height * 0.03),
              //Text Add Cover letter
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Add Cover Letter",
                  fontSize: 15,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              //text Feild
              CustomTextField(
                hintText: "Write your letter",
                controller: _coverController,
                maxLines: 3,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),

              // Upload Resume title
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Upload Resume",
                  fontSize: 15,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              //upload  file section

              SizedBox(height: size.height * 0.01),
              //upload  file section
              InkWell(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    PlatformFile file = result.files.first;

                    print(file.name);
                    print(file.bytes);
                    print(file.size);
                    print(file.extension);
                    print(file.path);
                  } else {
                    // User canceled the picker
                  }
                },
                child: DottedBorder(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context)
                          .size
                          .width, // Set the width to the width of the device
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.cloud_upload,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                            const SizedBox(width: 10),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MyText(
                                  text: 'Upload File',
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'ABeeZee',
                                ),
                                MyText(
                                  text: '.doc .docx .rtf .pdf .txt',
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'ABeeZee',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text:
                      "Upload your CV/resume or any other relevant. Max. file size: 30MB.",
                  fontSize: 13,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              // Your Experience
              SizedBox(height: size.height * 0.03),

              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Your Experience",
                  fontSize: 15,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 2.0,
                  runSpacing: 2.0,
                  children: <Widget>[
                    CustomChoiceChip(label: 'No Experience'),
                    CustomChoiceChip(label: '1-2 years'),
                    CustomChoiceChip(label: '3-4 years'),
                    CustomChoiceChip(label: '4-5 years'),
                    CustomChoiceChip(label: '5+ years'),
                    CustomChoiceChip(label: '10+ years'),
                  ],
                ),
              ),
              // Your Eduction
              SizedBox(height: size.height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Your Education",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 3.0,
                  runSpacing: 3.0,
                  children: <Widget>[
                    CustomChoiceChip(label: 'None'),
                    CustomChoiceChip(label: 'High school diplama '),
                    CustomChoiceChip(label: 'Associate'),
                    CustomChoiceChip(label: "Bachelor's"),
                    CustomChoiceChip(label: "Master's"),
                    CustomChoiceChip(label: "Doctorate"),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),

              //send Button
              CustomButton(
                onPressed: () {
                  // Handle the button press

                  //change application language

                  //use shared perferance to store into device

                  //naviagate to different page
                },
                text: "Send Now",
                enableIcon: false,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                buttonTextColor: Theme.of(context).colorScheme.background,
                buttonTextSize: 17,
                buttonTextAlign: TextAlign.center,
                buttonTextFontFamily: 'ABeeZee',
                buttonTextfontStyle: FontStyle.italic,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
