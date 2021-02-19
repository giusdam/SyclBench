cmake_minimum_required (VERSION 3.5)
project(sycl-bench)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/Modules)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
find_package(ComputeCpp REQUIRED)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/polybench/common)

set(benchmarks
  micro/arith.cpp
  micro/DRAM.cpp
  micro/host_device_bandwidth.cpp
  micro/pattern_L2.cpp
  micro/sf.cpp
  micro/local_mem.cpp
  single-kernel/median.cpp
  single-kernel/scalar_prod.cpp
  single-kernel/sobel.cpp
  single-kernel/sobel5.cpp
  single-kernel/sobel7.cpp
  single-kernel/vec_add.cpp
  single-kernel/lin_reg_error.cpp
  single-kernel/lin_reg_coeff.cpp
  single-kernel/kmeans.cpp
  single-kernel/mol_dyn.cpp
  pattern/segmentedreduction.cpp
  pattern/reduction.cpp
  runtime/dag_task_throughput_sequential.cpp
  runtime/dag_task_throughput_independent.cpp
  runtime/blocked_transform.cpp
  runtime/matmulchain.cpp
  polybench/2DConvolution.cpp
  polybench/2mm.cpp
  polybench/3DConvolution.cpp
  polybench/3mm.cpp
  polybench/atax.cpp
  polybench/bicg.cpp
  polybench/correlation.cpp
  polybench/covariance.cpp
  polybench/fdtd2d.cpp
  polybench/gemm.cpp
  polybench/gesummv.cpp
  polybench/gramschmidt.cpp
  polybench/mvt.cpp
  polybench/syr2k.cpp
  polybench/syrk.cpp
  samples/accessors.cpp
  samples/matrix-add.cpp
  samples/matrix-multiply.cpp
  samples/monte-carlo-pi.cpp
  samples/parallel-for.cpp
  samples/scan.cpp
  samples/simple-example-of-vectors.cpp
  samples/simple-vector-add.cpp
  samples/smart-pointer.cpp
  samples/template-function-object.cpp
)

foreach(benchmark IN LISTS benchmarks)
  get_filename_component(target ${benchmark} NAME_WE)

  add_executable(${target} ${benchmark})

  add_sycl_to_target(TARGET ${target} SOURCES ${benchmark})

  target_compile_definitions(${target} PRIVATE SYCL_BENCH_ENABLE_QUEUE_PROFILING)

  install(TARGETS ${target} RUNTIME DESTINATION bin/benchmarks/)
  get_filename_component(dir ${benchmark} DIRECTORY)
  set_property(TARGET ${target} PROPERTY FOLDER ${dir})
endforeach(benchmark)

# The "compiletime" target should only be used in the context of the compile time evaluation script
#set_target_properties(compiletime PROPERTIES EXCLUDE_FROM_ALL 1)

install(PROGRAMS bin/run-suite DESTINATION bin/)
install(FILES ${PROJECT_SOURCE_DIR}/Brommy.bmp DESTINATION share/)
