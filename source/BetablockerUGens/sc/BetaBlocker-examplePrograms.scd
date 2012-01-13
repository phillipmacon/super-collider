BBlockerProgram.instructions.keys.asArray


BBlockerProgram.findOpCodesFor("push")


// saw
a = BBlockerProgram([\ORG, \INC, \JMP, 1]);

x = a.play(19000)
x.free

a.plot(duration: 0.15)

// impulse
a = BBlockerProgram([\ORG, \NOT, \JMP, 1]); x = a.play;
a.plot(duration: 0.001)

// pulse
(
var pulsewidth = 22;

a = BBlockerProgram([\ORG] ++ (\NOP ! pulsewidth) ++ [\NOT, \JMP, 1]); x = a.play;
)

a.play

a.plot(duration: 0.05)

// DUP + ADD
(
a = BBlockerProgram([\ORG, \INC, \INC, \INC, \INC, \INC] ++ ([\DUP, \ADD]) ++ [\JMP, 2]); x = a.play;
)

a.plot(duration: 0.05)

// saw plus impulse
(
var slope = 4;

a = BBlockerProgram([slope, \ORG] ++ ([\PSHL, -1, \ADD]) ++ [\JMP, 1]); x = a.play;
)

a.plot(duration: 0.05)


// EQU
a = BBlockerProgram([\ORG, \INC] ++ ([\EQU]) ++ [\JMP, 2]); x = a.play(leak: true);

a.plot(duration: 0.05)


// POP destroy
a = BBlockerProgram([6, 7, 6, 245, \ORG, \NOP, \NOP, \NOP, \NOP] /* <-- some space*/ ++ ([\PSHL, -6, \PSHL, -2, \POP]) ++ [\JMP, 1]);
a.fillUpRandom_(false)

a.plot(leak: true, duration: 0.5)
a.plot(leak: false, duration: 0.5)

x = a.play(leak: true);

a.fillUpRandom_(true)
a.plot(leak: false, duration: 0.5)



x = a.play(300, leak: true, vol: 0.025);
x.free;
// get the actual program sent as a buffer 
a.collection.postcs; ""

a.plot(duration: 0.5)



BBlockerProgram([ 6, 7, 6, 245, 1, 0, 0, 0, 0, 5, 250, 5, 254, 8, 3, 1, 215, 221, 108, 94, 33, 174, 88, 159, 195, 218, 234, 77, 142, 231, 105, 118, 129, 37, 220, 62, 155, 77, 85, 204, 244, 145, 104, 60, 220, 64, 55, 230, 83, 83, 41, 169, 253, 216, 80, 238, 174, 14, 22, 42, 241, 159, 70, 175, 144, 246, 11, 42, 236, 179, 18, 143, 10, 81, 160, 158, 207, 13, 101, 178, 21, 78, 111, 6, 240, 177, 252, 148, 223, 170, 35, 142, 236, 61, 154, 219, 178, 202, 31, 60, 210, 106, 31, 139, 94, 29, 165, 40, 112, 11, 125, 105, 123, 248, 73, 247, 198, 137, 197, 100, 153, 71, 248, 190, 197, 18, 223, 19, 27, 146, 236, 188, 49, 70, 16, 20, 51, 184, 59, 155, 120, 129, 93, 126, 252, 120, 219, 198, 245, 172, 250, 99, 33, 90, 37, 254, 46, 203, 110, 71, 234, 164, 113, 29, 99, 171, 244, 223, 170, 78, 114, 129, 153, 194, 47, 93, 86, 242, 88, 1, 237, 81, 235, 55, 168, 147, 51, 66, 226, 248, 30, 135, 75, 184, 73, 234, 1, 91, 96, 38, 229, 79, 128, 67, 4, 4, 24, 148, 54, 200, 171, 52, 48, 51, 41, 101, 154, 208, 127, 216, 202, 3, 14, 2, 18, 26, 192, 103, 125, 205, 68, 216, 163, 21, 207, 85, 52, 70, 213, 201, 55, 129, 129, 15, 162, 170, 57, 63, 244, 101, 107, 2, 166, 53, 199, 188 ]).play(3000)

BBlockerProgram([ 6, 7, 6, 245, 1, 0, 0, 0, 0, 5, 250, 5, 254, 8, 3, 1, 90, 102, 221, 89, 104, 198, 213, 150, 159, 51, 123, 5, 124, 1, 228, 38, 137, 218, 178, 196, 130, 207, 27, 66, 95, 230, 140, 38, 137, 21, 30, 205, 57, 5, 175, 30, 242, 176, 180, 55, 94, 197, 223, 91, 192, 170, 216, 141, 184, 151, 103, 96, 132, 213, 24, 68, 86, 225, 104, 32, 225, 230, 6, 32, 73, 119, 112, 88, 107, 104, 170, 16, 56, 198, 241, 78, 62, 35, 170, 255, 14, 228, 24, 245, 200, 152, 29, 83, 29, 95, 192, 34, 20, 127, 229, 115, 223, 68, 213, 160, 9, 177, 143, 209, 167, 73, 58, 181, 230, 153, 14, 114, 79, 51, 9, 31, 101, 94, 75, 250, 80, 129, 35, 11, 45, 43, 223, 154, 89, 67, 133, 234, 238, 111, 123, 178, 46, 185, 99, 12, 65, 63, 201, 1, 60, 76, 185, 206, 98, 126, 217, 171, 119, 92, 71, 202, 99, 183, 209, 179, 73, 23, 178, 32, 86, 34, 138, 61, 208, 181, 154, 77, 125, 171, 102, 159, 55, 138, 102, 71, 77, 168, 184, 52, 94, 49, 67, 24, 196, 2, 127, 97, 169, 238, 8, 223, 252, 161, 169, 78, 245, 83, 145, 209, 75, 51, 93, 44, 17, 133, 85, 107, 115, 60, 13, 9, 163, 212, 167, 166, 223, 192, 85, 4, 218, 76, 137, 179, 88, 214, 4, 177, 28, 25, 158, 155, 28, 224, 157, 154 ]).play(3000)

BBlockerProgram([ 6, 7, 6, 245, 1, 0, 0, 0, 0, 5, 250, 5, 254, 8, 3, 1, 11, 119, 194, 139, 80, 115, 80, 152, 157, 242, 220, 89, 18, 193, 131, 212, 213, 204, 23, 25, 121, 81, 129, 58, 229, 90, 141, 157, 12, 41, 61, 41, 215, 113, 44, 48, 32, 183, 106, 145, 73, 187, 229, 135, 18, 83, 140, 56, 234, 183, 110, 184, 22, 215, 53, 121, 141, 252, 199, 43, 4, 175, 89, 19, 215, 115, 98, 103, 50, 4, 150, 202, 217, 150, 105, 226, 235, 130, 130, 44, 178, 159, 166, 145, 222, 30, 225, 26, 151, 210, 213, 106, 139, 24, 0, 215, 39, 46, 143, 188, 54, 153, 137, 112, 204, 197, 162, 12, 230, 56, 109, 205, 91, 247, 80, 53, 45, 40, 192, 223, 57, 208, 157, 214, 199, 5, 38, 87, 164, 120, 224, 26, 186, 247, 121, 243, 70, 223, 189, 193, 218, 212, 202, 20, 164, 103, 243, 202, 40, 190, 208, 192, 188, 38, 148, 144, 15, 0, 105, 208, 77, 141, 12, 76, 208, 253, 144, 232, 240, 87, 196, 32, 196, 56, 173, 126, 240, 114, 38, 25, 154, 172, 255, 229, 143, 198, 67, 189, 161, 33, 210, 158, 245, 216, 92, 140, 133, 170, 135, 26, 224, 104, 184, 243, 244, 124, 218, 176, 23, 158, 11, 244, 83, 144, 117, 145, 56, 80, 245, 92, 72, 55, 234, 152, 175, 18, 6, 146, 195, 33, 71, 31, 204, 176, 213, 113, 144, 4, 80, 232 ]).play(3000)

BBlockerProgram([ 6, 7, 6, 245, 1, 0, 0, 0, 0, 5, 250, 5, 254, 8, 3, 1, 154, 229, 173, 65, 202, 178, 232, 27, 110, 44, 77, 187, 230, 95, 215, 85, 183, 157, 198, 83, 228, 61, 220, 253, 212, 82, 199, 11, 177, 246, 132, 227, 169, 185, 117, 75, 188, 106, 242, 39, 148, 21, 1, 43, 170, 127, 254, 125, 236, 237, 71, 252, 157, 92, 10, 198, 128, 105, 167, 151, 95, 54, 5, 241, 252, 49, 91, 232, 164, 254, 127, 26, 184, 39, 24, 75, 197, 231, 64, 238, 54, 70, 112, 178, 160, 237, 48, 111, 48, 134, 116, 159, 179, 101, 245, 242, 224, 33, 74, 199, 154, 159, 27, 252, 230, 95, 33, 73, 112, 134, 34, 127, 52, 182, 57, 158, 204, 236, 226, 213, 165, 255, 31, 8, 89, 113, 4, 254, 119, 116, 54, 117, 147, 149, 170, 32, 225, 141, 46, 101, 58, 42, 168, 211, 178, 241, 18, 81, 53, 100, 142, 133, 47, 86, 4, 157, 94, 43, 156, 72, 113, 217, 23, 70, 45, 239, 113, 118, 109, 117, 236, 205, 91, 223, 113, 83, 33, 161, 247, 179, 35, 156, 143, 228, 0, 67, 44, 232, 237, 225, 22, 130, 79, 222, 125, 205, 16, 230, 197, 64, 77, 192, 66, 92, 238, 148, 166, 47, 64, 127, 185, 114, 162, 90, 146, 88, 27, 62, 99, 20, 144, 117, 99, 56, 204, 102, 233, 73, 110, 246, 104, 111, 13, 165, 83, 101, 17, 218, 234, 103 ]).play(3000)