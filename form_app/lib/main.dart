import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactForm(),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each text field
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _aadharController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // Variables to store submitted details
  String _submittedName = '';
  String _submittedPhone = '';
  String _submittedAadhar = '';
  String _submittedAddress = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Phone Number Field
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r"^\d{10}$").hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Aadhar Number Field
              TextFormField(
                controller: _aadharController,
                decoration: InputDecoration(labelText: 'Aadhar Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Aadhar number';
                  } else if (!RegExp(r"^\d{12}$").hasMatch(value)) {
                    return 'Please enter a valid 12-digit Aadhar number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Address Field
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                maxLines: 4,
              ),
              SizedBox(height: 32),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Submit'),
              ),

              SizedBox(height: 16),

              // Display Submitted Details
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text('Submitted Details:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Name: $_submittedName'),
                    Text('Phone Number: $_submittedPhone'),
                    Text('Aadhar Number: $_submittedAadhar'),
                    Text('Address: $_submittedAddress'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validation successful, process the form data
      setState(() {
        _submittedName = _nameController.text;
        _submittedPhone = _phoneController.text;
        _submittedAadhar = _aadharController.text;
        _submittedAddress = _addressController.text;
      });

      // TODO: Add your logic to handle the form data (e.g., send it to a server)
      print(
          'Name: $_submittedName, Phone Number: $_submittedPhone, Aadhar Number: $_submittedAadhar, Address: $_submittedAddress');
    }
  }
}
