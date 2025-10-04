set(TARGET MathFuncLib)

add_library(${TARGET})

if(${CMAKE_VERSION} VERSION_GREATER_EQUAL "3.23")
  message(STATUS "CMake version is in the 3.23.x series")

  # When headers are set this way, CMake passes the directory to the compiler as an
  # include path
  target_sources(${TARGET}
      PRIVATE
          MathFunctions.cxx
          
      PUBLIC
          FILE_SET mathFunctionsHeaders
          TYPE HEADERS
          BASE_DIRS
              .
          FILES
              ./MathFunctions.h
  )
else()
    message(STATUS "CMake version is ${CMAKE_VERSION}, not 3.23.x")

    target_sources(${TARGET}
      PRIVATE
          MathFunctions.cxx
    )

    # target_include_directories() tells the compiler where to look for header files
    # when compiling your source code.
    #
    # If you want to avoid using FILE_SET, you can use the following.
    #
    # Can use ${CMAKE_CURRENT_SOURCE_DIR} OR `.`, prefer the first since this will
    # evalate to full path rather than `.` which may depend on where you're calling
    # CMake from
    target_include_directories(${TARGET}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
    )
endif()

# Tells the linker where to look for libraries when you later call target_link_libraries()
#[[
target_link_directories(${TARGET}
    PUBLIC
         ${CMAKE_CURRENT_SOURCE_DIR} 
)
]]
