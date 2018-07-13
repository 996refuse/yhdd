int power(int a, int b) {
    int ret = 1;
    for(; b > 0; --b) {
        ret *= a;
    }
    return ret;
}
