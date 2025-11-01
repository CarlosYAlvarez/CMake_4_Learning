#include <iostream>

// TODO6: Include <format>
/*
 * Must build as:
   cmake \
     -B build \
     -DCMAKE_C_COMPILER=/usr/bin/gcc-13 \
     -DCMAKE_CXX_COMPILER=/usr/bin/g++-13 \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_CXX_STANDARD=20 \
     -DCMAKE_CXX_EXTENSIONS=ON \
     -DTUTORIAL_BUILD_UTILITIES=OFF
 */
#include <format>        // C++20 std::format

namespace {
// a hack square root calculation using simple operations
double mysqrt(double x)
{
  if (x <= 0) {
    return 0;
  }

  double result = x;

  // do ten iterations
  for (int i = 0; i < 10; ++i) {
    if (result <= 0) {
      result = 0.1;
    }
    double delta = x - (result * result);
    result = result + 0.5 * delta / result;

    // TODO7: Convert the print to use std::format
    // std::cout << "Computing sqrt of " << x << " to be " << result << std::endl;
    std::cout << std::format("Computing sqrt of {} to be {}\n", x, result);
  }
  return result;
}
}

namespace mathfunctions {
double sqrt(double x)
{
  return mysqrt(x);
}
}
