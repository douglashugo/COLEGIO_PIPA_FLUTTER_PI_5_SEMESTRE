import 'package:flutter/material.dart';
import 'package:riverpod_playground/pages/infoEscola.dart';
import 'package:riverpod_playground/pages/login.dart';
import 'package:riverpod_playground/pages/perfil/adm/perfilAdm.dart';
import 'package:riverpod_playground/pages/perfil/perfilAluno.dart';
import 'package:riverpod_playground/pages/perfil/perfilConta.dart';

class DrawerNavigationAdm extends StatelessWidget {
  const DrawerNavigationAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:
            // myInfo.maybeWhen(
            //   data: (myInfoData) {
            //     return
            Column(
      children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/perfil-user.png'),
          ),

          decoration: BoxDecoration(color: Colors.deepOrange),
          accountName: Text('Beatriz Oliveira'),
          accountEmail: Text('beatriz.oliveira@email.com'),

          //arrowColor: Colors.black,
        ),

        ListTile(
            leading: const Icon(
              Icons.account_circle,
              color: Colors.orange,
            ),
            title: const Text("Informações pessoais"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyProfilePageAdm(),
                ),
              );
            } //async {
            //await Navigator.of(context).pushNamed('/profilePicture', arguments: myInfoData);
            //.then((value) => Navigator.of(context).pop());
            // setState(() {
            //   FirebaseAuth.instance.currentUser;
            // });
            //},
            ),

        ListTile(
            leading: const Icon(
              // Icons.person_2_outlined,
              Icons.school,
              color: Colors.orange,
            ),
            title: const Text("Informações do Colégio"),
            //  title: const Text("Editar Perfil"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InfoEscola(),
                ),
              );
            } //async {
            //Navigator.of(context).pop();
            //await Navigator.of(context).pushNamed('/updateProfile', arguments: myInfoData);
            // ref.invalidate(getMeProvider);
            // ref.invalidate(homeAdmVmProvider);

            //showSenhaConfirmacaoDialog(context: context, email: "");
            //},
            ),

        ListTile(
          // leading: const Icon(
          //   Icons.fiber_manual_record,
          //   color: Colors.orange,
          // ),
          title: const Text(""),
          onTap: () async {
            await Navigator.of(context).pushNamed(
              '/userClinicProfile',
            );
          },
        ),

        ListTile(
          leading: const Icon(
            Icons.fiber_manual_record,
            color: Colors.orange,
          ),
          title: const Text("Alterar foto do perfil"),
          onTap: () async {
            //await Navigator.of(context).pushNamed('/userSchedulesHistory', arguments: myInfoData);
          },
        ),

        //   ListTile(
        //   leading: const Icon(
        //     // Icons.work_outline,
        //     Icons.edit,
        //     color: Colors.green,
        //   ),
        //   title: const Text("Editar Clínica"),
        //   onTap: () async{
        //     await Navigator.of(context).pushNamed('/updateClinic', arguments: clinicInfo);
        //   },
        // ),

        ListTile(
          leading: const Icon(
            Icons.fiber_manual_record,
            color: Colors.orange,
          ),
          title: const Text("Alterar senha"),
          onTap: () async {
            //Navigator.of(context).pop();
            await Navigator.of(context).pushNamed('/updatePassword');
          },
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            ///mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  //color: AppColors.colorGreen,
                  size: 32,
                ),
                title: const Text("Sair"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                ),
              ),
            ],
          ),
        ),

        // const SizedBox(
        //   height: 200,
        // ),

        // Expanded(
        //   child: Align(
        //     alignment: FractionalOffset.bottomCenter,
        //     child:
        //       InkWell(
        //         onTap: () async{
        //           //Navigator.of(context).pop();
        //           await Navigator.of(context).pushNamed('/employee/registerEmployee');
        //           // ref.invalidate(getMeProvider);
        //           // ref.invalidate(homeAdmVmProvider);
        //         },
        //         child:  const Row(
        //            mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Icon(
        //               Icons.person_add,
        //              // color: AppColors.colorGreen,
        //               size: 22
        //             ),
        //             SizedBox(
        //               width: 7,
        //             ),
        //             Text(
        //               'Adicionar Colaborador',
        //               style: TextStyle(
        //                 fontSize: 18,
        //                 //color: AppColors.colorGreen,
        //                 fontWeight: FontWeight.w600,
        //               ),
        //             ),
        //             Icon(
        //               Icons.chevron_right,
        //               //color: AppColors.colorGreen, size: 24,
        //             ),
        //           ],
        //         ),
        //       ),
        //     // ElevatedButton(
        //     //   style: ElevatedButton.styleFrom(
        //     //     minimumSize: Size.fromHeight(55),
        //     //   ),
        //     //   onPressed: () async{
        //     //     //Navigator.of(context).pop();
        //     //     await Navigator.of(context).pushNamed('/employee/registerEmployee');
        //     //     ref.invalidate(getMeProvider);
        //     //     ref.invalidate(homeAdmVmProvider);

        //     //   },
        //     //   child: Row(
        //     //     mainAxisAlignment: MainAxisAlignment.center,
        //     //     children: [
        //     //       Text('Adicionar Colaborador'),
        //     //       const SizedBox(
        //     //         width: 5,
        //     //       ),
        //     //       Icon(Icons.person_add),
        //     //     ],
        //     //   ),
        //     // ),
        //   ),
        // ),
        // const SizedBox(
        //    height: 50,
        // ),
      ],
    )
        //},
        // orElse: () {
        //   return const Center(
        //     child: AppLoader(),
        //   );
        // }
        // )
        );
  }
}
