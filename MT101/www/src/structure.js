var youTubePanelWidth = window.innerWidth - 550;
var youTubePanelHeight = window.innerHeight - 370;
var youTubeWidth = youTubePanelWidth - 20;
var youTubeHeight = youTubePanelHeight - 20;
var youTubeString = '';


var wikiPanelWidth = window.innerWidth - 240;
var wikiPanelHeight = window.innerHeight - 240;
var wikiWidth = wikiPanelWidth - 30;
var wikiHeight = wikiPanelHeight;
var wikiString = '';


var morePanelWidth = window.innerWidth - 100;
var morePanelHeight = window.innerHeight - 100;
var moreWidth = morePanelWidth - 30;
var moreHeight = morePanelHeight;
var moreString = '';



var dot = '<span class="dot">•</span>';
var dot2 = '<span class="dot2">•</span>';
var dot3 = '<span class="dot3">•</span>';
var dot4 = '<span class="dot4">•</span>';
var space = '&nbsp;';

var doe = '<span class="do">Do</span>';
var di = '<span class="di">Di</span>';
var re = '<span class="re">Re</span>';
var ri = '<span class="ri">Ri</span>';
var mi = '<span class="mi">Mi</span>';
var ma = '<span class="ma">Ma</span>';
var fa = '<span class="fa">Fa</span>';
var fi = '<span class="fi">Fi</span>';
var sol = '<span class="sol">Sol</span>';
var si = '<span class="si">Si</span>';
var la = '<span class="la">La</span>';
var li = '<span class="li">Li</span>';
var ti = '<span class="ti">Ti</span>';
var ta = '<span class="ta">Ta</span>';


var te = '<span class="te">Te</span>';
var le = '<span class="le">Le</span>';
var se = '<span class="se">Se</span>';
var fe = '<span class="fe">Fe</span>';
var me = '<span class="me">Me</span>';
var ra = '<span class="ra">Ra</span>';
var de = '<span class="de">De</span>';

var message1 = '<span class="message">Visualize each color as you sing the scale.</span>';
var message2 = '<span class="message">Practice all of the examples by \"stacking thirds\".</span>';
var message3 = '<span class="message">Practice all examples ascending and descending.</span>';

sink.Structure = [
				  
				  
				  {
				  text: 'Staffs',
				  cls: 'launchscreen',
				  items: [
						  
						  {
						  text: 'Grand Staff',
						  cls: 'launchscreen',
						  card: demos.GrandStaff,
						  //source: 'http://www.dolmetsch.com/musictheory9.htm#notesandkeys',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
                          {
						  text: 'Treble Clef',
						  cls: 'launchscreen',
						  card: demos.TrebleClef,
						  //source: 'http://en.wikipedia.org/wiki/Clef',
						  cardSwitchAnimation: {
                              type: 'fade',
						  duration: 300
						  },
						  leaf: true,
                          },
						  {
						  text: 'Soprano Clef',
						  cls: 'launchscreen',
						  card: demos.SopranoClef,
						  //source: 'http://en.wikipedia.org/wiki/Clef',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  {
						  text: 'MezzoSoprano Clef',
						  cls: 'launchscreen',
						  card: demos.MezzoSopranoClef,
						  //source: 'http://en.wikipedia.org/wiki/Clef',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  {
						  text: 'Alto Clef',
						  cls: 'launchscreen',
						  card: demos.AltoClef,
						  //source: 'http://en.wikipedia.org/wiki/Clef',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  {
						  text: 'Tenor Clef',
						  cls: 'launchscreen',
						  card: demos.TenorClef,
						  //source: 'http://en.wikipedia.org/wiki/Clef',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  {
						  text: 'BariTone Clef',
						  cls: 'launchscreen',
						  card: demos.BariToneClef,
						  //source: 'http://en.wikipedia.org/wiki/Clef',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  {
						  text: 'Bass Clef',
						  cls: 'launchscreen',
						  card: demos.BassClef,
						  //source: 'http://en.wikipedia.org/wiki/Clef',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  {
						  text: 'SubBass Clef',
						  cls: 'launchscreen',
						  card: demos.SubBassClef,
						  //source: 'http://en.wikipedia.org/wiki/Clef',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  ],},
				  
                          {
				  
				  text: 'Circle of Fifths',
				  card: demos.CircleOfFifths,
				  //source: 'http://en.wikipedia.org/wiki/Circle_of_fifths',
				  cardSwitchAnimation: {
				  type: 'fade',
				  duration: 300
				  },
				  leaf: true
				  
				  },
                   /*       {
				  text: 'Solfege Sylables',
				  cls: 'launchscreen',
				  items: [
						  
						  
						  
						  {
						  text: 'Naturals',
						  cls: 'launchscreen',
						  card: demos.SolfegeNaturals,
						  //source: 'http://en.wikipedia.org/wiki/Solfege',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  
						  {
						  text: 'Sharps',
						  cls: 'launchscreen',
						  card: demos.SolfegeSharps,
						  //source: 'http://en.wikipedia.org/wiki/Solfege',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  
						  {
						  text: 'Flats',
						  cls: 'launchscreen',
						  card: demos.SolfegeFlats,
						  //source: 'http://en.wikipedia.org/wiki/Solfege',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true,
						  },
						  
						  
						  
						  
						  ]
				  
				  }, */
                          {
				  text: 'Scales',
				  cls: 'launchscreen',
				  items: [
						   
                          {
                          text: 'Chromatic Scales',
                          card: demos.ChromaticScales,
                          leaf: true,
                          /*
                          //source: 'http://en.wikipedia.org/wiki/Solfege',
                           items:[
                          
                                 {
                                 text: 'With Sharps',
                                 card: demos.ChromaticWithSharps,
                                 leaf: true,
                                 //source: 'http://en.wikipedia.org/wiki/Major_scale',
                                 cardSwitchAnimation: {
                                 type: 'fade',
                                 duration: 300
                                 },
                                 },
                                 
                                 
                                 {
                                 text: 'With Flats',
                                 card: demos.ChromaticWithFlats,
                                 leaf: true,
                                 //source: 'http://en.wikipedia.org/wiki/Major_scale',
                                 cardSwitchAnimation: {
                                 type: 'fade',
                                 duration: 300
                                 }, 
                                 },
                                                                
                                 ] */
                          },
						   
						  
						  {
						  text: 'Diatonic Scales',
						  cls: 'launchscreen',
						  //source: 'http://en.wikipedia.org/wiki/Diatonic_scale',
						  items: [
								  
								  {
								  text: 'Major Scale',
								  card: demos.MajorScale,
								  leaf: true,
								  //source: 'http://en.wikipedia.org/wiki/Major_scale',
								  cardSwitchAnimation: {
								  type: 'fade',
								  duration: 300
								  },
								  },
								  
								  
								  
								  {
								  text: 'Minor Scale',
								  card: demos.MinorScale,
								  //source: 'http://en.wikipedia.org/wiki/Minor_scale',
								  cardSwitchAnimation: {
								  type: 'fade',
								  duration: 300
								  },
								  leaf: true,
								  },
								  
								  ]
						  },
						  
						  
						  {
						  text: 'WholeToneScale',
						  cls: 'launchscreen',
						  card: demos.WholeToneScale,
						  leaf: true,
						  //source: 'http://en.wikipedia.org/wiki/Whole_tone_scale',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  },
						  /*
						   {
						   text: 'Pentatonic Scales',
						   cls: 'launchscreen',
						   card: demos.PentatonicScales,
						   //source: 'http://en.m.wikipedia.org/wiki/Pentatonic_scale?wasRedirected=true',
						   cardSwitchAnimation: {
						   type: 'fade',
						   duration: 300
						   },
						   leaf: true,
						   items:[
						   
						   
						   {
						   text: 'Tonal Pentatonic Scales',
						   cls: 'launchscreen',
						   card: demos.TonalPentatonicScales,
						   leaf: true,
						   //source: 'http://en.wikipedia.org/wiki/Pentatonic_scale',
						   cardSwitchAnimation: {
						   type: 'fade',
						   duration: 300
						   },
						   },
						   
						   {
						   text: 'Semitonal Pentatonic Scales',
						   cls: 'launchscreen',
						   card: demos.SemitonalPentatonicScales,
						   leaf: true,
						   //source: 'http://en.wikipedia.org/wiki/Pentatonic_scale',
						   cardSwitchAnimation: {
						   type: 'fade',
						   duration: 300
						   },
						   },
						   
						   
						   ],
						   },
						   */
						  
						  {
						  text: 'Blues Scale',
						  cls: 'launchscreen',
						  card: demos.BluesScale,
						  leaf: true,
						  //source: 'http://en.wikipedia.org/wiki/Blues_scale',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  },
						  
						  /*
						   
						   {
						   text: 'Chromatic with Sharps',
						   cls: 'launchscreen',
						   card: demos.ChromaticWithSharps,
						   leaf: true,
						   //source: 'http://en.wikipedia.org/wiki/Chromatic_scale',
						   cardSwitchAnimation: {
						   type: 'fade',
						   duration: 300
						   },
						   },
						   
						   {
						   text: 'Chromatic with Flats',
						   cls: 'launchscreen',
						   card: demos.ChromaticWithFlats,
						   leaf: true,
						   //source: 'http://en.wikipedia.org/wiki/Chromatic_scale',
						   cardSwitchAnimation: {
						   type: 'fade',
						   duration: 300
						   },
						   },
						   
						   
						   */
						  
						  
						  
						  
						  
						  
						  /*
						   
						   {
						   text: 'Natural Minor Scale',
						   card: demos.NaturalMinorScale,
						   //source: 'http://en.wikipedia.org/wiki/Natural_minor_scale#Natural_minor',
						   leaf: true,
						   },
						   
						   {
						   text: 'Harmonic Minor Scale',
						   card: demos.HarmonicMinorScale,
						   //source: 'http://en.wikipedia.org/wiki/Harmonic_minor#Harmonic_and_melodic_minor',
						   leaf: true,
						   },
						   
						   {
						   text: 'Melodic Minor Scale',
						   card: demos.MelodicMinorScale,
						   //source: 'http://en.wikipedia.org/wiki/Harmonic_minor#Harmonic_and_melodic_minor',
						   leaf: true,
						   },
						   
						   */
						  
						  
						  ]
				  
				  },
                          {
				  text: 'Natural Modes',
				  //source: 'src/demos/NaturalModes.js',
				  
				  items:[ 
						 
						 {
						 text: 'Ionian',
						 card: demos.Ionian,
						 //source: 'http://en.wikipedia.org/wiki/Ionian_mode',
						 cardSwitchAnimation: {
						 type: 'fade',
						 duration: 300
						 },
						 leaf: true
						 },
						 
						 
						 {
						 text: 'Dorian',
						 card: demos.Dorian,
						 //source: 'http://en.wikipedia.org/wiki/Dorian_mode',
						 cardSwitchAnimation: {
						 type: 'fade',
						 duration: 300
						 },
						 leaf: true
						 },
						 
						 
						 {
						 text: 'Phrygian',
						 card: demos.Phrygian,
						 //source: 'http://en.wikipedia.org/wiki/Phrygian_mode',
						 cardSwitchAnimation: {
						 type: 'fade',
						 duration: 300
						 },
						 leaf: true
						 },
						 
						 
						 {
						 text: 'Lydian',
						 card: demos.Lydian,
						 //source: 'http://en.wikipedia.org/wiki/Lydian_mode',
						 cardSwitchAnimation: {
						 type: 'fade',
						 duration: 300
						 },
						 leaf: true
						 },
						 
						 
						 {
						 text: 'MixoLydian',
						 card: demos.MixoLydian,
						 //source: 'http://en.wikipedia.org/wiki/Mixolydian_mode',
						 cardSwitchAnimation: {
						 type: 'fade',
						 duration: 300
						 },
						 leaf: true
						 },
						 
						 
						 {
						 text: 'Aeolian',
						 card: demos.Aeolian,
						 //source: 'http://en.wikipedia.org/wiki/Aeolian_mode',
						 cardSwitchAnimation: {
						 type: 'fade',
						 duration: 300
						 },
						 leaf: true
						 },
						 
						 
						 {
						 text: 'Locrian',
						 card: demos.Locrian,
						 //source: 'http://en.wikipedia.org/wiki/Locrian_mode',
						 cardSwitchAnimation: {
						 type: 'fade',
						 duration: 300
						 },
						 leaf: true
						 }
						 
						 
						 
						 
						 ],
				  },
                          {
				  text: 'Accidentals',
				  //source: 'src/demos/Accidentals.js',
				  
				  items: [
						  
						  
						  
						  {
						  text: 'Sharps',
						  card: demos.Sharps,
						  //source: 'src/demos/Sharps.js',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true
						  
						  },
						  
						  {
						  text: 'Flats',
						  card: demos.Flats,
						  //source: 'src/demos/Flats.js',
						  cardSwitchAnimation: {
						  type: 'fade',
						  duration: 300
						  },
						  leaf: true
						  
						  
						  },
						  
						  /* {
						   text: 'Naturals',
						   card: demos.Naturals,
						   //source: 'src/demos/Naturals.js',
						   animation: 'cube',
						   leaf: true
						   
						   
						   },
						   
						   {
						   text: 'Double Sharps',
						   card: demos.DoubleSharps,
						   //source: 'src/demos/DoubleSharps.js',
						   animation: 'cube',
						   leaf: true
						   },
						   
						   {
						   text: 'Double Flats',
						   card: demos.DoubleFlats,
						   //source: 'src/demos/DoubleFlats.js',
						   animation: 'cube',
						   leaf: true
						   },
						   
						   {
						   text: 'Enharmonic Equivalents',
						   card: demos.EnharmonicEquivalents,
						   //source: 'src/demos/EnharmonicEquivalents.js',
						   animation: 'cube',
						   leaf: true
						   },
						   
						   */
						  
						  
						  ]
				  },


//todos
                          /*
				   
				   
				   {
				   text: 'Keys',
				   //source: 'src/demos/Keys.js',
				   
				   items: [
				   
				   {
				   text: 'Major',
				   items: [
				   
				   
				   
				   {
				   text: 'Major Sharp Keys',
				   card: demos.MajorSharpKeys,
				   //source: 'src/demos/MajorSharpKeys.js',
				   animation: 'cube',
				   leaf: true
				   
				   },
				   
				   
				   {
				   text: 'Major Flat Keys',
				   card: demos.MajorFlatKeys,
				   //source: 'src/demos/MajorFlatKeys.js',
				   animation: 'cube',
				   leaf: true
				   
				   },
				   
				   
				   
				   
				   ]
				   },
				   
				   {
				   text: 'Minor',
				   card: demos.Minor,
				   //source: 'src/demos/Minor.js',
				   animation: 'cube',
				   items: [
				   
				   
				   
				   {
				   text: 'Minor Sharp Keys',
				   card: demos.MinorSharpKeys,
				   //source: 'src/demos/MinorSharpKeys.js',
				   animation: 'cube',
				   leaf: true
				   
				   
				   },
				   
				   {
				   text: 'Minor Flat Keys',
				   card: demos.MinorFlatKeys,
				   //source: 'src/demos/MinorFlatKeys.js',
				   animation: 'cube',
				   leaf: true
				   
				   
				   },
				   
				   
				   
				   
				   
				   
				   ]
				   
				   },
				   
				   
				   
				   ]},
				   
				   
				   
				   */
                          /*
				   
				   {
				   text: 'Intervals',
				   items:[
				   
				   
				   
				   {
				   text: 'Melodic Intervals',
				   },
				   {
				   text: 'Harmonic Intervals',
				   },
				   {
				   text: 'Interval Quality',
				   },
				   {
				   text: 'Compound Intervals',
				   },
				   {
				   text: 'Interval Inversions',
				   },
				   {
				   text: 'TriTone Intervals',
				   }
				   
				   
				   
				   
				   
				   ],
				   },
				   
				   {
				   text: 'Tritone',
				   
				   card: demos.Tritone,
				   //source: 'http://en.wikipedia.org/wiki/Augmented_chord',
				   leaf: true,
				   animation: 'cube',
				   
				   
				   
				   
				   },		
				   
				   
				   {
				   text: 'Chords',
				   items: [
				   
				   {
				   text: 'Chord Quality',
				   card: demos.ChordQuality,
				   //source: 'http://en.wikipedia.org/wiki/Augmented_chord',
				   animation: 'cube',
				   items:[
				   
				   
				   
				   {
				   text: 'Major',
				   card: demos.MajorChords,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Minor',
				   card: demos.MinorChords,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Augmented',
				   card: demos.AugmentedChords,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Diminished',
				   card: demos.DiminishedChords,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   
				   ]
				   },
				   
				   
				   {
				   text: 'Minor Triad Qualities',
				   card: demos.MinorTriadQualities,
				   //source: '',
				   animation: 'cube',
				   items:[
				   
				   
				   
				   {
				   text: 'A Natural Minor Qualities',
				   card: demos.ANaturalMinorQualities,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   
				   ],
				   },
				   
				   
				   {
				   text: 'Extended Chords',
				   card: demos.ExtendedChords,
				   //source: '',
				   animation: 'cube',
				   items: [
				   
				   
				   
				   {
				   text: '7th Chord',
				   card: demos.SeventhChord,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: '9th Chord',
				   card: demos.NinthChord,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: '11th Chord',
				   card: demos.EleventhChord,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: '13th Chord',
				   card: demos.ThirteenthChord,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Dominant Chord',
				   card: demos.DominantChord,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   
				   ],
				   },
				   
				   {
				   text: 'Chord Inversions',
				   card: demos.ChordInversions,
				   //source: '',
				   animation: 'cube',
				   items:[
				   
				   
				   {
				   text: 'First Inversion',
				   card: demos.FirstInversion,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Second Inversion',
				   card: demos.SecondInversion,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   
				   ],
				   },
				   
				   
				   
				   
				   
				   
				   ]
				   
				   },
				   
				   */
                          /*
				   
				   
				   
				   {
				   text: 'Cadences',
				   card: demos.Cadences,
				   //source: '',
				   animation: 'cube',
				   items:[
				   
				   
				   
				   {
				   text: 'Perfect Authentic Cadence',
				   card: demos.PerfectAuthenticCadence,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Imperfect Authentic Cadence',
				   card: demos.ImperfectAuthenticCadence,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'SemiCadence',
				   card: demos.SemiCadence,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   
				   
				   ],
				   },
				   
				   {
				   text: 'Time',
				   card: demos.Time,
				   //source: '',
				   animation: 'cube',
				   items:[
				   
				   
				   
				   {
				   text: 'Rhythm',
				   card: demos.Rhythm,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Note Head',
				   card: demos.NoteHead,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Dots',
				   card: demos.Dots,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Triplets',
				   card: demos.Triplets,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   
				   
				   ],
				   
				   },
				   
				   {
				   text: 'Meter',
				   card: demos.Meter,
				   //source: '',
				   animation: 'cube',
				   items:[
				   
				   
				   
				   
				   {
				   text: 'Time Signature',
				   card: demos.TimeSignature,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Common and Cut Time',
				   card: demos.CommonAndCutTime,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Simple Meters',
				   card: demos.SimpleMeters,
				   //source: '',
				   animation: 'cube',
				   items:[
				   
				   {
				   text: 'Duple Meter',
				   card: demos.DrupleMeter,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Triple Meter',
				   card: demos.TripleMeter,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Quadruple Meter',
				   card: demos.QuadrupleMeter,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   {
				   text: 'Composite Meter',
				   card: demos.CompositeMeter,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   ],
				   },
				   
				   {
				   text: 'Compound Meter',
				   card: demos.CompoundMeter,
				   //source: '',
				   animation: 'cube',
				   items:[
				   
				   {
				   text: 'Compound Duple Meter',
				   card: demos.CompoundDrupleMeter,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Compound Triple Meter',
				   card: demos.CompoundTripleMeter,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   {
				   text: 'Compound Quadruple Meter',
				   card: demos.CompoundQuadrupleMeter,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   ],
				   },
				   
				   
				   
				   {
				   text: 'Tempo',
				   card: demos.Tempo,
				   //source: '',
				   animation: 'cube',
				   leaf: true,
				   },
				   
				   
				   
				   ],
				   },
				   
				   
				   
				   */
                          /*
				   
				   {
				   text: 'Notation',
				   card: demos.Notation,
				   //source: '',
				   animation: 'cube',
				   items: [
				   
				   
				   
				   
				   {
				   text: 'NoteHead',
				   leaf: true,
				   },
				   
				   {
				   text: 'Stems',
				   leaf: true,
				   },
				   
				   {
				   text: 'Flags',
				   leaf: true,
				   },
				   
				   {
				   text: 'Beams',
				   leaf: true,
				   },
				   
				   {
				   text: 'Phrase',
				   leaf: true,
				   },
				   
				   {
				   text: 'Slur',
				   leaf: true,
				   },
				   
				   {
				   text: 'Ties',
				   leaf: true,
				   },
				   
				   {
				   text: 'Accents',
				   leaf: true,
				   },
				   
				   {
				   text: 'Staccato',
				   leaf: true,
				   },
				   
				   {
				   text: 'Double Bars',
				   leaf: true,
				   },
				   
				   {
				   text: 'Repeat Signs',
				   leaf: true,
				   },
				   
				   {
				   text: 'Da Capo',
				   leaf: true,
				   },
				   
				   {
				   text: 'Dal Segno',
				   leaf: true,
				   },
				   
				   {
				   text: 'D.S. al Coda',
				   leaf: true,
				   },
				   
				   {
				   text: 'Pickup Notes',
				   leaf: true,
				   },
				   
				   {
				   text: 'Wedges/Hairpins',
				   leaf: true,
				   },
				   
				   {
				   text: 'Ornaments',
				   items: [
				   
				   {
				   text: 'Grace Notes',
				   leaf: true,
				   },
				   
				   {
				   text: 'Trill',
				   leaf: true,
				   },
				   
				   {
				   text: 'Tremolo',
				   leaf: true,
				   },
				   
				   {
				   text: 'Turns',
				   leaf: true,
				   },
				   
				   {
				   text: 'Mordents',
				   leaf: true,
				   },
				   
				   ]
				   },
				   
				   
				   
				   
				   
				   
				   
				   
				   ]
				   },
				   
				   
				   
				   
				   */
				  
//Original Sencha for reference
//Original Sencha for reference
//Original Sencha for reference
                          /*{
        text: 'User Interface',
        cls: 'launchscreen',
        items: [

            {
                text: 'Buttons',
                card: demos.Buttons,
                source: 'src/demos/buttons.js',
                leaf: true
            },
            {
                text: 'Forms',
                card: demos.Forms,
                source: 'src/demos/forms.js',
                leaf: true
            },
            {
                text: 'List',
                card: demos.List,
                source: 'src/demos/list.js',
                leaf: true
            },
            {
                text: 'Nested List',
                card: demos.NestedList,
                source: 'src/demos/nestedlist.js',
                leaf: true
            },
            {
                text: 'Icons',
                card: demos.Icons,
                source: 'src/demos/icons.js',
                leaf: true
            },
            {
                text: 'Toolbars',
                card: demos.Toolbars,
                source: 'src/demos/toolbars.js',
                leaf: true
            },
            {
                text: 'Carousel',
                card: demos.Carousel,
                source: 'src/demos/carousel.js',
                leaf: true
            },
            {
                text: 'Tabs',
                card: demos.Tabs,
                source: 'src/demos/tabs.js',
                leaf: true
            },
            {
                text: 'Bottom Tabs',
                card: demos.BottomTabs,
                source: 'src/demos/bottomtabs.js',
                leaf: true
            },
            {
             text: 'Picker',
             card: demos.Picker,
             source: 'src/demos/picker.js',
             leaf: true
             },
            {
                text: 'Map',
                card: demos.Map,
                source: 'src/demos/map.js',
                leaf: true
            },
            {
                text: 'Overlays',
                card: demos.SheetsOverlays,
                source: 'src/demos/sheets_overlays.js',
                leaf: true
            }
        ]
    },*/ 
                          /*{
        text: 'Animations',
        source: 'src/demos/animations.js',
        card: Ext.is.Phone ? false : demos.Animations,
        items: [
            {
                text: 'Slide',
                card: demos.Animations.slide,
                preventHide: true,
                cardSwitchAnimation: 'slide',
                leaf: true
            },
            {
                text: 'Slide (cover)',
                card: demos.Animations.slidecover,
                preventHide: true,
                cardSwitchAnimation: {
                    type: 'slide',
                    cover: true
                },
                leaf: true
            },
            {
                text: 'Slide (reveal)',
                card: demos.Animations.slidereveal,
                preventHide: true,
                cardSwitchAnimation: {
                    type: 'slide',
                    reveal: true
                },
                leaf: true
            },
            {
                text: 'Pop',
                card: demos.Animations.pop,
                preventHide: true,
                cardSwitchAnimation: {
                    type: 'pop',
                    scaleOnExit: true
                },
                leaf: true
            },
            {
                text: 'Fade',
                card: demos.Animations.fade,
                preventHide: true,
                cardSwitchAnimation: {
                    type: 'fade',
                    duration: 600
                },
                leaf: true
            },
            {
                text: 'Flip',
                card: demos.Animations.flip,
                preventHide: true,
                cardSwitchAnimation: {
                    type: 'flip',
                    duration: 400
                },
                leaf: true
            },
            {
                text: 'Cube',
                card: demos.Animations.cube,
                preventHide: true,
                cardSwitchAnimation: {
                    type: 'cube',
                    duration: 400
                },
                leaf: true
            }
        ]
    },*/
                          /*{
        text: 'Touch Events',
        card: demos.Touch,
        source: 'src/demos/touch.js',
        leaf: true
    },*/
                          /*{
        text: 'Data',
        items: [
            {
                text: 'Nested Loading',
                card: demos.Data.nestedLoading,
                source: 'src/demos/data/nestedLoading.js',
                leaf: true
            },
            {
                text: 'JSON P',
                card: demos.Data.jsonp,
                source: 'src/demos/data/jsonp.js',
                leaf: true
            },
            {
                text: 'YQL',
                card: demos.Data.yql,
                source: 'src/demos/data/yql.js',
                leaf: true
            },
            {
                text: 'AJAX',
                card: demos.Data.ajax,
                source: 'src/demos/data/ajax.js',
                leaf: true
            }
        ]
    },*/
                          /*{
        text: 'Media',
        items: [
            {
                text: 'Video',
                card: demos.Video,
                source: 'src/demos/video.js',
                leaf: true
            },
            {
                text: 'Audio',
                card: demos.Audio,
                source: 'src/demos/audio.js',
                leaf: true
            }
        ]
    },*/
                          /*{
        text: 'Themes',
        card: demos.Themes,
        source: 'src/demos/themes.js',
        leaf: true
    }*/
//Original Sencha for reference
//Original Sencha for reference
//Original Sencha for reference



{
    text: 'More Titles',
    cls: 'launchscreen',
    card: demos.MoreTitles,
    //source: 'http://www.youtube.com/watch?v=ITeSlEX9TJI',
    cardSwitchAnimation: {
        type: 'fade',
        duration: 300
    },
    leaf: true,
}


];

/*
if (Ext.is.iOS || Ext.is.Desktop) {
    sink.Structure.push({
        text: 'Simulator',
        leaf: true,
        card: demos.Simulator,
        source: 'src/demos/simulator.js'
    });
}
 */

Ext.regModel('Demo', {
    fields: [
        {name: 'text',        type: 'string'},
        {name: 'source',      type: 'string'},
        {name: 'preventHide', type: 'boolean'},
        {name: 'cardSwitchAnimation'},
        {name: 'card'}
    ]
});

sink.StructureStore = new Ext.data.TreeStore({
    model: 'Demo',
    root: {
        items: sink.Structure
    },
    proxy: {
        type: 'ajax',
        reader: {
            type: 'tree',
            root: 'items'
        }
    }
});
