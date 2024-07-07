import 'package:iattend/model/user_model.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

/// The function `extractFaceFeatures` takes an input image and a face detector, processes the image to
/// detect faces, and returns the extracted facial features of the first detected face.
///
/// Args:
///   inputImage (InputImage): The `inputImage` parameter is an instance of the `InputImage` class,
/// which represents the image from which you want to extract face features. It contains the image data
/// and metadata.
///   faceDetector (FaceDetector): The `faceDetector` parameter is an instance of the `FaceDetector`
/// class from the `google_mlkit_face_detection` package. It is used to detect faces in an input image.
///
/// Returns:
///   The function `extractFaceFeatures` returns a `Future` of type `FaceFeatures`.
Future<FaceFeatures> extractFaceFeatures(InputImage inputImage, FaceDetector faceDetector) async {
  List<Face> faceList = await faceDetector.processImage(inputImage);
  Face face = faceList.first;

  /// Landmarks of the faces
  FaceFeatures faceFeatures = FaceFeatures(
    rightEar: Points(x: (face.landmarks[FaceLandmarkType.rightEar])?.position.x, y: (face.landmarks[FaceLandmarkType.rightEar])?.position.y),
    leftEar: Points(x: (face.landmarks[FaceLandmarkType.leftEar])?.position.x, y: (face.landmarks[FaceLandmarkType.leftEar])?.position.y),
    rightMouth: Points(x: (face.landmarks[FaceLandmarkType.rightMouth])?.position.x, y: (face.landmarks[FaceLandmarkType.rightMouth])?.position.y),
    leftMouth: Points(x: (face.landmarks[FaceLandmarkType.leftMouth])?.position.x, y: (face.landmarks[FaceLandmarkType.leftMouth])?.position.y),
    rightEye: Points(x: (face.landmarks[FaceLandmarkType.rightEye])?.position.x, y: (face.landmarks[FaceLandmarkType.rightEye])?.position.y),
    leftEye: Points(x: (face.landmarks[FaceLandmarkType.leftEye])?.position.x, y: (face.landmarks[FaceLandmarkType.leftEye])?.position.y),
    rightCheek: Points(x: (face.landmarks[FaceLandmarkType.rightCheek])?.position.x, y: (face.landmarks[FaceLandmarkType.rightCheek])?.position.y),
    leftCheek: Points(x: (face.landmarks[FaceLandmarkType.leftCheek])?.position.x, y: (face.landmarks[FaceLandmarkType.leftCheek])?.position.y),
    noseBase: Points(x: (face.landmarks[FaceLandmarkType.noseBase])?.position.x, y: (face.landmarks[FaceLandmarkType.noseBase])?.position.y),
    bottomMouth: Points(x: (face.landmarks[FaceLandmarkType.bottomMouth])?.position.x, y: (face.landmarks[FaceLandmarkType.bottomMouth])?.position.y),
  );

  return faceFeatures;
}
