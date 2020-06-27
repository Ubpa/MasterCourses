Ubpa_DownloadZip_Pro(
	https://cdn.jsdelivr.net/gh/Ubpa/UData@master/common/eigen/eigen_3_3_7.zip
	eigen_3_3_7.zip
	"${CMAKE_CURRENT_LIST_DIR}/_deps"
	SHA256 6D5CBC4C70A7B175439DEE0942C6794EB454493D3585973F7D4976D0820321E2
)

Ubpa_GetTargetName(common "${PROJECT_SOURCE_DIR}/src/common")
Ubpa_GetTargetName(trimesh "${PROJECT_SOURCE_DIR}/src/trimesh")
Ubpa_AddTarget(
  TEST
  MODE EXE
  INC
    "src/app/_deps"
  LIB
    ${common}
    ${trimesh}
)
