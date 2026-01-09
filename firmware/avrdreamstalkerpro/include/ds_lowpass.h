/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2025	ORPAL Technologies, Inc.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdint.h>

namespace DS {

/*-----------------------------------------------------------------------*/
class LowPassFilter {
private:
    // Filter coefficients (Calculated for 1kHz sample rate, 40Hz cutoff)
    // Formula: Butterworth 2nd order
    // Scale factor: 2^14 (16384)
    // Coefficients scaled and rounded to nearest integer
    const int32_t b0 = 219;     // (0.013359 * 16384)
    const int32_t b1 = 438;     // (0.026718 * 16384)
    const int32_t b2 = 219;     // (0.013359 * 16384)
    const int32_t a1 = -26992;  // (-1.647459 * 16384)
    const int32_t a2 = 11483;   // (0.700897 * 16384)

    // Delay line (history)
    int32_t z1;
    int32_t z2;

public:
    /**
     * Processes a 10-bit sample using 100% integer math.
     * Output is scaled by 16384.
     */
    int16_t process(int16_t input)
    {
        // Direct Form II Transposed
        int32_t out_wide = (int32_t)input * b0 + z1;
        
        // We need the "real" output for the feedback loop
        // Shift right by 14 to "divide" by our scale factor
        // For better accuracy adds 0.5 before shifting:
        int32_t output = (out_wide + 8192) >> 14;

        z1 = (int32_t)input * b1 - a1 * output + z2;
        z2 = (int32_t)input * b2 - a2 * output;

        return (int16_t)output;
    }

    void reset() { z1 = z2 = 0; }
};

} //namespace DS