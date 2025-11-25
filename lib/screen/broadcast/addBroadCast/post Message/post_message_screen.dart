
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/broadcast/addBroadCast/memberExcept/member_Except_screen.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_button.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_text_form_field.dart';

class PostMessageScreen extends StatefulWidget {
  const PostMessageScreen({super.key});

  @override
  State<PostMessageScreen> createState() => _PostMessageScreenState();
}

class _PostMessageScreenState extends State<PostMessageScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _messageFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _messageFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _messageFocusNode.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.postMessageTxt.tr(),
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.02,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMembersHeader(),
                SizedBox(height: screenHeight * 0.03),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MemberExceptScreen()));
                  },
                    child: buildMembers("Member Except", "Excluded (2)")),
                SizedBox(height: screenHeight * 0.02),
                buildMembers("Only Share with", "Members (32)"),
                SizedBox(height: screenHeight * 0.04),
                messageScreen(),
                SizedBox(height: screenHeight * 0.1),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      String message = messageController.text;
                      // print("Message submitted: $message");
                    }
                  },
                  buttonText: "Post Message",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMembersHeader() {
    return Container(
      height: screenHeight * 0.11,
      width: screenWidth * 0.96,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextH3(
              title: "All Members",
              weight: FontWeight.w500,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMembers(String title, String subtitle) {
    return Container(
      height: screenHeight * 0.11,
      width: screenWidth * 0.96,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextH3(
                  title: title,
                  weight: FontWeight.w500,
                  color: AppColors.black,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextH7(
                  title: subtitle,
                  weight: FontWeight.w500,
                  color: AppColors.textColor3,
                ),
              ],
            ),
            TextButton(
              onPressed: () {

              },
              child: const Text("Edit"),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageScreen() {
    return Column(
      children: [
        CustomTextFormField(
          controller: messageController,
          hintText: "Message",
          // suffixIcon: const Icon(Icons.emoji_emotions_outlined),
          maxLine: 5,
          // focusNode: _messageFocusNode,
          // keyboardType: TextInputType.multiline,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Please enter a message';
            }
            return null;
          },
          labelText: "Message",
        ),
      ],
    );
  }
}

