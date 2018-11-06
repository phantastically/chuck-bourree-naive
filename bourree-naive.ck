// Play a simple song with slurred notes using a 

// I like how ChucK uses time rather than frequency, but most
// musicians are used to used to tempi as frequencies.

35 => int song_length;

[ 64, 66, 67, 67, 66, 64, 63, 63, 64, 66, 59, 59, 
  61, 63, 64, 64, 62, 60, 59, 59, 57, 55, 54, 54,
  55, 57, 59, 57, 55, 54, 52, 52, 52, 52, 52 ] @=> int notes1[];
  
[ 43, 42, 40, 40, 45, 45, 47, 47, 45, 45, 43, 43, 
  42, 42, 40, 40, 42, 42, 43, 43, 45, 45, 47, 47, 
  45, 45, 43, 43, 47, 47, 40, 42, 43, 42, 40 ] @=> int notes2[];

SinOsc sineWave1 => dac;
SinOsc sineWave2 => dac;

0 => int i;

0.7 => sineWave1.gain;
1.0 => sineWave2.gain;

for (i; i < song_length; i++) {
    Std.mtof(notes1[i]) => sineWave1.freq;
    Std.mtof(12 + notes2[i]) => sineWave2.freq;
    
    metronome(240) => now;
}

fun dur metronome(int beatsPerMinute) {
    60000 / beatsPerMinute => float msPerBeat;
    return msPerBeat::ms;
}

