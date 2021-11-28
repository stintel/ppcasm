#include <stdio.h>
#include <sys/auxv.h>

#include "main.h"

size_t __hwcap;

int main(void) {
	__hwcap = getauxval(AT_HWCAP);

	printf("__hwcap: 0x%08zx\n", __hwcap);

	if (__hwcap & PPC_FEATURE_HAS_ALTIVEC)
		printf("AltiVec supported\n");
	else
		printf("AltiVec not supported\n");

	doasm();

	printf("\nASM done, back to C\n");

	return 0;
}
