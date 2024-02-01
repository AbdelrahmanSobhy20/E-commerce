import 'package:e_commerce/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '../../customs/constant.dart';
import '../../customs/text_field.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController profileImageURLController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
        ),
        title: const Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.audMX4ZGbvT2_GJTx2c4GgHaHw?rs=1&pid=ImgDetMain',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text_Field(
                    icon: Icons.person,
                    text: 'First Name',
                    input: TextInputType.name,
                    controller: FirstNameController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text_Field(
                    icon: Icons.person,
                    text: 'Last Name',
                    input: TextInputType.name,
                    controller: LastNameController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text_Field(
                    icon: Icons.call,
                    text: 'Phone Number',
                    input: TextInputType.phone,
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text_Field(
                    icon: Icons.call,
                    text: 'Profile Image URL',
                    input: TextInputType.url,
                    controller: profileImageURLController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Constants.primaryColor),
                        minimumSize: MaterialStatePropertyAll(Size(330, 50)),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()));
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
