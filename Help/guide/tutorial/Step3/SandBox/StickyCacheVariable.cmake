# The names created by -D flags and option() are not normal variables, they are cache variables.
# Cache variables are globally visible variables which are sticky, their value is difficult to
# change after it is initially set. In fact they are so sticky that, in project mode, CMake will
# save and restore cache variables across multiple configurations. If a cache variable is set once,
# it will remain until another -D flag preempts the saved variable.

########################
# Non-cached variables #
########################
# By default this is a NON-CACHED variable.
# The -D option only works with cached variables. The following
# is not a cached variable so running the following command will
# NOT override the default value: cmake -B build -DNON_CACHE_VAR="New value"
set(NON_CACHE_VAR "Default value for NON_CACHE_VAR")
message("NON_CACHE_VAR is set to: ${NON_CACHE_VAR}")

set(NON_CACHE_VAR "Changed the value of the non-cached variable with set()")
message("NON_CACHE_VAR is set to: ${NON_CACHE_VAR}")

unset(NON_CACHE_VAR)
message("NON_CACHE_VAR is set to: ${NON_CACHE_VAR}")

###############################
# Cached variables - option() #
###############################
# The names created by -D flags and option() are cache variables.
# If a cache variable is set once, it will remain until another
# -D flag preempts the saved variable. Cached variables are persistent
# accross re-configurations
option(COMPRESSION_SOFTWARE_USE_ZLIB "Support Zlib compression" OFF)
option(COMPRESSION_SOFTWARE_USE_ZSTD "Support Zstd compression" OFF)

if(COMPRESSION_SOFTWARE_USE_ZLIB)
  message("I will use Zlib!")
endif()

if(COMPRESSION_SOFTWARE_USE_ZSTD)
  message("I will use Zstd!")
endif()

############################
# Cached variables - set() #
############################
# Set can be used to manipulate cached variables, but will not change a
# variable which has already been created. To overwrite the value you
# must specify the -D flag. Because the -D flags are processed before
# any other commands (the cmd line runs beofre CMakeCache.txt is loaded),
# they take precedence for setting the value of a cached variable. run the
# command:
# cmake -B build -DStickyCacheVariable="CMD line always wins."
set(StickyCacheVariable "I will not change" CACHE STRING "")
set(StickyCacheVariable "Overwrite StickyCache" CACHE STRING "") # Aadd FORCE at the end to force variable to be overriden

message("StickyCacheVariable: ${StickyCacheVariable}")

if(NOT DEFINED USR_DEF_VAR)
  message("USR_DEF_VAR is NOT defined")
endif()
