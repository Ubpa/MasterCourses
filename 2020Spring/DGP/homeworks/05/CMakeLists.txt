cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

project(DGP_HW05 VERSION 0.0.1)
message(STATUS "[Project] ${PROJECT_NAME}")

include(cmake/InitUCMake.cmake)
Ubpa_InitUCMake()

Ubpa_InitProject()

Ubpa_AddDep(UDXRenderer 0.0.1)
Ubpa_AddDep(UGM 0.6.5)
Ubpa_AddDep(UHEMesh 0.4.1)

Ubpa_AddSubDirsRec(src)
