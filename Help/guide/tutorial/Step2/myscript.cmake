set(stooges "Moe;Larry")
list(APPEND stooges "Curly")

message("Stooges contains: ${stooges}")

foreach(stooge IN LISTS stooges)
    message("Hello, ${stooge}")
endforeach()

macro(MyMacro macroarg)
    message("${macroarg}\n\t\tFrom Macro")
endmacro()

function(MyFunc funcarg)
    MyMacro("${funcarg}\n\tFrom Function")    
endfunction(MyFunc funcarg)

function(print_things list)
  message("Extra args (ARGN): ${ARGN}")
endfunction()

print_things(apple banana cherry date elderberry)