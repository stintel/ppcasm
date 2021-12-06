#include <stdio.h>
#include <sys/auxv.h>

#include "main.h"

size_t __hwcap;

int main(void) {
	__hwcap = getauxval(AT_HWCAP);

	printf("__hwcap: 0x%08zx\n", __hwcap);

	printf("ASM: AltiVec %s supported\n", doasm() ? "is" : "not" );
	printf("C: AltiVec %s supported\n", __hwcap & PPC_FEATURE_HAS_ALTIVEC ? "is" : "not" );
}
