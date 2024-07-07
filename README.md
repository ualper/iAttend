# iAttend

* IATTEND is my Gebze Technical University Graduation project with subject "LOCAL AUTHENTICATION WITH FACE DETECTION"


<img width="725" alt="image" src="https://github.com/ualper/iAttend/assets/55507463/b8414e24-f886-4cc6-9955-adbc93f09f14">

<br><br>
## ABSTRACT
This graduation project proposes the implementation of an advanced mobile- based attendance tracking system using Flutter for university lecture halls and class- rooms. The system integrates cutting-edge facial recognition technology and meticu- lous location verification processes to ensure precise attendance management.
In the proposed system, the instructor initiates the attendance process from their computer, prompting students to capture selfies using their mobile phones. A key distinguishing feature is the autonomous execution of the facial recognition process entirely within the mobile application, thereby minimizing any operational impact on the instructor’s system.

The mobile application, developed exclusively with Flutter, exhibits a high de- gree of autonomy, handling intricate facial recognition tasks efficiently. Furthermore, the system employs rigorous location verification, cross-referencing the instructor’s computer location as a benchmark to confirm the physical presence of students in the designated lecture hall or classroom.

A paramount aspect of the system involves secure user registration, requiring students to capture initial selfie photos during their inaugural use of the application. These photos serve as a foundational reference for subsequent logins, ensuring a robust and personalized verification mechanism. The verified attendance data seamlessly integrates with the instructor’s system, providing real-time insights into attendance metrics.

This project, structured across various developmental phases, including facial recognition algorithm refinement, location verification optimization, and user interface design, sets ambitious success criteria. These criteria, anchored in measurable bench- marks such as face recognition accuracy and prompt location verification, underscore the project’s commitment to efficiency and reliability. The systematic approach adopted in this endeavor aims to redefine conventional attendance tracking mechanisms, offer- ing an advanced, secure, and user-friendly solution tailored for academic institutions. The comprehensive presentation will delve into the intricacies of the project, covering its architectural scheme, detailed design plan, specific requirements, success criteria, and the sources integral to its realization.

#### Keywords: Facial Recognition, Location Verification, Attendance Management


<br><br>
## Project Design Plan

<img width="899" alt="image" src="https://github.com/ualper/iAttend/assets/55507463/8ab52cae-e430-4813-bb73-3ebc8ee22e00">

<br><br>
## Project Timeline

<img width="870" alt="image" src="https://github.com/ualper/iAttend/assets/55507463/0385f0e6-1586-47d9-9019-ac61cd8a777e">

<br><br>
## Face Authentication with Google ML Kit

<img width="874" alt="image" src="https://github.com/ualper/iAttend/assets/55507463/843834cf-e849-4f67-941c-76dc1c4ad397">

<br><br>
## Face Contour Detection

<img width="863" alt="image" src="https://github.com/ualper/iAttend/assets/55507463/6758ade8-cb55-4489-9a34-552cd400a645">

<br><br>
# Location and Time Verification

## Verify Location

The `verifyLocation()` function verifies if a student is within a certain distance of an instructor's location. 

**Parameters:**
- `instructorLatitude`: Latitude of the instructor’s location.
- `instructorLongitude`: Longitude of the instructor’s location.
- `studentLatitude`: Latitude of the student’s location.
- `studentLongitude`: Longitude of the student’s location.

**Functionality:**
- Uses the Geolocator package to get the current position of the instructor.
- Calculates the distance between the instructor and student locations using `distanceBetween()`.
- Returns `true` if the distance is less than a specified threshold, otherwise returns `false`.

## Verify Time

The `verifyTime()` function checks if the current time of the instructor matches the student's time.

**Parameters:**
- `instructorTime`: Current time of the instructor.
- `studentTime`: Current time of the student.

**Functionality:**
- Compares the year, month, day, hour, and minute of both times.
- Returns `true` if they match, otherwise returns `false`.

## Verify Location and Time

The `verifyLocationAndTime()` function combines location and time verification.

**Parameters:**
- `instructorLatitude`: Latitude of the instructor’s location.
- `instructorLongitude`: Longitude of the instructor’s location.
- `studentLatitude`: Latitude of the student’s location.
- `studentLongitude`: Longitude of the student’s location.

**Functionality:**
- Calls `verifyLocation()` to check the student’s location.
- If location verification passes, calls `verifyTime()` to check the student’s time.
- Returns `true` if both verifications pass, otherwise returns `false`.

**Example:**
- Instructor’s location: `(41.0088, 28.9784)`
- Student’s location: `(41.0089, 28.9785)` 
  - `verifyLocation()` returns `true` (distance < 50 meters).
- Instructor’s time: `2024-01-25T23:13:00+03:00`
- Student’s time: `2024-01-25T23:13:00+03:00`
  - `verifyTime()` returns `true` (times match).



<br><br>
## Database Usage

### faceFeatures JSON Object

The database contains a JSON object under the `faceFeatures` key, representing the facial features used by the facial recognition algorithm.

### Properties of faceFeatures

- `bottomMouth`: Coordinates of the bottom lip features.
- `leftMouth`: Coordinates of the left lip features.
- `rightMouth`: Coordinates of the right lip features.
- `leftCheek`: Coordinates of the left cheek features.
- `rightEye`: Coordinates of the right eye features.
- `leftEye`: Coordinates of the left eye features.
- `noseBase`: Coordinates of the nose base.
- `leftEar`: Coordinates of the left ear.
- `rightEar`: Coordinates of the right ear.
- `rightCheek`: Coordinates of the right cheek features.

### Functionality

These properties represent the coordinates used by the facial recognition algorithm to identify facial features. For example, the `bottomMouth` property contains the coordinates of the bottom lip, which helps the algorithm identify the bottom lip accurately.

### Reliability

The `faceFeatures` object demonstrates the accuracy of the facial recognition algorithm in identifying facial features, even when a person is wearing a mask. This enhances the reliability of facial recognition technology for security and authentication applications.

<img width="869" alt="image" src="https://github.com/ualper/iAttend/assets/55507463/3e0f8cf4-048b-4b93-8b04-bd7a48c05b36">

<br><br>
## CONCLUSION
In conclusion, the advanced mobile-based attendance tracking system proposed in this graduation project represents a groundbreaking solution for university lecture halls and classrooms. Developed using Flutter, the system integrates cutting-edge facial recognition technology and meticulous location verification processes to redefine attendance management in educational settings.
The core innovation lies in the autonomous execution of facial recognition en- tirely within the mobile application, minimizing operational impact on the instructor’s system. This not only enhances efficiency but also ensures a seamless user experience. Leveraging Flutter’s capabilities, the mobile application demonstrates a high degree of autonomy, efficiently handling intricate facial recognition tasks.
The system’s commitment to precision extends to rigorous location verification, cross-referencing the instructor’s computer location for confirmation of students’ phys- ical presence in the designated lecture hall or classroom. The secure user registration process, requiring students to capture initial selfie photos, establishes a robust founda- tion for personalized verification in subsequent logins.
Structured across various developmental phases, including facial recognition al- gorithm refinement, location verification optimization, and user interface design, the project sets ambitious success criteria. These criteria, anchored in measurable bench- marks such as face recognition accuracy and prompt location verification, underscore the project’s commitment to efficiency and reliability.
This systematic approach aims to redefine conventional attendance tracking mech- anisms, offering an advanced, secure, and user-friendly solution tailored for academic institutions. The comprehensive presentation covers the project’s architectural scheme, detailed design plan, specific requirements, success criteria, and integral sources.
In summary, the proposed system not only addresses the challenges associated with traditional attendance tracking but also introduces a scalable, accurate, and tech- nologically advanced solution that aligns with the evolving needs of educational envi- ronments.
<br><br>
## Author
* Umut Ay ALPER  
<br><br>
<br><br>


https://github.com/ualper/iAttend/assets/55507463/96c3a22a-1d26-4e01-9ce1-6095ccb4f8f9

