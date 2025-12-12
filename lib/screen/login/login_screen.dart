
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/login/provider/login_provider.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_button.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_text_form_field.dart';
import 'package:vf_app/utils/widgets/loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  late LoginProvider loginProvider;

  @override
  void initState() {
    loginProvider = context.read<LoginProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loginProvider = context.watch<LoginProvider>();
    return Loader(
      isCallInProgress: loginProvider.isLoading,
      child: mainUi(context),
    );
  }

  @override
  Widget mainUi(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;

    return GestureDetector(
      onTap: () => Utils.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: AppColors.cardBackground,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWeb ? 80.0 : screenWidth * 0.042,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left side image or decoration for web
                  if (isWeb)
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          AssetsConstants.appLogo,
                          height: 300,
                        ),
                      ),
                    ),

                  // Login Form
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(60),
                      padding: EdgeInsets.all(screenHeight * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: isWeb ? 40 : screenHeight * 0.02,
                              ),
                              TextH6(
                                title: StringConstants.loginTxt.tr(),
                                weight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: isWeb ? 30 : screenHeight * 0.05,
                              ),
                        
                              // Mobile number text field
                              CustomTextFormField(
                                isWeb: isWeb,
                                controller: mobileNumberController,
                                hintText: StringConstants.mobileNumberHintTxt
                                    .tr(),
                                labelText: StringConstants.mobileNumberTxt
                                    .tr(),
                                textInputType: TextInputType.number,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return StringConstants
                                        .mobileNumberValidationErrorTxt1
                                        .tr();
                                  } else if (value.length != 10) {
                                    return StringConstants
                                        .mobileNumberValidationErrorTxt2
                                        .tr();
                                  }
                                  return null;
                                },
                              ),
                        
                              // Password text field
                              CustomTextFormField(
                                isWeb: isWeb,
                                controller: passwordController,
                                hintText: StringConstants.passwordHintTxt
                                    .tr(),
                                labelText: StringConstants.passwordTxt.tr(),
                                isObscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return StringConstants
                                        .passwordValidationError1
                                        .tr();
                                  }
                                  return null;
                                },
                              ),
                        
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextH9(
                                  title: StringConstants.forgotPasswordTxt
                                      .tr(),
                                  weight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 20),
                        
                              // Submit button
                              CustomButton(
                                isWeb: isWeb,
                                onPressed: () {
                                  final formState = formKey.currentState;
                                  if (formState!.validate()) {
                                    final request = {
                                      "username": mobileNumberController.text,
                                      "password": passwordController.text,
                                    };
                                    loginProvider.login(
                                      context: context,
                                      request: request,
                                    );
                                  }
                                },
                                buttonText: StringConstants.loginTxt.tr(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
