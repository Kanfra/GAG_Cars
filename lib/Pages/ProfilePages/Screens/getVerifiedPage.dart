import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/sizeGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Services/GetVerifiedService/getVerifiedService.dart';
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

  // ================== QUICK CAPTURE WITHOUT FRAME ==================
  Future<void> _quickCaptureNationalId(bool isFront) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 90,
      );

      if (image == null) return;

      final File capturedImage = File(image.path);
      
      setState(() {
        if (isFront) {
          _nationalIdFront = capturedImage;
          _isFrontCaptured = true;
        } else {
          _nationalIdBack = capturedImage;
          _isBackCaptured = true;
        }
      });
      
      showCustomSnackBar(
        title: "Success",
        message: "ID ${isFront ? 'front' : 'back'} captured successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "Failed to capture ID: ${e.toString()}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // ================== GALLERY CAPTURE ==================
  Future<void> _captureFromGallery(bool isFront) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 90,
      );

      if (image == null) return;

      final File capturedImage = File(image.path);
      
      setState(() {
        if (isFront) {
          _nationalIdFront = capturedImage;
          _isFrontCaptured = true;
        } else {
          _nationalIdBack = capturedImage;
          _isBackCaptured = true;
        }
      });
      
      showCustomSnackBar(
        title: "Success",
        message: "ID ${isFront ? 'front' : 'back'} selected from gallery!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "Failed to select image: ${e.toString()}",
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
    required bool isFront,
    Color? accentColor,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
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
        
        // Capture Options
        Column(
          children: [
            _buildCaptureOptionCard(
              title: "Scan with Frame Guide",
              subtitle: "Perfect alignment assistance",
              icon: Icons.crop_free,
              isCaptured: isCaptured,
              accentColor: accentColor,
              onTap: () => _captureNationalIdWithFrame(isFront),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildCaptureOptionCard(
                    title: "Quick Camera",
                    subtitle: "Basic camera",
                    icon: Icons.photo_camera,
                    isCaptured: isCaptured,
                    accentColor: accentColor,
                    onTap: () => _quickCaptureNationalId(isFront),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildCaptureOptionCard(
                    title: "From Gallery",
                    subtitle: "Choose existing",
                    icon: Icons.photo_library,
                    isCaptured: isCaptured,
                    accentColor: accentColor,
                    onTap: () => _captureFromGallery(isFront),
                  ),
                ),
              ],
            ),
          ],
        ),
        
        if (isCaptured && file != null) ...[
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

  Widget _buildCaptureOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isCaptured,
    required Color? accentColor,
    required VoidCallback onTap,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF424242) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isCaptured 
              ? Colors.green 
              : (accentColor ?? ColorGlobalVariables.brownColor).withOpacity(0.5),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (isCaptured ? Colors.green : (accentColor ?? ColorGlobalVariables.brownColor))
                    .withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isCaptured ? Colors.green : (accentColor ?? ColorGlobalVariables.brownColor),
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isCaptured ? Colors.green : (isDarkMode ? Colors.white : Colors.black87),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: isCaptured ? Colors.green : (isDarkMode ? Colors.white60 : Colors.grey[600]),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
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

        // Navigate back to Settings page within bottom navigation
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

  // ================== NAVIGATION ==================
  void _navigateBackToSettings() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  // ================== PROGRESS INDICATOR ==================
  Widget _buildProgressStep(String label, int stepNumber, bool isCompleted) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.green : (isDarkMode ? Colors.grey[700] : Colors.grey[300]),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : Text(
                    stepNumber.toString(),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
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
            color: isCompleted ? Colors.green : (isDarkMode ? Colors.white70 : Colors.grey[600]),
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
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
      appBar: CustomAppbar(
        onLeadingIconClickFunction: () => _navigateBackToSettings(),
        isLeadingWidgetExist: true,
        leadingIconData: Icons.arrow_back_ios_new_outlined,
        leadingIconDataColor: isDarkMode ? Colors.white : Colors.black87,
        titleText: "Get Verified",
        titleTextWeight: FontWeight.bold,
        titleTextSize: 22,
        titleTextColor: isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
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
                              Icons.verified_user_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Identity Verification",
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
                        "Complete your verification to build trust with customers and access premium features. All documents are securely processed.",
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
                    _buildProgressStep("Selfie", 1, _isSelfieCaptured),
                    _buildProgressStep("ID Front", 2, _isFrontCaptured),
                    _buildProgressStep("ID Back", 3, _isBackCaptured),
                  ],
                ),
                const SizedBox(height: 32),

                // Selfie Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1. Take a Selfie",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "We need to verify that you're a real person. Please take a clear selfie with your face clearly visible.",
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildCaptureOptionCard(
                      title: "Take Selfie",
                      subtitle: "Front camera required",
                      icon: Icons.face_retouching_natural,
                      isCaptured: _isSelfieCaptured,
                      accentColor: Colors.blue,
                      onTap: _takeSelfie,
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
                    ],
                    const SizedBox(height: 24),
                  ],
                ),

                // National ID Front
                _buildDocumentSection(
                  title: "2. National ID (Front Side)",
                  description: "Scan the front side of your government-issued ID card. Use frame guide for perfect alignment and better quality capture.",
                  icon: Icons.credit_card,
                  isCaptured: _isFrontCaptured,
                  file: _nationalIdFront,
                  isFront: true,
                  accentColor: Colors.orange,
                ),

                // National ID Back
                _buildDocumentSection(
                  title: "3. National ID (Back Side)",
                  description: "Scan the back side of your government-issued ID card. Use frame guide for perfect alignment and better quality capture.",
                  icon: Icons.credit_card_outlined,
                  isCaptured: _isBackCaptured,
                  file: _nationalIdBack,
                  isFront: false,
                  accentColor: Colors.purple,
                ),

                const SizedBox(height: 24),

                // Scanning Instructions
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.orange.withOpacity(0.1) : Colors.orange.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: isDarkMode ? Colors.orange.withOpacity(0.3) : Colors.orange.withOpacity(0.2)),
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
                    border: Border.all(color: isDarkMode ? Colors.blue.withOpacity(0.3) : Colors.blue.withOpacity(0.2)),
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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

// Helper function to show snackbar (you might need to adjust this based on your implementation)
void showCustomSnackBar({
  required String title,
  required String message,
  required Color backgroundColor,
  required Color textColor,
}) {
  // This would typically use your existing snackbar implementation
  // For now, using a simple implementation
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