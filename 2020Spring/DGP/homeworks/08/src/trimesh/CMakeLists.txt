UBPA_DOWNLOADZIP_PRO(
  https://cdn.jsdelivr.net/gh/Ubpa/UData@master/UScene/tiny_obj_loader.zip
  tiny_obj_loader.zip
  ${CMAKE_CURRENT_SOURCE_DIR}/_deps
  SHA256 5084FC75CD1783A68F6D9C136256C05919846DC6BB3075F55CF134A522ADB641
)

Ubpa_AddTarget(
  TEST
  MODE STATIC
  LIB
    Ubpa::UGM_core
)
