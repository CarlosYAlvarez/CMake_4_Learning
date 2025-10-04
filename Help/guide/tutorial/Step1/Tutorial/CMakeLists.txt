cmake_minimum_required(VERSION 3.23)

project(Tutorial_Project)

set(TARGET Tutorial_Program)

add_executable(${TARGET})

target_sources(${TARGET}
    PRIVATE
        Tutorial.cxx
)

target_link_libraries(${TARGET}
    PRIVATE
        MathFunctions
)