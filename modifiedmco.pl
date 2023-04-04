
:- dynamic(symptoms/1).

% MALARIA SYMPTOMS
symptoms(fever) :-
    verify('Do you have a fever? (yes/no)').
symptoms(headaches) :-
    verify('Do you have headaches? (yes/no)').
symptoms(chills) :-
    verify('Do you have chills? (yes/no)').
symptoms(muscle_pain) :-
    verify('Do you have muscle pain? (yes/no)').
symptoms(malaise) :-
    verify('Do you have malaise? (yes/no)').
symptoms(nausea) :-
    verify('Do you have nausea? (yes/no)').
symptoms(vomiting) :-
    verify('Do you have vomiting? (yes/no)').

% ARI SYMPTOMS
    %fever
    %headaches
    %muscle pain
    symptoms(cough) :-
        verify('Do you have a cough? (yes/no)').
    symptoms(runny_nose) :-
        verify('Do you have a runny nose? (yes/no)').
    symptoms(sore_throat) :-
        verify('Do you have a sore throat? (yes/no)').
    symptoms(nasal_congestion) :- 
        verify('Do you have a nasal congestion? (yes/no)').

% DENGUE SYMPTOMS
    %fever
    %headaches
    %nausea,
    symptoms(vomiting) :-
        verify('Do you have vomiting? (yes/no)').
    symptoms(fatigue) :-
        verify('Do you have fatigue? (yes/no)').
    symptoms(muuscle_joint_pain) :-
        verify('Do you have muscle and joint pain? (yes/no)').
    symptoms(rashes) :-
        verify('Do you have rashes? (yes/no)').

% DIARRHEA SYMPTOMS
    %fever
    %chills
    symptoms(watery_stools) :-
        verify('Do you have watery stools? (yes/no)').
    symptoms(stomach_pain) :-
        verify('Do you have stomach pain? (yes/no)').
    symptoms(bloating) :-
        verify('Do you have bloating? (yes/no)').
    symptoms(body_aches) :-
        verify('Do you have body aches? (yes/no)').

% TUBERCULOSIS SYMPTOMS
    %fever,
    %cough,
    symptoms(night_sweats) :-
        verify('Do you have night sweats? (yes/no)').
    symptoms(weight_loss) :-
        verify('Do you have weight loss? (yes/no)').
    symptoms(fatigue) :-
        verify('Do you have fatigue? (yes/no)').
    symptoms(chest_pain) :-
        verify('Do you have chest pain? (yes/no)').

% COVID-19 SYMPTOMS
    %fever,
    %cough,
    %fatigue
    symptoms(shortness_of_breath) :-
        verify('Do you have shortness of breath? (yes/no)').
    symptoms(loss_of_taste_or_smell) :-
        verify('Do you have loss of taste or smell? (yes/no)').

% HEPATITIS B SYMPTOMS
    symptoms(abdominal_pain) :-
        verify('Do you have abdominal pain? (yes/no)').
    symptoms(loss_of_appetite) :-
        verify('Do you have loss of appetite? (yes/no)').
    symptoms(dark_urine) :-
        verify('Do you have dark urine? (yes/no)').
    symptoms(jaundice) :-
        verify('Do you have jaundice? (yes/no)').

% LEPROSY SYMPTOMS
    symptoms(discolored_skin_patches_or_nodules) :-
        verify('Do you have discolored skin patches or nodules? (yes/no)').
    symptoms(nerve_damage) :-
        verify('Do you have nerve damage? (yes/no)').
    symptoms(enlarged_nerves) :-
        verify('Do you have enlarged nerves? (yes/no)').

% SCHISTOSOMIASIS SYMPTOMS
    %rashes
    symptoms(exposure_to_contaminated_water) :-
        verify('Do you have exposure to contaminated water?').

% PNEUMONIA SYMPTOMS
    %cough
    %chest pain
    %shortness of breath
    %fatigue
    %vomiting
    symptoms(bloody_mucus) :-
        verify('Do you have bloody mucus?').

disease(malaria) :-
    symptoms(fever),
    symptoms(headaches),
    symptoms(chills),
    symptoms(muscle_pain),
    symptoms(malaise),
    symptoms(nausea),
    symptoms(vomiting).

disease('acute respiratory infection') :-
    symptoms(fever),
    symptoms(headaches),
    symptoms(muscle_pain),
    symptoms(cough),
    symptoms(runny_nose),
    symptoms(sore_throat),
    symptoms(nasal_congestion).

disease(dengue) :-
    symptoms(fever),
    symptoms(headaches),
    symptoms(nausea),
    symptoms(vomiting),
    symptoms(fatigue),
    symptoms(muscle_joint_pain),
    symptoms(rashes).
    
disease(diarrhea) :-
    symptoms(fever),
    symptoms(chills),
    symptoms(water_stools),
    symptoms(stomach_pain),
    symptoms(bloating),
    symptoms(body_aches).
    
disease(tuberculosis) :-
    symptoms(fever),
    symptoms(cough),
    symptoms(night_sweats),
    symptoms(weight_loss),
    symptoms(fatigue),
    symptoms(chest_pain).

disease('COVID-19') :-
    symptoms(fever),
    symptoms(cough),
    symptoms(fatigue),
    symptoms(shortness_of_breath),
    symptoms(loss_of_taste_or_smell).

disease('Hepatitis B') :-
    symptoms(abdominal_pain),
    symptoms(loss_of_appetite),
    symptoms(dark_urine),
    symptoms(jaundice).

disease(leprosy) :-
    symptoms(discolored_skin_patches_or_nodules),
    symptoms(nerve_damage),
    symptoms(enlarged_nerves).

disease(schistosomiasis) :-
    symptoms(rashes),
    symptoms(exposure_to_contaminated_water).

disease(pneumonia) :-
    symptoms(cough),
    symptoms(chest_pain),
    symptoms(shortness_of_breath),
    symptoms(fatigue),
    symptoms(vomiting),
    symptoms(bloody_mucus).

start :-
    disease(X),
    format('You have ~w', [X]).

% TODO 1: ADD A CLEAR FUNCTION FOR SYMPTOMS AFTER DISPLAYING RESULT
% yung current code kasi need mo irecompile para mareuse ung chatbot
% TODO 2: MAKE A NOT CONDITION ex. if disease = null, res is unknown
% nakalagay to sa vid na sinend ni sir jus gotta look for it


:- dynamic(yes/1).
:- dynamic(no/1).	

ask(Question) :-
(   (yes(Question); no(Question))
->  true
;   write(Question),
    read(N),
    (   N == yes 
    ->  assertz(yes(Question))
    ;   assertz(no(Question)), fail
    )
).
	
verify(S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(S))).
/*
    1. MALARIA

    fever
    headaches
    chills
    muscle pain
    malaise
    nausea
    vomiting
    diarrhea
*/

/* 
    2. ACUTE RESPIRATORY INFECTION OR ARI

    fever
    headaches
    muscle pain
    cough 
    runny nose,
    sore throat, 
    nasal congestion,
    
*/

/*
    3. DENGUE

    fever
    headaches
    nausea,
    vomiting,
    fatigue,
    muscle and joint pain,
    rashes
*/

/*
    4. DIARRHEA

    fever
    chills
    watery stools,
    stomach pain,
    bloating,
    body aches

*/


/*
    5. TUBERCULOSIS

    fever,
    cough,
    night sweats,
    weight loss,
    fatigue,
    chest pain,
*/

/*
    COVID-19

    fever,
    cough,
    fatigue
    shortness of breath,
    loss of taste or smell
*/

/*
    HEPATITIS B
    
    abdominal pain
    loss of appetite
    dark urine
    jaundice
*/

/*
    LEPROSY

    discolored skin patches or nodules
    nerve damage
    enlarged nerves
*/

/*
    SCHISTOSOMIASIS

    rashes
    exposure to contaminated water
*/

/*
    PNEUMONIA

    cough
    chest pain
    shortness of breath
    fatigue
    vomiting
    bloody mucus
*/

