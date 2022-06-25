/* Inspired by
   https://thephd.dev/to-save-c-we-must-save-abi-fixing-c-function-abi
*/

#include <limits.h>
#include <stdio.h>

extern long long is_negative(long long value);

int main() {
  long long x = is_negative(-1);
  if (x == 1L)
    printf("-1 is negative.\n");
  else
    printf("-1 is positive or zero.\n");
  return 0;
}
