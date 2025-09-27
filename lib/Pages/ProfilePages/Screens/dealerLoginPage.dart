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
  const DealerLoginPage({super.key});

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

  // Location
  String? _selectedLocation;
  Position? _currentPosition;

  // UI states
  bool isLoading = false;

  // Camera & ML
  CameraController? _cameraController;
  FaceDetector? _faceDetector;
  final ImagePicker _picker = ImagePicker();

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
      final cameras = await availableCameras();
      _cameraController = CameraController(
        cameras.firstWhere((cam) => cam.lensDirection == CameraLensDirection.front),
        ResolutionPreset.high,
      );

      await _cameraController!.initialize();
      final image = await _cameraController!.takePicture();
      final inputImage = InputImage.fromFilePath(image.path);
      final faces = await _faceDetector!.processImage(inputImage);

      if (faces.isEmpty) {
        showCustomSnackBar(
          title: "Error",
          message: "No face detected in the selfie. Please try again.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        return;
      }

      setState(() {
        _selfieImage = File(image.path);
        _isSelfieCaptured = true;
      });
      Get.back();
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "Failed to capture selfie: $e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      _cameraController?.dispose();
    }
  }

  void _openSelfieCamera() {
    Get.to(
      Scaffold(
        appBar: AppBar(
          title: const Text("Take Selfie"),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: _takeSelfie,
            ),
          ],
        ),
        body: _cameraController != null && _cameraController!.value.isInitialized
            ? CameraPreview(_cameraController!)
            : const Center(child: CircularProgressIndicator()),
      ),
    );
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
        setState(() => _companyDocument = File(file.path));
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
    required String label,
    required IconData icon,
    required bool isCaptured,
    required File? file,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: isCaptured ? Colors.green : Colors.grey,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(icon, color: isCaptured ? Colors.green : Colors.grey),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    isCaptured ? "Captured!" : "Tap to upload",
                    style: TextStyle(
                      color: isCaptured ? Colors.green : Colors.grey[600],
                    ),
                  ),
                ),
                Icon(Icons.camera_alt_outlined,
                    color: isCaptured ? Colors.green : Colors.grey),
              ],
            ),
          ),
        ),
        if (isCaptured && file != null) ...[
          const SizedBox(height: 8),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Image.file(file, fit: BoxFit.cover),
          ),
        ]
      ],
    );
  }

  // ================== SUBMIT ==================
  bool _validateForm() {
    return _garageName.text.isNotEmpty &&
        (_currentPosition != null || _selectedLocation != null) &&
        _isSelfieCaptured &&
        _isFrontCaptured &&
        _isBackCaptured &&
        _companyDocument != null;
  }

  Future<void> _submitApplication() async {
    if (!_formKey.currentState!.validate() || !_validateForm()) {
      showCustomSnackBar(
        title: "Validation Error",
        message: "Please complete all fields and upload all documents.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    setState(() => isLoading = true);

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
        // Navigate to dashboard
        // Get.offAllNamed(RouteClass.getDealerDashboard());
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
      setState(() => isLoading = false);
    }
  }

  // ================== BUILD ==================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Dealer Registration"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Register your dealership",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                      "Upload your garage details and documents to get verified."),
                  const SizedBox(height: 25),

                  // Garage name
                  TitleWithTextformfieldComponent(
                    title: "Garage/Dealership Name",
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black,
                    obscureText: false,
                    textSize: 14,
                    borderRadius: 10,
                    cursorColor: ColorGlobalVariables.maroonColor,
                    iconSize: 23,
                    focusedBorderColor: ColorGlobalVariables.maroonColor,
                    fillColor: Colors.white,
                    backgroundColor: Colors.white,
                    enabledBorderColor: Colors.grey,
                    borderWidth: 0.5,
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
                    title: "Location",
                    textSize: 14,
                    iconSize: 23,
                    borderRadius: 10,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black,
                    obscureText: true,
                    borderColor: Colors.grey,
                    isTitleWithContainerWidgetRequired: true,
                    hintText: _currentPosition != null
                        ? "Lat: ${_currentPosition!.latitude.toStringAsFixed(4)}, "
                          "Lng: ${_currentPosition!.longitude.toStringAsFixed(4)}"
                        : _selectedLocation ?? "Enter your garage location",
                    isIconAtFrontRequiredOfContainerWidgetRequired: true,
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: true,
                    isFieldHeightRequired: false,
                    onTitleWithContainerWidgetClickFunction: () async {
                      final result =
                          await Get.toNamed(RouteClass.getLocationSearchPage());
                      if (result != null) {
                        setState(() {
                          _currentPosition = result['position'];
                          _selectedLocation = result['locationName'];
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  // Selfie
                  _buildDocumentSection(
                    label: "Take Selfie for Verification",
                    icon: Icons.camera_alt_outlined,
                    isCaptured: _isSelfieCaptured,
                    file: _selfieImage,
                    onTap: _openSelfieCamera,
                  ),
                  const SizedBox(height: 20),

                  // National ID front
                  _buildDocumentSection(
                    label: "National ID (Front)",
                    icon: Icons.credit_card,
                    isCaptured: _isFrontCaptured,
                    file: _nationalIdFront,
                    onTap: () => _captureNationalId(true),
                  ),
                  const SizedBox(height: 20),

                  // National ID back
                  _buildDocumentSection(
                    label: "National ID (Back)",
                    icon: Icons.credit_card_outlined,
                    isCaptured: _isBackCaptured,
                    file: _nationalIdBack,
                    onTap: () => _captureNationalId(false),
                  ),
                  const SizedBox(height: 20),

                  // Company doc
                  _buildDocumentSection(
                    label: "Company Registration Documents",
                    icon: Icons.description_outlined,
                    isCaptured: _companyDocument != null,
                    file: _companyDocument,
                    onTap: _pickCompanyDocument,
                  ),
                  const SizedBox(height: 30),

                  // Submit
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _submitApplication,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorGlobalVariables.brownColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "SUBMIT APPLICATION",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                    ),
                  )
                ],
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
