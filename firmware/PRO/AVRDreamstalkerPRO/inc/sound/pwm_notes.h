#ifndef __PWM_NOTES_H__
#define __PWM_NOTES_H__


/* Pause */

#define PAUSE	0
#define P		PAUSE
#define p		P


/* There are 12 notes in octave */

#if F_CPU == 8000000UL

/* Valid for 8MHz clock */

/* Octave #2 */

#define C2   61153 	/* PWM: 65.40 Hz, note freq: 65.41 Hz, error 0.01% */
#define C2x  57720 	/* PWM: 69.30 Hz, note freq: 69.30 Hz, error 0.00% */
#define D2   54481 	/* PWM: 73.42 Hz, note freq: 73.42 Hz, error 0.01% */
#define D2x  51427 	/* PWM: 77.78 Hz, note freq: 77.78 Hz, error 0.00% */
#define E2   48538 	/* PWM: 82.41 Hz, note freq: 82.41 Hz, error 0.00% */
#define F2   45814 	/* PWM: 87.31 Hz, note freq: 87.31 Hz, error 0.00% */
#define F2x  43243 	/* PWM: 92.51 Hz, note freq: 92.50 Hz, error 0.01% */
#define G2   40816 	/* PWM: 98.00 Hz, note freq: 98.00 Hz, error 0.00% */
#define G2x  38525 	/* PWM: 103.82 Hz, note freq: 103.83 Hz, error 0.01% */
#define A2   36364 	/* PWM: 110.01 Hz, note freq: 110.00 Hz, error 0.01% */
#define A2x  34323 	/* PWM: 116.55 Hz, note freq: 116.54 Hz, error 0.01% */
#define B2   32397 	/* PWM: 123.46 Hz, note freq: 123.47 Hz, error 0.01% */


/* Octave #3 */

#define C3   30579 	/* PWM: 130.82 Hz, note freq: 130.81 Hz, error 0.01% */
#define C3x  28862 	/* PWM: 138.58 Hz, note freq: 138.59 Hz, error 0.01% */
#define D3   27242 	/* PWM: 146.84 Hz, note freq: 146.83 Hz, error 0.01% */
#define D3x  25714 	/* PWM: 155.57 Hz, note freq: 155.56 Hz, error 0.00% */
#define E3   24270 	/* PWM: 164.80 Hz, note freq: 164.81 Hz, error 0.01% */
#define F3   22908	/* PWM: 174.64 Hz, note freq: 174.61 Hz, error 0.02% */
#define F3x  21622 	/* PWM: 184.98 Hz, note freq: 185.00 Hz, error 0.01% */
#define G3   20408 	/* PWM: 196.00 Hz, note freq: 196.00 Hz, error 0.00% */
#define G3x  19263	/* PWM: 207.64 Hz, note freq: 207.65 Hz, error 0.01% */
#define A3   18182 	/* PWM: 219.97 Hz, note freq: 220.00 Hz, error 0.01% */
#define A3x  17162 	/* PWM: 233.10 Hz, note freq: 233.08 Hz, error 0.01% */
#define B3   16198	/* PWM: 246.91 Hz, note freq: 246.94 Hz, error 0.01% */


/* Octave #4 */

#define C4   15289 	/* PWM: 261.64 Hz, note freq: 261.63 Hz, error 0.01% */
#define C4x  14431 	/* PWM: 277.16 Hz, note freq: 277.18 Hz, error 0.01% */
#define D4   13621 	/* PWM: 293.60 Hz, note freq: 293.66 Hz, error 0.02% */
#define D4x  12856 	/* PWM: 311.14 Hz, note freq: 311.13 Hz, error 0.00% */
#define E4   12135 	/* PWM: 329.60 Hz, note freq: 329.63 Hz, error 0.01% */
#define F4   11454 	/* PWM: 349.16 Hz, note freq: 349.23 Hz, error 0.02% */
#define F4x  10811 	/* PWM: 370.10 Hz, note freq: 369.99 Hz, error 0.03% */
#define G4   10204 	/* PWM: 391.85 Hz, note freq: 392.00 Hz, error 0.04% */
#define G4x  9632 	/* PWM: 415.28 Hz, note freq: 415.30 Hz, error 0.01% */
#define A4   9091 	/* PWM: 440.14 Hz, note freq: 440.00 Hz, error 0.03% */
#define A4x  8581 	/* PWM: 465.98 Hz, note freq: 466.16 Hz, error 0.04% */
#define B4   8099 	/* PWM: 494.07 Hz, note freq: 493.88 Hz, error 0.04% */


/* Octave #5 */

#define C5   7645  	/* PWM: 523.01 Hz, note freq: 523.25 Hz, error 0.05% */
#define C5x  7215  	/* PWM: 554.32 Hz, note freq: 554.37 Hz, error 0.01% */
#define D5   6811  	/* PWM: 587.54 Hz, note freq: 587.33 Hz, error 0.04% */
#define D5x  6428  	/* PWM: 621.89 Hz, note freq: 622.25 Hz, error 0.06% */
#define E5   6067  	/* PWM: 659.63 Hz, note freq: 659.26 Hz, error 0.06% */
#define F5   5727  	/* PWM: 698.32 Hz, note freq: 698.46 Hz, error 0.02% */
#define F5x  5406  	/* PWM: 739.64 Hz, note freq: 739.99 Hz, error 0.05% */
#define G5   5102  	/* PWM: 783.70 Hz, note freq: 783.99 Hz, error 0.04% */
#define G5x  4816  	/* PWM: 830.56 Hz, note freq: 830.61 Hz, error 0.01% */
#define A5   4546  	/* PWM: 880.28 Hz, note freq: 880.00 Hz, error 0.03% */
#define A5x  4290  	/* PWM: 932.84 Hz, note freq: 932.33 Hz, error 0.05% */
#define B5   4050  	/* PWM: 988.14 Hz, note freq: 987.77 Hz, error 0.04% */


/* Octave #6 */

#define C6   3822  	/* PWM: 1046.03 Hz, note freq: 1046.50 Hz, error 0.05% */
#define C6x  3608  	/* PWM: 1108.65 Hz, note freq: 1108.73 Hz, error 0.01% */
#define D6   3405 	/* PWM: 1173.71 Hz, note freq: 1174.66 Hz, error 0.08% */
#define D6x  3214 	/* PWM: 1243.78 Hz, note freq: 1244.51 Hz, error 0.06% */
#define E6   3034  	/* PWM: 1319.26 Hz, note freq: 1318.51 Hz, error 0.06% */
#define F6   2864  	/* PWM: 1396.65 Hz, note freq: 1396.91 Hz, error 0.02% */
#define F6x  2703  	/* PWM: 1479.29 Hz, note freq: 1479.98 Hz, error 0.05% */
#define G6   2551 	/* PWM: 1567.40 Hz, note freq: 1567.98 Hz, error 0.04% */
#define G6x  2408 	/* PWM: 1661.13 Hz, note freq: 1661.22 Hz, error 0.01% */
#define A6   2273  	/* PWM: 1760.56 Hz, note freq: 1760.00 Hz, error 0.03% */
#define A6x  2145  	/* PWM: 1865.67 Hz, note freq: 1864.66 Hz, error 0.05% */
#define B6   2025  	/* PWM: 1976.28 Hz, note freq: 1975.53 Hz, error 0.04% */


/* Octave #7 */

#define C7   1911  	/* PWM: 2092.05 Hz, note freq: 2093.00 Hz, error 0.05% */
#define C7x  1804  	/* PWM: 2222.22 Hz, note freq: 2217.46 Hz, error 0.21% */
#define D7   1703  	/* PWM: 2347.42 Hz, note freq: 2349.32 Hz, error 0.08% */
#define D7x  1607  	/* PWM: 2487.56 Hz, note freq: 2489.02 Hz, error 0.06% */
#define E7   1517  	/* PWM: 2631.58 Hz, note freq: 2637.02 Hz, error 0.21% */
#define F7   1432  	/* PWM: 2793.30 Hz, note freq: 2793.83 Hz, error 0.02% */
#define F7x  1351 	/* PWM: 2958.58 Hz, note freq: 2959.96 Hz, error 0.05% */
#define G7   1276  	/* PWM: 3144.65 Hz, note freq: 3135.96 Hz, error 0.28% */
#define G7x  1204  	/* PWM: 3333.33 Hz, note freq: 3322.44 Hz, error 0.33% */
#define A7   1136 	/* PWM: 3521.13 Hz, note freq: 3520.00 Hz, error 0.03% */
#define A7x  1073  	/* PWM: 3731.34 Hz, note freq: 3729.31 Hz, error 0.05% */
#define B7   1012 	/* PWM: 3937.01 Hz, note freq: 3951.07 Hz, error 0.36% */


#elif F_CPU == 1000000UL

/* Valid for 1MHz clock */

/* Octave #2 */

#define C2   7645 	/* PWM: 65.40 Hz, note freq: 65.41 Hz, error 0.01% */
#define C2x  7215 	/* PWM: 69.30 Hz, note freq: 69.30 Hz, error 0.00% */
#define D2   6810 	/* PWM: 73.42 Hz, note freq: 73.42 Hz, error 0.01% */
#define D2x  6428 	/* PWM: 77.78 Hz, note freq: 77.78 Hz, error 0.00% */
#define E2   6067 	/* PWM: 82.41 Hz, note freq: 82.41 Hz, error 0.01% */
#define F2   5727 	/* PWM: 87.31 Hz, note freq: 87.31 Hz, error 0.00% */
#define F2x  5405 	/* PWM: 92.51 Hz, note freq: 92.50 Hz, error 0.01% */
#define G2   5102 	/* PWM: 98.00 Hz, note freq: 98.00 Hz, error 0.00% */
#define G2x  4816 	/* PWM: 103.82 Hz, note freq: 103.83 Hz, error 0.01% */
#define A2   4545 	/* PWM: 110.01 Hz, note freq: 110.00 Hz, error 0.01% */
#define A2x  4290 	/* PWM: 116.55 Hz, note freq: 116.54 Hz, error 0.01% */
#define B2   4050 	/* PWM: 123.46 Hz, note freq: 123.47 Hz, error 0.01% */


/* Octave #3 */

#define C3   3822 	/* PWM: 130.82 Hz, note freq: 130.81 Hz, error 0.01% */
#define C3x  3608 	/* PWM: 138.58 Hz, note freq: 138.59 Hz, error 0.01% */
#define D3   3405 	/* PWM: 146.84 Hz, note freq: 146.83 Hz, error 0.01% */
#define D3x  3214 	/* PWM: 155.57 Hz, note freq: 155.56 Hz, error 0.00% */
#define E3   3034 	/* PWM: 164.80 Hz, note freq: 164.81 Hz, error 0.01% */
#define F3   2863 	/* PWM: 174.64 Hz, note freq: 174.61 Hz, error 0.02% */
#define F3x  2703 	/* PWM: 184.98 Hz, note freq: 185.00 Hz, error 0.01% */
#define G3   2551 	/* PWM: 196.00 Hz, note freq: 196.00 Hz, error 0.00% */
#define G3x  2408 	/* PWM: 207.64 Hz, note freq: 207.65 Hz, error 0.01% */
#define A3   2273 	/* PWM: 219.97 Hz, note freq: 220.00 Hz, error 0.01% */
#define A3x  2145 	/* PWM: 233.10 Hz, note freq: 233.08 Hz, error 0.01% */
#define B3   2025 	/* PWM: 246.91 Hz, note freq: 246.94 Hz, error 0.01% */


/* Octave #4 */

#define C4   1911 	/* PWM: 261.64 Hz, note freq: 261.63 Hz, error 0.01% */
#define C4x  1804 	/* PWM: 277.16 Hz, note freq: 277.18 Hz, error 0.01% */
#define D4   1703 	/* PWM: 293.60 Hz, note freq: 293.66 Hz, error 0.02% */
#define D4x  1607 	/* PWM: 311.14 Hz, note freq: 311.13 Hz, error 0.00% */
#define E4   1517 	/* PWM: 329.60 Hz, note freq: 329.63 Hz, error 0.01% */
#define F4   1432 	/* PWM: 349.16 Hz, note freq: 349.23 Hz, error 0.02% */
#define F4x  1351 	/* PWM: 370.10 Hz, note freq: 369.99 Hz, error 0.03% */
#define G4   1276 	/* PWM: 391.85 Hz, note freq: 392.00 Hz, error 0.04% */
#define G4x  1204 	/* PWM: 415.28 Hz, note freq: 415.30 Hz, error 0.01% */
#define A4   1136 	/* PWM: 440.14 Hz, note freq: 440.00 Hz, error 0.03% */
#define A4x  1073 	/* PWM: 465.98 Hz, note freq: 466.16 Hz, error 0.04% */
#define B4   1012 	/* PWM: 494.07 Hz, note freq: 493.88 Hz, error 0.04% */


/* Octave #5 */

#define C5   956  	/* PWM: 523.01 Hz, note freq: 523.25 Hz, error 0.05% */
#define C5x  902  	/* PWM: 554.32 Hz, note freq: 554.37 Hz, error 0.01% */
#define D5   851  	/* PWM: 587.54 Hz, note freq: 587.33 Hz, error 0.04% */
#define D5x  804  	/* PWM: 621.89 Hz, note freq: 622.25 Hz, error 0.06% */
#define E5   758  	/* PWM: 659.63 Hz, note freq: 659.26 Hz, error 0.06% */
#define F5   716  	/* PWM: 698.32 Hz, note freq: 698.46 Hz, error 0.02% */
#define F5x  676  	/* PWM: 739.64 Hz, note freq: 739.99 Hz, error 0.05% */
#define G5   638  	/* PWM: 783.70 Hz, note freq: 783.99 Hz, error 0.04% */
#define G5x  602  	/* PWM: 830.56 Hz, note freq: 830.61 Hz, error 0.01% */
#define A5   568  	/* PWM: 880.28 Hz, note freq: 880.00 Hz, error 0.03% */
#define A5x  536  	/* PWM: 932.84 Hz, note freq: 932.33 Hz, error 0.05% */
#define B5   506  	/* PWM: 988.14 Hz, note freq: 987.77 Hz, error 0.04% */


/* Octave #6 */

#define C6   478  	/* PWM: 1046.03 Hz, note freq: 1046.50 Hz, error 0.05% */
#define C6x  451  	/* PWM: 1108.65 Hz, note freq: 1108.73 Hz, error 0.01% */
#define D6   426  	/* PWM: 1173.71 Hz, note freq: 1174.66 Hz, error 0.08% */
#define D6x  402  	/* PWM: 1243.78 Hz, note freq: 1244.51 Hz, error 0.06% */
#define E6   379  	/* PWM: 1319.26 Hz, note freq: 1318.51 Hz, error 0.06% */
#define F6   358  	/* PWM: 1396.65 Hz, note freq: 1396.91 Hz, error 0.02% */
#define F6x  338  	/* PWM: 1479.29 Hz, note freq: 1479.98 Hz, error 0.05% */
#define G6   319  	/* PWM: 1567.40 Hz, note freq: 1567.98 Hz, error 0.04% */
#define G6x  301  	/* PWM: 1661.13 Hz, note freq: 1661.22 Hz, error 0.01% */
#define A6   284  	/* PWM: 1760.56 Hz, note freq: 1760.00 Hz, error 0.03% */
#define A6x  268  	/* PWM: 1865.67 Hz, note freq: 1864.66 Hz, error 0.05% */
#define B6   253  	/* PWM: 1976.28 Hz, note freq: 1975.53 Hz, error 0.04% */


/* Octave #7 */

#define C7   239  	/* PWM: 2092.05 Hz, note freq: 2093.00 Hz, error 0.05% */
#define C7x  225  	/* PWM: 2222.22 Hz, note freq: 2217.46 Hz, error 0.21% */
#define D7   213  	/* PWM: 2347.42 Hz, note freq: 2349.32 Hz, error 0.08% */
#define D7x  201  	/* PWM: 2487.56 Hz, note freq: 2489.02 Hz, error 0.06% */
#define E7   190  	/* PWM: 2631.58 Hz, note freq: 2637.02 Hz, error 0.21% */
#define F7   179  	/* PWM: 2793.30 Hz, note freq: 2793.83 Hz, error 0.02% */
#define F7x  169  	/* PWM: 2958.58 Hz, note freq: 2959.96 Hz, error 0.05% */
#define G7   159  	/* PWM: 3144.65 Hz, note freq: 3135.96 Hz, error 0.28% */
#define G7x  150  	/* PWM: 3333.33 Hz, note freq: 3322.44 Hz, error 0.33% */
#define A7   142  	/* PWM: 3521.13 Hz, note freq: 3520.00 Hz, error 0.03% */
#define A7x  134  	/* PWM: 3731.34 Hz, note freq: 3729.31 Hz, error 0.05% */
#define B7   127  	/* PWM: 3937.01 Hz, note freq: 3951.07 Hz, error 0.36% */

#endif

#endif /* __PWM_NOTES_H__ */
