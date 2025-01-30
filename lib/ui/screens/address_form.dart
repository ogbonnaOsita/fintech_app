import 'package:fintech_app/ui/screens/account_creation_success_screen.dart';
import 'package:fintech_app/ui/widgets/custom_button.dart';
import 'package:fintech_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddressFormState();
  }
}

class _AddressFormState extends State<AddressForm> {
  String? selectedState;
  String? selectedLGA;
  final TextEditingController cityController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  List<String> states = [];
  List<String> lgas = [];

  @override
  void initState() {
    super.initState();
    states = NigerianStatesAndLGA.allStates;
    lgas = [];
  }

  void _updateLGAs(String state) {
    setState(() {
      selectedLGA = null; // Reset LGA when state changes
      lgas = NigerianStatesAndLGA.getStateLGAs(state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      backgroundColor: Constants.kWhiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's Your Home Address?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Constants.kSecondaryColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please use your actual house address.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            _buildDropdownField(
              label: "State",
              value: selectedState,
              items: states,
              onChanged: (newValue) {
                setState(() {
                  selectedState = newValue;
                  if (newValue != null) {
                    _updateLGAs(newValue);
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            _buildDropdownField(
              label: "L.G.A",
              value: selectedLGA,
              items: lgas,
              onChanged: (newValue) {
                setState(() {
                  selectedLGA = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "City",
              controller: cityController,
              hintText: "Enter a city",
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "House Number",
              controller: houseNumberController,
              hintText: "House 9",
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Street Name",
              controller: streetController,
              hintText: "Name of your street",
            ),
            const SizedBox(height: 24),
            // SizedBox(
            //   width: double.infinity,
            //   height: 50,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Handle form submission
            //       if (_validateForm()) {
            //         // Proceed with form submission
            //       }
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color(0xFFFF99B9),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //     child: const Text(
            //       "Next",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ),
            // ),

            CustomButton(
              text: 'Log In',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => AccountCreationSuccessScreen(),
                  ),
                );
              },
              type: ButtonType.elevated,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            hint: Text('Select $label'),
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            dropdownColor: Colors.white,
            icon: const Icon(Icons.arrow_drop_down),
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isRequired = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          validator: isRequired
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }

  bool _validateForm() {
    if (selectedState == null || selectedLGA == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both State and LGA')),
      );
      return false;
    }
    if (cityController.text.isEmpty || houseNumberController.text.isEmpty || streetController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    cityController.dispose();
    houseNumberController.dispose();
    streetController.dispose();
    super.dispose();
  }
}
