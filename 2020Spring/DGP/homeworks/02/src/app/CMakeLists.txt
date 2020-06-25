Ubpa_GetTargetName(common "${PROJECT_SOURCE_DIR}/src/common")
Ubpa_GetTargetName(trimesh "${PROJECT_SOURCE_DIR}/src/trimesh")
Ubpa_AddTarget(
  TEST
  MODE EXE
  LIB
    ${common}
    ${trimesh}
)
