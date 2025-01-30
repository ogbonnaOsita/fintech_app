import 'package:fintech_app/ui/screens/address_form.dart';
import 'package:fintech_app/ui/widgets/custom_button.dart';
import 'package:fintech_app/utils/constants.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PersonalInfoFormState();
  }
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _gender;
  DateTime? _dateOfBirth;

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tell us a little bit about yourself',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Constants.kSecondaryColor),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please add your name as it appears on your official documents and IDs.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(
                  label: 'Legal First Name',
                  onChanged: (value) => _firstName = value,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Legal Middle Name (Optional)',
                  onChanged: (value) => _middleName = value,
                  isRequired: false,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Legal Last Name',
                  onChanged: (value) => _lastName = value,
                ),
                const SizedBox(height: 16),
                _buildDropdown(),
                const SizedBox(height: 16),
                _buildDateField(),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Next',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => AddressForm(),
                        ),
                      );
                    },
                    type: ButtonType.elevated,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required ValueChanged<String> onChanged,
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
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
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

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: _gender,
            hint: const Text('Choose one'),
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
            items: _genderOptions
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date of birth',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'DD/MM/YY',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              setState(() {
                _dateOfBirth = picked;
              });
            }
          },
          controller: TextEditingController(
            text: _dateOfBirth != null
                ? '${_dateOfBirth!.day.toString().padLeft(2, '0')}/'
                    '${_dateOfBirth!.month.toString().padLeft(2, '0')}/'
                    '${_dateOfBirth!.year.toString().substring(2)}'
                : '',
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      print('Form submitted');
      print('First Name: $_firstName');
      print('Middle Name: $_middleName');
      print('Last Name: $_lastName');
      print('Gender: $_gender');
      print('Date of Birth: $_dateOfBirth');
    }
  }
}
