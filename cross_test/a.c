#include <stdio.h>
#include <pthread.h>

void init(void) {
    printf("inited.\n");
}

int main() {

    pthread_once_t once_control = PTHREAD_ONCE_INIT;

    pthread_once(&once_control, init);
    printf("hello pthread\n");
    return 0;
}
