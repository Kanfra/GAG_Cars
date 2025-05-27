import 'package:flutter/material.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import '../../../GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import '../../../GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';

class SecurityOnePage extends StatefulWidget {
  const SecurityOnePage({super.key});

  @override
  State<SecurityOnePage> createState() => _SecurityOnePageState();
}

class _SecurityOnePageState extends State<SecurityOnePage> {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppbar(
          onLeadingIconClickFunction: () {},
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios_new_outlined,
          titleText: "Security",
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 16, bottom: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Old Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      CustomTextFormField(
                        obscureText: true,
                        textInputType: TextInputType.phone,
                        hintText: "Enter Password",
                        isSuffixIconRequired: false,
                        isPrefixIconRequired: false,
                        editingController: oldPassword,
                        isFieldHeightRequired: true,
                        fieldWidth: double.infinity,
                        maxLines: 1,
                        minLines: 1,
                      ),
                      const SizedBox(height: 15),

                      const Text("New Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      CustomTextFormField(
                        obscureText: true,
                        textInputType: TextInputType.phone,
                        hintText: "Enter new password",
                        isSuffixIconRequired: false,
                        isPrefixIconRequired: false,
                        editingController: newPassword,
                        isFieldHeightRequired: true,
                        fieldWidth: double.infinity,
                        maxLines: 1,
                        minLines: 1,
                      ),
                      const SizedBox(height: 15),

                      const Text("Confirm Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      CustomTextFormField(
                        obscureText: true,
                        textInputType: TextInputType.phone,
                        hintText: "Confirm new password",
                        isSuffixIconRequired: false,
                        isPrefixIconRequired: false,
                        editingController: confirmPassword,
                        isFieldHeightRequired: true,
                        fieldWidth: double.infinity,
                        maxLines: 1,
                        minLines: 1,
                      ),

                      const Spacer(),

                      CustomTextButton(
                        buttonTextType: "Change Password",
                        textTypeColor: Colors.white,
                        isFullButtonWidthRequired: true,
                        buttonBackgroundColor: Colors.red,
                        buttonVerticalPadding: 18,
                        onClickFunction: () {},
                      ),
                      const SizedBox(height: 50,)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
