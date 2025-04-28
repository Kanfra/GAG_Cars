import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CountryCodeTextField extends StatefulWidget {
  const CountryCodeTextField({
    super.key,

  });



  @override
  State<CountryCodeTextField> createState() => _CountryCodeTextFieldState();
}

class _CountryCodeTextFieldState extends State<CountryCodeTextField> {
  Country selectedCountry = Country(
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
     
     
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: InkWell(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
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
    );
  
  }
}
