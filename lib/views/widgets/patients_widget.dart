import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/colors.dart';
import '../../provider/main_provider.dart';
import 'buildInitial_avatar.dart';

Widget patientsWidget(BuildContext context){
  return                      Consumer<MainProvider>(
      builder: (context,value,child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PATIENTS',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6366F1),
                ),
              ),
              const SizedBox(height: 12),
              if (value.filteredDoctors.isEmpty)
                const Text(
                  'No patients found',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ...List.generate(value.filteredPatients.length, (index) {
                final patients = value.filteredPatients[index];
                return GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: index == value.filteredPatients.length - 1
                          ? 0
                          : 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              if (patients.profileImage != null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    patients.profileImage!,
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return buildInitialsAvatar(
                                        patients.initials,"patients"
                                      );
                                    },
                                  ),
                                )
                              else
                                buildInitialsAvatar(
                                  patients.initials,"patients"
                                ),
                              const SizedBox(width: 12),
                              Flexible(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          patients.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Color(0xFF111827),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),

                                        Row(
                                          children: [
                                            Text(patients.patientId,style: TextStyle(color: grey,fontSize: 10),),
                                            SizedBox(width: 5,),
                                            CircleAvatar(radius: 1,
                                                backgroundColor: grey),
                                            SizedBox(width: 5,),
                                            Text(patients.phoneNumber,style: TextStyle(color: grey,fontSize: 10))

                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 5,),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: green.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text("Checked-In",
                                          style: TextStyle(color: green,fontSize: 10),),
                                      ),
                                    )
                                    
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            value.selectPatient(value.filteredPatients[index]);

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            minimumSize: const Size(64, 32),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Book',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      }
  );

}