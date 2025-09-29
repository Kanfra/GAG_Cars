import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/sizeGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Services/GetVerifiedService/getVerifiedService.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import '../../../GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import '../../../Utils/WidgetUtils/widgetUtils.dart';

class GetVerifiedPage extends StatefulWidget {
  const GetVerifiedPage({super.key});

  @override
  State<GetVerifiedPage> createState() => _GetVerifiedPageState();
}

class _GetVerifiedPageState extends State<GetVerifiedPage> {
  // Document files
  File? _selfieImage;
  File? _nationalIdFront;
  File? _nationalIdBack;

  // Capture states
  bool _isSelfieCaptured = false;
  bool _isFrontCaptured = false;
  bool _isBackCaptured = false;

  // UI states
  bool _isLoading = false;

  // Face detection
  FaceDetector? _faceDetector;
  final ImagePicker _picker = ImagePicker();

  // Service
  final GetVerifiedService _verificationService = GetVerifiedService();

  @override
  void initState() {
    super.initState();
    _initializeFaceDetection();
  }

  Future<void> _initializeFaceDetection() async {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableClassification: true,
      ),
    );
  }

  // ================== SELFIE CAPTURE ==================
  Future<void> _takeSelfie() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
      );
      
      if (image == null) return;

      final inputImage = InputImage.fromFilePath(image.path);
      final faces = await _faceDetector!.processImage(inputImage);

      if (faces.isEmpty) {
        showCustomSnackBar(
          title: "No Face Detected",
          message: "Please make sure your face is clearly visible in the selfie.",
          backgroundColor: Colors.orange,
          textColor: Colors.white,
        );
        return;
      }

      setState(() {
        _selfieImage = File(image.path);
        _isSelfieCaptured = true;
      });
      
      showCustomSnackBar(
        title: "Success",
        message: "Selfie captured successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "Failed to capture selfie: $e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // ================== NATIONAL ID CAPTURE ==================
  Future<void> _captureNationalId(bool isFront) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (image == null) return;

      final tempDir = await getTemporaryDirectory();
      final outputPath =
          "${tempDir.path}/id_${isFront ? 'front' : 'back'}_${DateTime.now().millisecondsSinceEpoch}.jpg";

      final success = await EdgeDetection.detectEdge(outputPath);
      if (success) {
        setState(() {
          if (isFront) {
            _nationalIdFront = File(outputPath);
            _isFrontCaptured = true;
          } else {
            _nationalIdBack = File(outputPath);
            _isBackCaptured = true;
          }
        });
        
        showCustomSnackBar(
          title: "Success",
          message: "ID ${isFront ? 'front' : 'back'} captured successfully.",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "Failed to capture ID: $e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // ================== DOCUMENT WIDGET ==================
  Widget _buildDocumentSection({
    required String title,
    required String description,
    required IconData icon,
    required bool isCaptured,
    required File? file,
    required VoidCallback onTap,
    Color? accentColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isCaptured 
                  ? Colors.green 
                  : (accentColor ?? ColorGlobalVariables.brownColor),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (isCaptured ? Colors.green : (accentColor ?? ColorGlobalVariables.brownColor))
                        .withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: isCaptured ? Colors.green : (accentColor ?? ColorGlobalVariables.brownColor),
                    size: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  isCaptured ? "Successfully Captured!" : "Tap to Capture",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isCaptured ? Colors.green : Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isCaptured ? "Ready for verification" : "Take a clear photo",
                  style: TextStyle(
                    fontSize: 14,
                    color: isCaptured ? Colors.green : Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        if (isCaptured && file != null) ...[
          const SizedBox(height: 16),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                file,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.error_outline, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.camera_alt, size: 18),
              label: const Text("Retake"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[600],
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  // ================== VALIDATION ==================
  bool _validateForm() {
    return _isSelfieCaptured && _isFrontCaptured && _isBackCaptured;
  }

  // ================== SUBMIT HANDLER ==================
  void _handleVerificationSubmit() {
    if (!_validateForm()) {
      showCustomSnackBar(
        title: "Incomplete Information",
        message: "Please capture all required documents to proceed.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return;
    }

    if (_isLoading) return;

    setState(() => _isLoading = true);
    _submitVerificationProcess().then((_) {
      // Completion handled in the async function
    });
  }

  Future<void> _submitVerificationProcess() async {
    try {
      // Call the actual API service
      final response = await _verificationService.submitVerification(
        selfie: _selfieImage!,
        nationalIdFront: _nationalIdFront!,
        nationalIdBack: _nationalIdBack!,
      );

      if (mounted) {
        setState(() => _isLoading = false);
      }

      if (response.success) {
        showCustomSnackBar(
          title: "Success",
          message: response.message ?? "Verification submitted successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );

        // FIXED: Navigate back to Settings page within bottom navigation
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _navigateBackToSettings();
          }
        });
      } else {
        showCustomSnackBar(
          title: "Submission Failed",
          message: response.message ?? "Failed to submit verification",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
      showCustomSnackBar(
        title: "Error",
        message: "Failed to submit verification: $e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // ================== FIXED NAVIGATION ==================
  void _navigateBackToSettings() {
    // Option 1: Navigate back to Settings page (index 4 in bottom nav)
    // This will return to the Settings page within the bottom navigation
    Navigator.of(context).popUntil((route) => route.isFirst);
    
    // Option 2: If you need to specifically set the bottom nav index to 4 (Settings)
    // You can use a different approach depending on your navigation structure
    
    // Since GetVerifiedPage is pushed on top of SettingsPage,
    // popping twice should take us back to Settings within the bottom nav
    // Navigator.of(context).pop(); // Pop GetVerifiedPage
    // This should leave us in SettingsPage within the bottom navigation structure
  }

  // ================== PROGRESS INDICATOR ==================
  Widget _buildProgressStep(String label, int stepNumber, bool isCompleted) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.green : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : Text(
                    stepNumber.toString(),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isCompleted ? Colors.green : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: CustomAppbar(
        onLeadingIconClickFunction: () => _navigateBackToSettings(),
        isLeadingWidgetExist: true,
        leadingIconData: Icons.arrow_back_ios_new_outlined,
        titleText: "Get Verified",
        titleTextColor: ColorGlobalVariables.brownColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorGlobalVariables.brownColor.withOpacity(0.1),
                        ColorGlobalVariables.maroonColor.withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: ColorGlobalVariables.brownColor.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ColorGlobalVariables.brownColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.verified_user_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "Identity Verification",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Complete your verification to build trust with customers and access premium features. All documents are securely processed.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Progress Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProgressStep("Selfie", 1, _isSelfieCaptured),
                    _buildProgressStep("ID Front", 2, _isFrontCaptured),
                    _buildProgressStep("ID Back", 3, _isBackCaptured),
                  ],
                ),
                const SizedBox(height: 32),

                // Selfie Section
                _buildDocumentSection(
                  title: "1. Take a Selfie",
                  description: "We need to verify that you're a real person. Please take a clear selfie with your face clearly visible.",
                  icon: Icons.face_retouching_natural,
                  isCaptured: _isSelfieCaptured,
                  file: _selfieImage,
                  onTap: _takeSelfie,
                  accentColor: Colors.blue,
                ),

                // National ID Front
                _buildDocumentSection(
                  title: "2. National ID (Front Side)",
                  description: "Capture the front side of your government-issued ID card. Make sure all details are clearly visible.",
                  icon: Icons.credit_card,
                  isCaptured: _isFrontCaptured,
                  file: _nationalIdFront,
                  onTap: () => _captureNationalId(true),
                  accentColor: Colors.orange,
                ),

                // National ID Back
                _buildDocumentSection(
                  title: "3. National ID (Back Side)",
                  description: "Capture the back side of your government-issued ID card. Ensure all information is readable.",
                  icon: Icons.credit_card_outlined,
                  isCaptured: _isBackCaptured,
                  file: _nationalIdBack,
                  onTap: () => _captureNationalId(false),
                  accentColor: Colors.purple,
                ),

                const SizedBox(height: 24),

                // Security Notice
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.withOpacity(0.2)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.security_rounded,
                        color: Colors.blue,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Your documents are encrypted and securely stored. We only use them for verification purposes and comply with data protection regulations.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Submit Button - FIXED with proper navigation
                CustomTextButton(
                  buttonTextType: _isLoading ? "Submitting..." : "Submit Verification",
                  textTypeColor: Colors.white,
                  isFullButtonWidthRequired: true,
                  buttonBackgroundColor: _validateForm() && !_isLoading
                      ? ColorGlobalVariables.brownColor 
                      : Colors.grey[400]!,
                  onClickFunction: _validateForm() && !_isLoading ? _handleVerificationSubmit : null,
                  buttonVerticalPadding: SizeGlobalVariables.double_size_eighteen,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          
          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _faceDetector?.close();
    super.dispose();
  }
}