import 'package:flutter/material.dart';

class privacy extends StatelessWidget {
  const privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(250, 30, 30, 30),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Privacy Policy",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: const Color.fromARGB(250, 30, 30, 30),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "App Privacy Policy:",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 16),
              PrivacyPolicyText(
                text:
                    "At the heart of our service is a commitment to your privacy. Your notes are sacrosanct - we don't access, share, or sell them. Your trust is paramount, and we handle your personal information with the utmost care, ensuring it remains secure at all times. Any data we collect is solely for improving your experience - enhancing features, fixing bugs, and optimizing performance. Your privacy is non-negotiable; it's a promise we uphold diligently.",
              ),
              SizedBox(height: 16),
              PrivacyPolicyText(
                text:
                    "We understand the importance of safeguarding your personal data. Rest assured, your notes are exclusively yours; we never view, share, or sell them to third parties. Any information we gather is used strictly to enhance your user experience, such as refining features and addressing any technical issues promptly. We employ robust security measures to protect your privacy, ensuring that your personal details remain confidential and inaccessible to unauthorized individuals. Your trust is the cornerstone of our relationship, and we are committed to upholding the highest standards of privacy protection.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicyText extends StatelessWidget {
  final String text;

  const PrivacyPolicyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromARGB(200, 50, 50, 50),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
    );
  }
}
