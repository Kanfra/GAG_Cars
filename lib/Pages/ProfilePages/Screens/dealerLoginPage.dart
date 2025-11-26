import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
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
import 'package:logger/Logger.dart';
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

  // Face detection
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

  // ================== NATIONAL ID CAPTURE WITH FRAME DETECTION ==================
  Future<void> _captureNationalIdWithFrame(bool isFront) async {
    try {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IDCardCameraFrame(
            isFront: isFront,
          ),
        ),
      );

      if (result != null && result is File) {
        setState(() {
          if (isFront) {
            _nationalIdFront = result;
            _isFrontCaptured = true;
          } else {
            _nationalIdBack = result;
            _isBackCaptured = true;
          }
        });
        
        showCustomSnackBar(
          title: "Success",
          message: "ID ${isFront ? 'front' : 'back'} captured successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "Failed to capture ID: ${e.toString()}",
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

  // ================== ENHANCED DOCUMENT WIDGET ==================
  Widget _buildDocumentSection({
    required String title,
    required String description,
    required IconData icon,
    required bool isCaptured,
    required File? file,
    required bool isFront,
    Color? accentColor,
    required bool isDarkMode,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        
        // Single Capture Option - Scan with Frame Guide
        InkWell(
          onTap: () => _captureNationalIdWithFrame(isFront),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF424242) : Colors.white,
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
                  isCaptured ? "Successfully Captured!" : "Scan with Frame Guide",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isCaptured ? Colors.green : (isDarkMode ? Colors.white : Colors.black87),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isCaptured ? "Perfect alignment achieved" : "Perfect alignment assistance",
                  style: TextStyle(
                    fontSize: 14,
                    color: isCaptured ? Colors.green : (isDarkMode ? Colors.white60 : Colors.grey[600]),
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
              border: Border.all(
                color: isDarkMode ? Colors.grey[700]! : Colors.grey.shade300,
              ),
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
                    color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    child: Icon(
                      Icons.error_outline, 
                      color: isDarkMode ? Colors.grey[400] : Colors.grey
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => _captureNationalIdWithFrame(isFront),
              icon: Icon(
                Icons.camera_alt, 
                size: 18,
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
              label: Text(
                "Rescan",
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  // ================== COMPANY DOCUMENT WIDGET ==================
  Widget _buildCompanyDocumentSection({
    required bool isDarkMode,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "4. Company Registration Document",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Upload your business registration certificate or company documents.",
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: _pickCompanyDocument,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF424242) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isCompanyDocCaptured 
                  ? Colors.green 
                  : Colors.teal,
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
                    color: (_isCompanyDocCaptured ? Colors.green : Colors.teal)
                        .withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.description_outlined,
                    color: _isCompanyDocCaptured ? Colors.green : Colors.teal,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _isCompanyDocCaptured ? "Successfully Uploaded!" : "Tap to Upload",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _isCompanyDocCaptured ? Colors.green : (isDarkMode ? Colors.white : Colors.black87),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _isCompanyDocCaptured ? "Ready for verification" : "Choose company document",
                  style: TextStyle(
                    fontSize: 14,
                    color: _isCompanyDocCaptured ? Colors.green : (isDarkMode ? Colors.white60 : Colors.grey[600]),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        if (_isCompanyDocCaptured && _companyDocument != null) ...[
          const SizedBox(height: 16),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDarkMode ? Colors.grey[700]! : Colors.grey.shade300,
              ),
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
                _companyDocument!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.description,
                          color: isDarkMode ? Colors.grey[400] : Colors.grey,
                          size: 50,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Document Preview",
                          style: TextStyle(
                            color: isDarkMode ? Colors.grey[400] : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _pickCompanyDocument,
              icon: Icon(
                Icons.edit, 
                size: 18,
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
              label: Text(
                "Choose Different File",
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  // ================== SELFIE DOCUMENT WIDGET ==================
  Widget _buildSelfieSection({
    required bool isDarkMode,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "1. Business Owner Selfie",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Take a clear selfie to verify your identity as the business owner.",
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: _takeSelfie,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF424242) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isSelfieCaptured 
                  ? Colors.green 
                  : Colors.blue,
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
                    color: (_isSelfieCaptured ? Colors.green : Colors.blue)
                        .withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.face_retouching_natural,
                    color: _isSelfieCaptured ? Colors.green : Colors.blue,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _isSelfieCaptured ? "Successfully Captured!" : "Take Selfie",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _isSelfieCaptured ? Colors.green : (isDarkMode ? Colors.white : Colors.black87),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _isSelfieCaptured ? "Face verified successfully" : "Front camera required",
                  style: TextStyle(
                    fontSize: 14,
                    color: _isSelfieCaptured ? Colors.green : (isDarkMode ? Colors.white60 : Colors.grey[600]),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        if (_isSelfieCaptured && _selfieImage != null) ...[
          const SizedBox(height: 16),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isDarkMode ? Colors.grey[700]! : Colors.grey.shade300),
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
                _selfieImage!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    child: Icon(
                      Icons.error_outline, 
                      color: isDarkMode ? Colors.grey[400] : Colors.grey
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _takeSelfie,
              icon: Icon(
                Icons.camera_alt, 
                size: 18,
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
              label: Text(
                "Retake",
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  // ================== PROGRESS INDICATOR ==================
  Widget _buildProgressStep(String label, int stepNumber, bool isCompleted, bool isDarkMode) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.green : (isDarkMode ? Colors.grey[700] : Colors.grey[300]),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    stepNumber.toString(),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
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
            color: isCompleted ? Colors.green : (isDarkMode ? Colors.white70 : Colors.grey[600]),
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
        
        // Simple pop back to Settings page after success
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        });
      } else {
        logger.e("Error is: ${response.message}");
        showCustomSnackBar(
          title: "Error",
          message: response.message.toString(),
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
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
      appBar: AppBar(
        title: Text(
          "Dealer Registration",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
        foregroundColor: isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
          onPressed: () => Get.back(),
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
                        colors: isDarkMode
                            ? [
                                Colors.grey[800]!,
                                Colors.grey[700]!,
                              ]
                            : [
                                ColorGlobalVariables.brownColor.withOpacity(0.1),
                                ColorGlobalVariables.maroonColor.withOpacity(0.05),
                              ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode ? Colors.grey[600]! : ColorGlobalVariables.brownColor.withOpacity(0.2),
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
                            Expanded(
                              child: Text(
                                "Dealer Registration",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.white : Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Register your dealership to access premium features and reach more customers. Complete all steps to get verified.",
                          style: TextStyle(
                            fontSize: 14,
                            color: isDarkMode ? Colors.white70 : Colors.grey,
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
                      _buildProgressStep("Business", 1, _garageName.text.isNotEmpty && (_currentPosition != null || _selectedLocation != null), isDarkMode),
                      _buildProgressStep("Selfie", 2, _isSelfieCaptured, isDarkMode),
                      _buildProgressStep("ID Front", 3, _isFrontCaptured, isDarkMode),
                      _buildProgressStep("ID Back", 4, _isBackCaptured, isDarkMode),
                      _buildProgressStep("Company", 5, _isCompanyDocCaptured, isDarkMode),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Business Information Section
                  Text(
                    "Business Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Tell us about your dealership business",
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Garage name
                  TitleWithTextformfieldComponent(
                    title: "Garage/Dealership Name",
                    fontWeight: FontWeight.w600,
                    textColor: isDarkMode ? Colors.white : Colors.black87,
                    obscureText: false,
                    textSize: 14,
                    borderRadius: 12,
                    cursorColor: ColorGlobalVariables.maroonColor,
                    iconSize: 22,
                    focusedBorderColor: ColorGlobalVariables.maroonColor,
                    fillColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
                    backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
                    enabledBorderColor: isDarkMode ? Colors.grey[600]! : Colors.grey.shade300,
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
                    textColor: isDarkMode ? Colors.white : Colors.black87,
                    obscureText: false,
                    borderColor: isDarkMode ? Colors.grey[600]! : Colors.grey.shade300,
                    isTitleWithContainerWidgetRequired: true,
                    hintText: _currentPosition != null
                        ? "Lat: ${_currentPosition!.latitude.toStringAsFixed(4)}, Lng: ${_currentPosition!.longitude.toStringAsFixed(4)}"
                        : _selectedLocation ?? "Select your business location",
                    isIconAtFrontRequiredOfContainerWidgetRequired: true,
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: true,
                    isFieldHeightRequired: false,
                    fillColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
                    backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
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
                  Text(
                    "Verification Documents",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Upload required documents for verification",
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Selfie Section
                  _buildSelfieSection(isDarkMode: isDarkMode),

                  // National ID Front
                  _buildDocumentSection(
                    title: "2. National ID (Front Side)",
                    description: "Scan the front side of your government-issued ID card. Use frame guide for perfect alignment.",
                    icon: Icons.credit_card,
                    isCaptured: _isFrontCaptured,
                    file: _nationalIdFront,
                    isFront: true,
                    accentColor: Colors.orange,
                    isDarkMode: isDarkMode,
                  ),

                  // National ID Back
                  _buildDocumentSection(
                    title: "3. National ID (Back Side)",
                    description: "Scan the back side of your government-issued ID card. Use frame guide for perfect alignment.",
                    icon: Icons.credit_card_outlined,
                    isCaptured: _isBackCaptured,
                    file: _nationalIdBack,
                    isFront: false,
                    accentColor: Colors.purple,
                    isDarkMode: isDarkMode,
                  ),

                  // Company Document
                  _buildCompanyDocumentSection(isDarkMode: isDarkMode),

                  const SizedBox(height: 24),

                  // Scanning Instructions
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.orange.withOpacity(0.1) : Colors.orange.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.orange.withOpacity(0.3) : Colors.orange.withOpacity(0.2)
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.tips_and_updates,
                          color: Colors.orange,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Scanning Tips for ID Cards",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.white : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "• Place ID card on a flat, dark surface\n• Ensure good, even lighting\n• Align the ID card within the frame guide\n• Keep camera steady and parallel to the card\n• Avoid shadows, glare, and reflections\n• Make sure all text is clear and readable",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDarkMode ? Colors.white70 : Colors.grey[700],
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Security Notice
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.blue.withOpacity(0.1) : Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.blue.withOpacity(0.3) : Colors.blue.withOpacity(0.2)
                      ),
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
                              color: isDarkMode ? Colors.white70 : Colors.grey[700],
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
                            : (isDarkMode ? Colors.grey[600] : Colors.grey[400]),
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
    _faceDetector?.close();
    super.dispose();
  }
}

// ================== ID CARD CAMERA FRAME SCREEN ==================
class IDCardCameraFrame extends StatefulWidget {
  final bool isFront;

  const IDCardCameraFrame({super.key, required this.isFront});

  @override
  State<IDCardCameraFrame> createState() => _IDCardCameraFrameState();
}

class _IDCardCameraFrameState extends State<IDCardCameraFrame> {
  late CameraController _controller;
  bool _isCameraInitialized = false;
  bool _isCardAligned = false;
  bool _isCapturing = false;
  Timer? _alignmentTimer;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _startAlignmentSimulation();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      _controller = CameraController(
        cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
          orElse: () => cameras.first,
        ),
        ResolutionPreset.medium,
      );

      await _controller.initialize();
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(
          title: "Camera Error",
          message: "Failed to initialize camera: $e",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }
  }

  void _startAlignmentSimulation() {
    // Simulate alignment detection - in real app, you'd use image analysis
    _alignmentTimer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (mounted && !_isCapturing) {
        setState(() {
          _isCardAligned = !_isCardAligned; // Simulate alignment change
        });
      }
    });
  }

  Future<void> _captureImage() async {
    if (_isCapturing || !_isCameraInitialized) return;

    setState(() => _isCapturing = true);

    try {
      final XFile image = await _controller.takePicture();
      
      // Save to temporary directory
      final tempDir = await getTemporaryDirectory();
      final String fileName = 'id_${widget.isFront ? 'front' : 'back'}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String filePath = '${tempDir.path}/$fileName';
      
      final File savedImage = await File(image.path).copy(filePath);
      
      if (mounted) {
        Navigator.pop(context, savedImage);
      }
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(
          title: "Capture Error",
          message: "Failed to capture image: $e",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        setState(() => _isCapturing = false);
      }
    }
  }

  @override
  void dispose() {
    _alignmentTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Scan ID ${widget.isFront ? 'Front' : 'Back'}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          if (_isCameraInitialized)
            CameraPreview(_controller),
          
          // Frame overlay
          _buildFrameOverlay(),
          
          // Instructions
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    _isCardAligned 
                      ? 'Perfect! Card is aligned ✅' 
                      : 'Align the ID card within the frame',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.isFront
                      ? 'Ensure the front side is clearly visible'
                      : 'Ensure the back side is clearly visible',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Capture button
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: _isCardAligned ? _captureImage : null,
                backgroundColor: _isCardAligned ? Colors.green : Colors.grey,
                child: _isCapturing
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Icon(Icons.camera_alt, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrameOverlay() {
    return Center(
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: _isCardAligned ? Colors.green : Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomPaint(
          painter: FrameGuidePainter(isAligned: _isCardAligned),
        ),
      ),
    );
  }
}

// ================== FRAME GUIDE PAINTER ==================
class FrameGuidePainter extends CustomPainter {
  final bool isAligned;
  
  FrameGuidePainter({required this.isAligned});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isAligned ? Colors.green : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final cornerLength = 25.0;
    
    // Draw corner guides
    // Top-left corner
    canvas.drawLine(Offset(0, 0), Offset(cornerLength, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(0, cornerLength), paint);
    
    // Top-right corner
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - cornerLength, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, cornerLength), paint);
    
    // Bottom-left corner
    canvas.drawLine(Offset(0, size.height), Offset(cornerLength, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - cornerLength), paint);
    
    // Bottom-right corner
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - cornerLength, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - cornerLength), paint);

    // Draw alignment guides (grid lines)
    final guidePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Vertical center line
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      guidePaint,
    );

    // Horizontal center line
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      guidePaint,
    );

    // Draw "ID CARD" text
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'ID CARD',
        style: TextStyle(
          color: isAligned ? Colors.green : Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        size.height + 10,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Helper function to show snackbar
void showCustomSnackBar({
  required String title,
  required String message,
  required Color backgroundColor,
  required Color textColor,
}) {
  final context = navigatorKey.currentContext;
  if (context != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              message,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

// You'll need to define this in your app
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();