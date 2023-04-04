% RULES/ Facts symptoms

:- dynamic(symptoms/1).

%[A] malaria symptoms
% asserted : symptoms(fever) 
symptoms(chills) :-
    verify('do you have a chills (y/n) ?').
symptoms(headache) :-
    verify('do you have a headache (y/n) ?').
symptoms('muscle aches') :-
    verify('do you have a muscle aches (y/n) ?').
symptoms(malaise) :-
    verify('do you have a malaise (y/n) ?').
symptoms(nausea) :-
    verify('do you have a nausea (y/n) ?').
symptoms(vomiting) :-
    verify('do you have a vomiting (y/n) ?').
symptoms(diarrhea) :-
    verify('do you have a diarrhea (y/n) ?').

%[B] Diarrhea Symptoms
    % fever
    % chills
symptoms('watery stools') :-
    verify('do you have a watery stool (y/n) ?').
symptoms('stomach pain') :-
    verify('do you have a stomach pain (y/n) ?').
symptoms(bloating) :-
    verify('do you feel bloated (y/n) ?').
symptoms('body aches') :-
    verify('do you have a body ache (y/n) ?').

%[C] Pneumonia Symptoms
%asserted: symptoms('cough') :-
    %verify('do you have a cough (y/n) ?'),
symptoms('chest pain') :-
    verify('do you feel pain in your chest when you breathe (y/n) ?').
symptoms('shortness of breath') :-
    verify('do you have shortness of breathe (y/n) ?').
symptoms(fatigue) :-
    verify('do you feel constant tiredness or weakness ?').

%[C.1] elder pneumonia
symptoms(confusion) :-
    verify('have you been experiencing forgetfullness, confusion, or changes in mental awareness (y/n) ?').

%[C.2] young children pneumonia
    %vomiting

%[D] Leprosy Symptoms:
%asserted: symptoms('discolored skin patches or nodules') 
    %verify('do you have patches of discolored skin or nodules (y/n) ?').
symptoms('nerve damage') :-
    verify('do the affected areas in the skin feel numb (y/n) ?').
symptoms('enlarged nerves') :-
    verify('do you observe enlarged nerves in your elbow or knee or sides of neck (y/n) ?').

%[E] Schistosomiasis Symptoms
%symptoms(rashes) :-
    %verify('do you have rashes or itchy skin (y/n) ?').
symptoms('exposure to contaminated water') :-
    verify('have you been exposed to a dirty or possibly contaminated water (y/n) ?'),
    verify('has your exposure been 1-2 months ago? (y/n) ?').

%[F] Dengue Symptoms
symptoms('muscle and joint pain') :-
    verify('Do you have muscle and joint pain? (y/n)').

%[G] Tuberculosis Symptoms
symptoms('night sweats') :-
    verify('Do you have night sweats? (y/n)').
symptoms('weight loss') :-
    verify('Do you have weight loss? (y/n)').
symptoms('long coughing') :-
    verify('Have you been coughing for a long time? (y/n)').

%[H] COVID-19 Symptoms
symptoms('loss of taste or smell') :-
    verify('Have you lost your sense of taste of smell? (y/n)').

%Gastroentrisis Symptoms
symptoms('abdominal pain') :-
    verify('Do you have abdominal pain? (y/n)').

%Hepatitis B Symptoms
symptoms('loss of appetite') :-
    verify('Do you have loss of appetite? (y/n)').
symptoms('dark urine') :-
    verify('Do you have dark urine? (y/n)').
symptoms('jaundice') :-
    verify('Do you have jaundice? (y/n)').


info(AGE, adult) :-
    range(AGE, 6, 64).

info(AGE, child) :-
    range(AGE, 0, 6).

info(AGE, elder) :-
    range(AGE, 65, 101).

range(X, K, Y) :- 
X >= K , X < Y.



% Facts/Rules Diseases
hypothesis(malaria, Z, _AgeGroup) :-
    Z = fevergroup,
    symptoms(fever),
    symptoms(chills),
    symptoms(headache),
    symptoms('muscle aches'),
    symptoms(malaise),
    symptoms(nausea),
    symptoms(vomiting),
    hypothesis(diarrhea, Z, _AgeGroup).

hypothesis(diarrhea, Z, _AgeGroup) :-
    Z = fevergroup,
    symptoms(fever),
    symptoms(chills),
    symptoms('watery stools'),
    symptoms('stomach pain'),
    symptoms(bloating),
    symptoms('body aches').

hypothesis(dengue, Z, _AgeGroup) :-
    Z = fevergroup,
    symptoms(fever),
    symptoms(headache),
    symptoms(nausea),
    symptoms(vomiting),
    symptoms(fatigue),
    symptoms('muscle and joint pain'),
    symptoms('rashes').

hypothesis(tuberculosis, Z, AgeGroup) :-
    Z = fevergroup,
    symptoms(cough),
    symptoms(fever),
    symptoms('night sweats'),
    symptoms('weight loss'),
    symptoms('fatigue'),
    symptoms('chest pain'),
    symptoms('long coughing').
    
hypothesis(covid, Z, AgeGroup) :-
    Z = fevergroup,
    symptoms(fever),
    symptoms(cough),
    symptoms(fatigue),
    symptoms('shortness of breath'),
    symptoms('loss of taste or smell').

hypothesis(gastroentritis, Z, AgeGroup) :-
    Z = fevergroup,
    symptoms(fever),
    symptoms(chills),
    symptoms(nausea),
    symptoms(vomiting),
    symptoms('abdominal pain'),
    symptoms(diarrhea).

hypothesis(hepatitisb, Z, AgeGroup) :-
    Z = fevergroup,
    symptoms('abdominal pain'),
    symptoms('loss of appetite'),
    symptoms('dark urine'),
    symptoms('jaundice').

hypothesis(leprosy, Z, _AgeGroup):-
    Z = skingroup,
    symptoms('discolored skin patches or nodules'),
    symptoms('nerve damage'),
    symptoms('enlarged nerves').

hypothesis(schistosomiasis, Z, _AgeGroup) :-
    Z = skingroup,
    symptoms(rashes),
    symptoms('exposure to contaminated water').
    
hypothesis(pneumonia, Z, AgeGroup) :-
    Z = respgroup, 
    AgeGroup = adult,
    symptoms(cough),
    symptoms('chest pain'),
    symptoms('shortness of breath'),
    symptoms(fatigue).

hypothesis(pneumonia, Z, AgeGroup) :-
    Z = respgroup,
    AgeGroup = elder,
    symptoms(cough),
    symptoms('chest pain'),
    symptoms('shortness of breath'),
    symptoms(fatigue),
    symptoms(confusion).

hypothesis(pneumonia, Z, AgeGroup) :-
    Z = respgroup,
    AgeGroup = child,
    symptoms(cough),
    symptoms(vomiting),
    symptoms('chest pain'),
    symptoms('shortness of breath'),
    symptoms(fatigue).

hypothesis(tuberculosis, Z, AgeGroup) :-
    Z = respgroup,
    symptoms(cough),
    symptoms(fever),
    symptoms('night sweats'),
    symptoms('weight loss'),
    symptoms('fatigue'),
    symptoms('chest pain'),
    symptoms('long coughing').

hypothesis(covid, Z, AgeGroup) :-
    Z = respgroup,
    symptoms(fever),
    symptoms(cough),
    symptoms(fatigue),
    symptoms('shortness of breath'),
    symptoms('loss of taste or smell').

%change


% indicator of fever symptoms
diagnose(A, AgeGroup) :-
    A = a,
    write('do you have a fever (y/n) ?'), nl,
    read(Fever),

    (Fever = y, A = a)
    ->
    assertz(symptoms(fever)),
    %write('how long has fever been troubling you? '), nl,
        %format('A - less than one day~NB - one day to one week~NC - one week to one month~ND - more than a month~N', []),
        %read(FeverDays),
       % write('how high is your fever? '), nl,
        %format('A - low grade fever (between 37.5 °C - 38 °C)~NB - fever (between 38.1 °C - 40 °C) ~NC - high-grade fever (higher than 40 °C)~N', []),
        %read(FeverGrade),
        hypothesis(DS, fevergroup, AgeGroup),
        format('You probably have ~w', [DS])
    ;
    (Fever = n, A = a)
    -> diagnose(b, AgeGroup).


 % indicator of skin symptoms
diagnose(A, AgeGroup) :-
    A = b,
    write('do you have rashes or itchy skin (y/n) ?'), nl,
    read(Rash),
    
    (Rash = y , A = b)
    ->  assertz(symptoms(rashes)),
        hypothesis(DS, skingroup, AgeGroup),
        format('You probably have ~w', [DS])
    ;
    (Rash = n , A = b)
    -> 
    (write('do you have patches of discolored skin or nodules (y/n) ?'), nl,
    read(Patch),
    
    (Patch = y)
    ->  assertz(symptoms('discolored skin patches or nodules')),
        hypothesis(DS, skingroup, AgeGroup),
        format('You probably have ~w', [DS])
    ;
    (Patch = n)
    -> diagnose(c, AgeGroup)).

% indicator of respiratory symptoms
diagnose(A, AgeGroup) :-
    A = c,
    write('do you have a cough (y/n) ?'), nl,
    read(Cough),
    
    (Cough = y, A = c)
    ->  assertz(symptoms(cough)),
        hypothesis(DS, resgroup, AgeGroup),
        format('You probably have ~w', [DS])
    ;
    (Cough = n, A = c)
    -> diagnose(a, AgeGroup).


:- dynamic(yes/1).
:- dynamic(no/1).	

ask(Question) :-
	write(Question),
	read(N),

	N == y 
    -> assertz(yes(Question))
    ;
    N == n
    -> assertz(no(Question), fail).
	
verify(S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(S))).
 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.

% MAIN PROGRAM
start :-
    write('Hi! I am a medical chatbot. Do you want to consult? (y/n) '), nl,
    read(ANS), nl,
    continueConsult(ANS).

continueConsult(ANS) :-
    ANS == y 
    ->  write('Okay! Please answer the following questions.'), nl,
        collect
    ;
    ANS == n
    ->  write('Alright. Type in "start" to talk to me again.').

collect :-
    write('Name: '),        read(NAME),
    write('Age: '),         read(AGE),
  %  write('Gender: '),      read(GEN),
   % write('Height: '),      read(HEI),
   % write('Weight: '),      read(WEI),
   % write('BP: '),          read(BP),
   % write('Heart Beat: '),  read(HEARTB),
    info(AGE, AgeGroup),

    format(' ~N~w, what are your main complaints? ', [NAME]), nl,
    format('a - general~Nb - skin problem~Nc - respiratory', []), nl,
    read(A),
    diagnose(A, AgeGroup).

