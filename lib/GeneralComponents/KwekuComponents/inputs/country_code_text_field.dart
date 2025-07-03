import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';

class CountryCodeTextField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<Country>? onCountryChanged;
  final ValueChanged<String>? onPhoneNumberChanged;
  final FormFieldValidator<String>? validator;

  const CountryCodeTextField({
    super.key,
    this.controller,
    this.onCountryChanged,
    this.onPhoneNumberChanged,
    this.validator,
  });

  @override
  State<CountryCodeTextField> createState() => _CountryCodeTextFieldState();
}

class _CountryCodeTextFieldState extends State<CountryCodeTextField> {
  late Country selectedCountry;
  late TextEditingController _controller;
  String? _validationError;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    
    // Always initialize with Ghana as default
    selectedCountry = Country(
      phoneCode: '233',
      countryCode: 'GH',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Ghana',
      example: '233123456789',
      displayName: 'Ghana',
      displayNameNoCountryCode: 'Ghana',
      e164Key: '',
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    
    // Use the parent validator if provided
    final parentValidation = widget.validator?.call(value);
    if (parentValidation != null) {
      return parentValidation;
    }
    
    // Basic validation - ensure it's digits only
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number should contain only digits';
    }
    
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(50, 50, 71, 0.05),
                offset: Offset(0, 3),
                blurRadius: 8,
                spreadRadius: -1,
              ),
              BoxShadow(
                color: Color.fromRGBO(12, 26, 75, 0.24),
                offset: Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ],
          ),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: _validateInput,
            onChanged: (value) {
              widget.onPhoneNumberChanged?.call(value);
              setState(() {
                _validationError = _validateInput(value);
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Phone Number',
              errorMaxLines: 2,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: InkWell(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    countryListTheme: CountryListThemeData(
                      flagSize: 25,
                      backgroundColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                    showPhoneCode: true,
                    favorite: ['GH'], // Ghana as favorite
                    onSelect: (Country country) {
                      setState(() {
                        selectedCountry = country;
                        _validationError = null;
                      });
                      widget.onCountryChanged?.call(country);
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        selectedCountry.flagEmoji,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '+${selectedCountry.phoneCode}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_validationError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12),
            child: Text(
              _validationError!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}