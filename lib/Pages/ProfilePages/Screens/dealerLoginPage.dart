import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Services/VerifyDealerService/verifyDealerService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/verifyDealerModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class DealerLoginPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const DealerLoginPage({
    super.key,
    required this.allJson,
  });

  @override
  State<DealerLoginPage> createState() => _DealerLoginPageState();
}

class _DealerLoginPageState extends State<DealerLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _garageName = TextEditingController();

  final logger = Logger();

  // Document files
  File? _selfieImage;
  File? _nationalIdFront;
  File? _nationalIdBack;
  File? _companyDocument;

  // Capture states
  bool _isFrontCaptured = false;
  bool _isBackCaptured = false;
  bool _isSelfieCaptured = false;
  bool _isCompanyDocCaptured = false;

  // Location
  String? _selectedLocation;
  Position? _currentPosition;

  // UI states
  bool _isLoading = false;

  // Camera & ML
  CameraController? _cameraController;
  FaceDetector? _faceDetector;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    logger.i("All json data: ${widget.allJson}");
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

  // ================== DOCUMENT PICKER ==================
  Future<void> _pickCompanyDocument() async {
    try {
      final file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        setState(() {
          _companyDocument = File(file.path);
          _isCompanyDocCaptured = true;
        });
        
        showCustomSnackBar(
          title: "Success",
          message: "Company document uploaded successfully.",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "Failed to pick company document: $e",
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

  // ================== PROGRESS INDICATOR ==================
  Widget _buildProgressStep(String label, int stepNumber, bool isCompleted) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.green : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    stepNumber.toString(),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: isCompleted ? Colors.green : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // ================== VALIDATION ==================
  bool _validateForm() {
    return _garageName.text.isNotEmpty &&
        (_currentPosition != null || _selectedLocation != null) &&
        _isSelfieCaptured &&
        _isFrontCaptured &&
        _isBackCaptured &&
        _isCompanyDocCaptured;
  }

  // ================== SUBMIT HANDLER ==================
  void _handleApplicationSubmit() {
    if (!_formKey.currentState!.validate() || !_validateForm()) {
      showCustomSnackBar(
        title: "Validation Error",
        message: "Please complete all fields and upload all documents.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return;
    }

    if (_isLoading) return;

    setState(() => _isLoading = true);
    _submitApplicationProcess().then((_) {
      // Completion handled in the async function
    });
  }

  Future<void> _submitApplicationProcess() async {
    try {
      final verificationService = VerificationService();

      final response = await verificationService.submitVerification(
        dealerName: _garageName.text.trim(),
        location: _selectedLocation ??
            "Lat: ${_currentPosition!.latitude}, Lng: ${_currentPosition!.longitude}",
        selfie: _selfieImage!,
        nationalIdFront: _nationalIdFront!,
        nationalIdBack: _nationalIdBack!,
        companyRegistrationDoc: _companyDocument,
      );

      if (response.success) {
        showCustomSnackBar(
          title: "Success",
          message: response.message ?? "Application submitted successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        
        // FIXED: Simple pop back to Settings page after success
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            // Get.back(); // This will return to Settings page
          }
        });
      } else {
        logger.e("Error is: ${response.message}");
        showCustomSnackBar(
          title: "Error",
          message: response.message,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "Unexpected error: $e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // ================== BUILD ==================
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Dealer Registration",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
        foregroundColor: ColorGlobalVariables.brownColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(), // Simple pop back
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
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
                                Icons.business_center_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                "Dealer Registration",
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
                          "Register your dealership to access premium features and reach more customers. Complete all steps to get verified.",
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
                      _buildProgressStep("Business", 1, _garageName.text.isNotEmpty && (_currentPosition != null || _selectedLocation != null)),
                      _buildProgressStep("Selfie", 2, _isSelfieCaptured),
                      _buildProgressStep("ID Front", 3, _isFrontCaptured),
                      _buildProgressStep("ID Back", 4, _isBackCaptured),
                      _buildProgressStep("Company", 5, _isCompanyDocCaptured),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Business Information Section
                  const Text(
                    "Business Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Tell us about your dealership business",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Garage name
                  TitleWithTextformfieldComponent(
                    title: "Garage/Dealership Name",
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black87,
                    obscureText: false,
                    textSize: 14,
                    borderRadius: 12,
                    cursorColor: ColorGlobalVariables.maroonColor,
                    iconSize: 22,
                    focusedBorderColor: ColorGlobalVariables.maroonColor,
                    fillColor: Colors.white,
                    backgroundColor: Colors.white,
                    enabledBorderColor: Colors.grey.shade300,
                    borderWidth: 1.5,
                    prefixIconData: Icons.business_outlined,
                    fieldWidth: double.infinity,
                    isTitleWithContainerWidgetRequired: false,
                    hintText: "Enter your garage name",
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: true,
                    isFieldHeightRequired: false,
                    editingController: _garageName,
                  ),
                  const SizedBox(height: 20),

                  // Location
                  TitleWithTextformfieldComponent(
                    title: "Business Location",
                    textSize: 14,
                    iconSize: 22,
                    borderRadius: 12,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black87,
                    obscureText: false,
                    borderColor: Colors.grey.shade300,
                    isTitleWithContainerWidgetRequired: true,
                    hintText: _currentPosition != null
                        ? "Lat: ${_currentPosition!.latitude.toStringAsFixed(4)}, Lng: ${_currentPosition!.longitude.toStringAsFixed(4)}"
                        : _selectedLocation ?? "Select your business location",
                    isIconAtFrontRequiredOfContainerWidgetRequired: true,
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: true,
                    isFieldHeightRequired: false,
                    onTitleWithContainerWidgetClickFunction: () async {
                      final result = await Get.toNamed(RouteClass.getLocationSearchPage());
                      if (result != null) {
                        setState(() {
                          _currentPosition = result['position'];
                          _selectedLocation = result['locationName'];
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 32),

                  // Verification Documents Section
                  const Text(
                    "Verification Documents",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Upload required documents for verification",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Selfie
                  _buildDocumentSection(
                    title: "1. Business Owner Selfie",
                    description: "Take a clear selfie to verify your identity as the business owner.",
                    icon: Icons.face_retouching_natural,
                    isCaptured: _isSelfieCaptured,
                    file: _selfieImage,
                    onTap: _takeSelfie,
                    accentColor: Colors.blue,
                  ),

                  // National ID front
                  _buildDocumentSection(
                    title: "2. National ID (Front Side)",
                    description: "Capture the front side of your government-issued ID card.",
                    icon: Icons.credit_card,
                    isCaptured: _isFrontCaptured,
                    file: _nationalIdFront,
                    onTap: () => _captureNationalId(true),
                    accentColor: Colors.orange,
                  ),

                  // National ID back
                  _buildDocumentSection(
                    title: "3. National ID (Back Side)",
                    description: "Capture the back side of your government-issued ID card.",
                    icon: Icons.credit_card_outlined,
                    isCaptured: _isBackCaptured,
                    file: _nationalIdBack,
                    onTap: () => _captureNationalId(false),
                    accentColor: Colors.purple,
                  ),

                  // Company doc
                  _buildDocumentSection(
                    title: "4. Company Registration Document",
                    description: "Upload your business registration certificate or company documents.",
                    icon: Icons.description_outlined,
                    isCaptured: _isCompanyDocCaptured,
                    file: _companyDocument,
                    onTap: _pickCompanyDocument,
                    accentColor: Colors.teal,
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
                            "All documents are encrypted and securely stored. We comply with data protection regulations and only use them for verification purposes.",
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

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _validateForm() && !_isLoading ? _handleApplicationSubmit : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _validateForm() 
                            ? ColorGlobalVariables.brownColor 
                            : Colors.grey[400],
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        shadowColor: Colors.black.withOpacity(0.1),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "SUBMIT DEALER APPLICATION",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
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
    _garageName.dispose();
    _cameraController?.dispose();
    _faceDetector?.close();
    super.dispose();
  }
}