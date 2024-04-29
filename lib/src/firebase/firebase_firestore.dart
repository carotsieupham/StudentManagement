
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {

  static Future<void> addStudent(
      String name, String classID, String mssv) async {
    // Thêm sinh viên vào bảng student
    await FirebaseFirestore.instance.collection('student').add({
      'name': name,
      'classid': classID,
      'mssv': mssv
    });
  }

  static Future<void> deleteStudent(String studentsId) async {
    try {
      await FirebaseFirestore.instance.collection('student').doc(studentsId).delete();
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
  static Future<String> getClassName(String studentID) async {
    String className = "";

    // Lấy thông tin sinh viên dựa trên StudentID
    DocumentSnapshot studentSnapshot = await FirebaseFirestore.instance
        .collection('student')
        .doc(studentID)
        .get();

    if (studentSnapshot.exists) {
      // Lấy ClassID từ kết quả truy vấn
      String? classID = studentSnapshot.get('classid');

      if (classID != null) {
        // Thực hiện truy vấn để lấy thông tin lớp từ classid
        QuerySnapshot classQuerySnapshot = await FirebaseFirestore.instance
            .collection('class')
            .where('classId', isEqualTo: classID)
            .get();

        if (classQuerySnapshot.docs.isNotEmpty) {
          // Lấy ClassName từ kết quả truy vấn
          className = classQuerySnapshot.docs[0].get('name');
        }
      }
    }

    return className;
  }

  static Future<void> getGrades(List<Map<String, dynamic>> _data) async{
    try{
      await FirebaseFirestore.instance
         .collection('studentGrades')
         .get().then((QuerySnapshot querySnapshot) {
           querySnapshot.docs.forEach((doc) {
             Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
             _data.add({
               'mssv':data['mssv'],
               'grades':data['grades'],
               'subjectId':data['subjectId']
             });
           });

     });
    }
    catch(e){
      print('Error getting document: $e');
    }
  }

  static Future<String> getSubjectName(String subjectID) async {
    String subjectName = "";

    // Lấy thông tin môn học dựa trên SubjectID
    final subjectSnapshot = await FirebaseFirestore.instance
        .collection('subject')
        .where('subjectId', isEqualTo: subjectID)
        .get();


      // Lấy SubjectName từ kết quả truy vấn
      subjectName = subjectSnapshot.docs[0].get('name');

    return subjectName;
  }
}
