import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:path_provider/path_provider.dart';

class DealerLoginPage extends StatefulWidget {
  const DealerLoginPage({super.key});

  @override
  State<DealerLoginPage> createState() => _DealerLoginPageState();
}

class _DealerLoginPageState extends State<DealerLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _garageName = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  
  // Document files
  File? _selfieImage;
  File? _nationalIdFront;
  File? _nationalIdBack;
  File? _companyDocument;
  
  // Document capture states
  bool _isFrontCaptured = false;
  bool _isBackCaptured = false;
  bool _isSelfieCaptured = false;
  
  // Location
  String? _selectedLocation;
  Position? _currentPosition;
  
  // UI states
  bool isLoading = false;
  String? errorMessage;
  
  // Camera controllers
  CameraController? _cameraController;
  FaceDetector? _faceDetector;
  bool _isFaceDetected = false;
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
        Get.snackbar('Error', 'No face detected in the image');
        return;
      }
      
      setState(() {
        _selfieImage = File(image.path);
        _isSelfieCaptured = true;
      });
      Get.back();
      
    } catch (e) {
      Get.snackbar('Error', 'Failed to capture image: ${e.toString()}');
    } finally {
      _cameraController?.dispose();
    }
  }

  void _openSelfieCamera() {
    Get.to(
      Scaffold(
        appBar: AppBar(
          title: const Text('Take Selfie'),
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
        maxWidth: 2000,
        maxHeight: 2000,
        imageQuality: 90,
      );

      if (image == null) return;

      // Process with edge detection
      final tempDir = await getTemporaryDirectory();
      final outputPath = '${tempDir.path}/id_${isFront ? 'front' : 'back'}_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final success = await EdgeDetection.detectEdge(
        outputPath,
        canUseGallery: true,
        androidScanTitle: "Scan ID ${isFront ? 'Front' : 'Back'}",
        androidCropTitle: "Adjust Corners",
        androidCropBlackWhiteTitle: "B&W Filter",
        androidCropReset: "Reset Edges",
      );

      if(success){
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
          message: "ID ${isFront ? 'front' : 'back'} captured successfully",
          textColor: ColorGlobalVariables.whiteColor,
          backgroundColor: ColorGlobalVariables.blueColor,
        );
      } else {
        showCustomSnackBar(
          title: "Cancelled",
          message: "Document scan was cancelled",
          textColor: ColorGlobalVariables.whiteColor,
          backgroundColor: Colors.orange,
        );
      }

    } catch (e) {
      showCustomSnackBar(
        title: "Cancelled",
        message: "Document scan was cancelled",
        textColor: ColorGlobalVariables.whiteColor,
      );
      // Get.snackbar('Error', 'Failed to capture ID: ${e.toString()}');
    }
  }

  // ================== DOCUMENT UPLOAD WIDGETS ==================
  Widget _buildSelfieUpload() {
    return _buildDocumentSection(
      label: "Take Selfie for Verification",
      icon: Icons.camera_alt_outlined,
      isCaptured: _isSelfieCaptured,
      file: _selfieImage,
      onTap: _openSelfieCamera,
    );
  }

  Widget _buildNationalIdUpload(bool isFront) {
    return _buildDocumentSection(
      label: isFront ? "National ID (Front)" : "National ID (Back)",
      icon: isFront ? Icons.credit_card : Icons.credit_card_outlined,
      isCaptured: isFront ? _isFrontCaptured : _isBackCaptured,
      file: isFront ? _nationalIdFront : _nationalIdBack,
      onTap: () => _captureNationalId(isFront),
    );
  }

  Widget _buildCompanyDocUpload() {
    return _buildDocumentSection(
      label: "Company Registration Documents",
      icon: Icons.description_outlined,
      isCaptured: _companyDocument != null,
      file: _companyDocument,
      onTap: _pickCompanyDocument,
    );
  }

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
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isCaptured ? Colors.green : Colors.grey[300]!,
                width: isCaptured ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: isCaptured ? Colors.green : Colors.grey[500]),
                const SizedBox(width: 12),
                Text(
                  isCaptured ? 'Captured!' : 'Tap to capture',
                  style: TextStyle(
                    color: isCaptured ? Colors.green : Colors.grey[600],
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.camera_alt_outlined,
                  color: isCaptured ? Colors.green : Colors.grey[500],
                ),
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
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Image.file(file, fit: BoxFit.cover),
          ),
        ],
      ],
    );
  }

  Future<void> _pickCompanyDocument() async {
    try {
      final file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        setState(() => _companyDocument = File(file.path));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick document: ${e.toString()}');
    }
  }

  // ================== MAIN BUILD ==================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Get.back(),
        ),
        backgroundColor: ColorGlobalVariables.whiteColor,
        title: const Text("Dealer Registration",
          style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Register your dealership",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Upload your garage details and documents to get verified as a dealer",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),

              // Garage Name
              TitleWithTextformfieldComponent(
                title: "Garage/Dealership Name", 
                fontWeight: FontWeight.bold, 
                textColor: ColorGlobalVariables.blackColor, 
                obscureText: false,
                textSize: 14,
                borderRadius: 10,
                cursorColor: ColorGlobalVariables.maroonColor,
                iconSize: 23,
                focusedBorderColor: ColorGlobalVariables.maroonColor,
                fillColor: ColorGlobalVariables.whiteColor,
                backgroundColor: ColorGlobalVariables.whiteColor,
                enabledBorderColor: ColorGlobalVariables.fadedBlackColor.withOpacity(0.5),
                borderWidth: 0.2,
                prefixIconData: Icons.business_outlined,
                fieldWidth: double.infinity,
                isTitleWithContainerWidgetRequired: false, 
                hintText: "Enter your garage name", 
                isSuffixIconRequired: false, 
                isPrefixIconRequired: true, 
                isFieldHeightRequired: false,
              ),
              const SizedBox(height: 20),

              // Location
              TitleWithTextformfieldComponent(
                title: "Location", 
                textSize: 14,
                iconSize: 23,
                backgroundColor: ColorGlobalVariables.whiteColor,
                borderRadius: 10,
                fontWeight: FontWeight.bold, 
                textColor: ColorGlobalVariables.blackColor, 
                obscureText: true, 
                borderColor: ColorGlobalVariables.fadedBlackColor,
                isTitleWithContainerWidgetRequired: true,
                hintText: _currentPosition != null
                  ? "Lat: ${_currentPosition!.latitude.toStringAsFixed(4)}, Lng: ${_currentPosition!.longitude.toStringAsFixed(4)}" 
                  : _selectedLocation ?? "Enter your garage location", 
                isIconAtFrontRequiredOfContainerWidgetRequired: true,
                isSuffixIconRequired: false, 
                isPrefixIconRequired: true, 
                isFieldHeightRequired: false,
                onTitleWithContainerWidgetClickFunction: () async {
                  final result = await Get.toNamed(
                    RouteClass.getLocationSearchPage(),
                  );
                  if (result != null) {
                    setState(() {
                      _currentPosition = result['position'];
                      _selectedLocation = result['locationName'];
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // Selfie Upload
              _buildSelfieUpload(),
              const SizedBox(height: 20),

              // National ID Front
              _buildNationalIdUpload(true),
              const SizedBox(height: 20),

              // National ID Back
              _buildNationalIdUpload(false),
              const SizedBox(height: 20),

              // Company Documents
              _buildCompanyDocUpload(),
              const SizedBox(height: 40),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _validateForm() ? _submitApplication : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorGlobalVariables.brownColor,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "SUBMIT APPLICATION",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    return _garageName.text.isNotEmpty &&
        (_currentPosition != null || _selectedLocation != null) &&
        _isSelfieCaptured &&
        _isFrontCaptured &&
        _isBackCaptured &&
        _companyDocument != null;
  }

  Future<void> _submitApplication() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoading = true);
    try {
      
      // Upload all files and form data
      await Future.delayed(const Duration(seconds: 2)); // Simulate network call
      
      // Get.offAllNamed(RouteClass.getDealerDashboard());
    } catch (e) {
      setState(() => errorMessage = e.toString());
      showCustomSnackBar(
        title: "Error",
        message: "Submission failed: $e",
      );
      // Get.snackbar('Error', 'Submission failed: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _garageName.dispose();
    _locationController.dispose();
    _cameraController?.dispose();
    _faceDetector?.close();
    super.dispose();
  }
}