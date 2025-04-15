import 'package:ezybooking/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class FillYourProfileScreen extends StatelessWidget {
  final String email;
  const FillYourProfileScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    PhoneNumber initialNumber = PhoneNumber(isoCode: 'IN'); // Default country India
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Fill Your Profile',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(Icons.edit, color: Colors.black, size: 16),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(hintText: 'Full Name', icon: Icons.person,controller: authController.nameController),
              _buildTextField(hintText: 'Nickname', icon: Icons.person_outline,controller: authController.nickNameController),
              _buildDateField(context, authController),
              _buildTextField(hintText: 'Email', icon: Icons.email,controller: TextEditingController(text: email)),
              _buildPhoneNumberField(initialNumber,authController.numberController),
              _buildDropdownField(hintText: 'Gender', icon: Icons.arrow_drop_down,authController: authController),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    authController.userDetails(context, email);
                  },
                  child: Obx(() => authController.fillYourProfileLoading.value ? CupertinoActivityIndicator(color: Colors.white,) : Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText, required IconData icon,TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54),
          filled: true,
          fillColor: Colors.grey[900],
          prefixIcon: Icon(icon, color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),

        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildPhoneNumberField(PhoneNumber initialNumber,TextEditingController? textFieldController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
          },
          selectorTextStyle: TextStyle(color: Colors.white),
          textStyle: TextStyle(color: Colors.white),
          textFieldController: textFieldController,
          inputDecoration: InputDecoration(
            hintText: "Phone Number",
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          formatInput: true,
          keyboardType: TextInputType.number,
          inputBorder: OutlineInputBorder(),
          initialValue: initialNumber,
        )
      ),
    );
  }

  // Widget _buildDropdownField({required String hintText, required IconData icon,required AuthController authController}) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 12),
  //       decoration: BoxDecoration(
  //         color: Colors.grey[900],
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Obx(() => DropdownButtonHideUnderline(
  //         child: DropdownButton<String>(
  //           style: TextStyle(color: Colors.white),
  //           hint: Text(hintText, style: const TextStyle(color: Colors.white)),
  //           icon: Icon(icon, color: Colors.white),
  //           isExpanded: true,
  //           value:authController.selectedGender.value.isEmpty ? null : authController.selectedGender.value,
  //           items: <String>['Male', 'Female', 'Other'].map((String value) {
  //             return DropdownMenuItem<String>(
  //               value: value,
  //               child: Text(value, style: const TextStyle(color: Colors.black)),
  //             );
  //           }).toList(),
  //           onChanged: (String? newValue) {
  //             authController.selectedGender.value = newValue!;
  //           },
  //         ),
  //       ),)
  //     ),
  //   );
  // }
  Widget _buildDropdownField({required String hintText, required IconData icon, required AuthController authController,}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Obx(
              () => DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              style: const TextStyle(color: Colors.white), // Selected item text color
              dropdownColor: Colors.grey[900], // Dropdown background color
              hint: Text(hintText, style: const TextStyle(color: Colors.white)),
              icon: Icon(icon, color: Colors.white),
              isExpanded: true,
              value: authController.selectedGender.value.isEmpty
                  ? null
                  : authController.selectedGender.value,
              items: <String>['Male', 'Female', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.white)), // Fix: White text color
                );
              }).toList(),
              onChanged: (String? newValue) {
                authController.selectedGender.value = newValue!;
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, AuthController authController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: authController.dobController,
        readOnly: true,
        decoration: InputDecoration(
          hintText: 'Date of Birth',
          hintStyle: const TextStyle(color: Colors.white54),
          filled: true,
          fillColor: Colors.grey[900],
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return Theme(
                data: ThemeData.dark(),
                child: child!,
              );
            },
          );
          if (pickedDate != null) {
            authController.dobController.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
          }
        },
        style: TextStyle(color: Colors.white),
      ),
    );
  }

}
