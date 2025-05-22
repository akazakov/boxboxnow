cmake_minimum_required(VERSION 3.10)
project(CppProject VERSION 1.0)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Add executable
add_executable(main src/main.cpp)

# Include directories
target_include_directories(main PRIVATE include)

target_compile_options(main PRIVATE -Wall -Wextra -Wpedantic)
