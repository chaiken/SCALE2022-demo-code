/*
error: ‘long long long’ is too long for GCC
long long long long is_negative(long long value) {
*/
long long is_negative(long long value) { return (value < 0) ? 1 : 0; }
