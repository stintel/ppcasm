#include <stdbool.h>

#define PPC_FEATURE_HAS_ALTIVEC	0x10000000

extern size_t __hwcap;

bool _doasm();
bool doasm();
