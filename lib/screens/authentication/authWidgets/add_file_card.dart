import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/screens/authentication/signup/controller/signUpController.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';
import 'package:image_picker/image_picker.dart';

class AddFileCard extends StatefulWidget {
  final String title;
  final bool forCamera;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<File>? file;
  final File selectedFile;
  const AddFileCard(
      {super.key,
      required this.title,
      this.onChanged,
      required this.forCamera,
      required this.file,
      required this.selectedFile});

  @override
  State<AddFileCard> createState() => _AddFileCardState();
}

class _AddFileCardState extends State<AddFileCard> {
  File? _image;

  Future<void> _pickFile() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        widget.file!(_image!);
      });
    }
  }

  Future<void> _pickFromCamera() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        widget.file!(_image!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.forCamera ? _pickFromCamera : _pickFile,
        child: DottedBorder(
          color: AppColors.redGradient,
          strokeWidth: 1,
          dashPattern: const [3, 5],
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          child: SizedBox(
            height: 70,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_image == null)
                    widget.selectedFile == null
                        ? Text(
                            widget.title,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.redGradient),
                          )
                        : Container(
                            height: 70,
                            child: Image.file(
                              widget.selectedFile,
                              fit: BoxFit.contain,
                            ),
                          ),
                  if (_image != null)
                    Container(
                      height: 70,
                      child: Image.file(
                        _image!,
                        fit: BoxFit.contain,
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
