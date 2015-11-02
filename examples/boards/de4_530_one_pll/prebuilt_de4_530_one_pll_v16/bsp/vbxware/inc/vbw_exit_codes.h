//VBXCOPYRIGHTTAG

#ifndef __VBW_EXIT_CODES_H
#define __VBW_EXIT_CODES_H

/**
 * \file
 * VBXWare Function Return Codes
 *
 *  * Negative return codes indicate an error condition and positive return codes
 *   (or a return code of zero) indicate a success. Codes are designed to be added
 *   together (bitwise OR'd) to possibly indicate several conditions at once.
 *
 *  * Not all functions make use of all condition codes.
 *
 *  * If VBX_SKIP_ALL_CHECKS was enabled, condition codes will only be applied to
 *   the exit code if they require no extra calculations.
 */

#define VBW_SUCCESS 0
#define VBW_ERROR_SP_ALLOC_FAILED -1

#endif //__VBW_EXIT_CODES_H
