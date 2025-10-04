set(TARGET MathFunctions)

add_library(${TARGET})

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