:- dynamic(symptoms/1).

% MALARIA SYMPTOMS
    symptoms(fever) :-
        verify('Do you have a fever? (yes/no) ').
    symptoms(headaches) :-
        verify('Do you have headaches? (yes/no) ').
    symptoms(chills) :-
        verify('Do you have chills? (yes/no) ').
    symptoms(muscle_pain) :-
        verify('Do you have muscle pain? (yes/no) ').
    symptoms(malaise) :-
        verify('Do you have malaise? (yes/no) ').
    symptoms(nausea) :-
        verify('Do you have nausea? (yes/no) ').
    symptoms(vomiting) :-
        verify('Do you have vomiting? (yes/no) ').

% ARI SYMPTOMS
    %fever
    %headaches
    %muscle pain
    symptoms(cough) :-
        verify('Do you have a cough? (yes/no) ').
    symptoms(runny_nose) :-
        verify('Do you have a runny nose? (yes/no) ').
    symptoms(sore_throat) :-
        verify('Do you have a sore throat? (yes/no) ').
    symptoms(nasal_congestion) :- 
        verify('Do you have a nasal congestion? (yes/no) ').

% DENGUE SYMPTOMS
    %fever
    %headaches
    %muscle pain
    %nausea
    symptoms(vomiting) :-
        verify('Do you have vomiting? (yes/no) ').
    symptoms(fatigue) :-
        verify('Do you have fatigue? (yes/no) ').
    symptoms(joint_pain) :-
        verify('Do you have joint pain? (yes/no) ').
    symptoms(rashes) :-
        verify('Do you have rashes? (yes/no) ').

% DIARRHEA SYMPTOMS
    %fever
    %chills
    symptoms(watery_stools) :-
        verify('Do you have watery stools? (yes/no) ').
    symptoms(stomach_pain) :-
        verify('Do you have stomach pain? (yes/no) ').
    symptoms(bloating) :-
        verify('Do you have bloating? (yes/no) ').
    symptoms(body_aches) :-
        verify('Do you have body aches? (yes/no) ').

% TUBERCULOSIS SYMPTOMS
    %fever,
    %cough,
    symptoms(night_sweats) :-
        verify('Do you have night sweats? (yes/no) ').
    symptoms(weight_loss) :-
        verify('Do you observe weight loss? (yes/no) ').
    symptoms(fatigue) :-
        verify('Do you feel constant tiredness or weakness ? (yes/no) ').
    symptoms(chest_pain) :-
        verify('Do you have chest pain? (yes/no) ').

% COVID-19 SYMPTOMS
    %fever,
    %cough,
    %fatigue
    symptoms(shortness_of_breath) :-
        verify('Do you have shortness of breath? (yes/no) ').
    symptoms(loss_of_taste_or_smell) :-
        verify('Do you have loss of taste or smell? (yes/no) ').

% HEPATITIS B SYMPTOMS
    symptoms(abdominal_pain) :-
        verify('Do you have abdominal pain? (yes/no) ').
    symptoms(loss_of_appetite) :-
        verify('Do you have loss of appetite? (yes/no) ').
    symptoms(dark_urine) :-
        verify('Do you have dark urine? (yes/no) ').
    symptoms(jaundice) :-
        verify('Do you have observe yellowing of the skin? (yes/no) ').

% LEPROSY SYMPTOMS
    symptoms(discolored_skin_patches_or_nodules) :-
        verify('Do you have discolored skin patches or nodules? (yes/no) ').
    symptoms(nerve_damage) :-
        verify('Do the affected areas in the skin feel numb? (yes/no) ').
    symptoms(enlarged_nerves) :-
        verify('Do you observe enlarged nerves in your elbow or knee or sides of neck? (yes/no) ').

% SCHISTOSOMIASIS SYMPTOMS
    %rashes
    symptoms(exposure_to_contaminated_water) :-
        verify('Do you have exposure to contaminated water? (yes/no) '),
        verify('Was your exposure 1-2 months ago? (yes/no) ').

% PNEUMONIA SYMPTOMS
    %cough
    %chest pain
    %shortness of breath
    %fatigue
    %vomiting
    symptoms(bloody_mucus) :-
        verify('Do you have bloody mucus? ').

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
    symptoms(muscle_pain),
    symptoms(nausea),
    symptoms(vomiting),
    symptoms(fatigue),
    symptoms(joint_pain),
    symptoms(rashes).
    
disease(diarrhea) :-
    symptoms(fever),
    symptoms(chills),
    symptoms(watery_stools),
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
    reset_symptoms(yes, no),
    write('Hi! I am a medical chatbot. I am here to help you determine what disease you might have.'), nl,
    write('However, it is still highly recommended that you will contact a medical professional.'), nl,
    write('NOTE: This chatbot is highly case-sensitive. Please only use lower cases and end it with a period when entering inputs.'), nl, nl,
    write('Let us start! What is your name? '),
    read(Name), 
    write('How old are you? '),
    read(Age), 
    info(Age, X),
    format('Okay, ~w. Please answer the following questions. ', [Name]), nl,
    
    diagnose(Name, X).

diagnose(Name, X) :-
    disease(Y), nl,
    format('~w, based on the symptoms you have identified, you might have ~w.', [Name, Y]), nl, nl,
    diagnosis(Y, X).

diagnose(Name, _X) :-
    format('Sorry, ~w. I don''t seem to be able to diagnose the disease.', [Name]).


:- dynamic(yes/1).
:- dynamic(no/1).

reset_symptoms(yes, no) :-
    retractall(yes(_)),
    retractall(no(_)).

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

info(AGE, adult) :-
    range(AGE, 19, 200).

info(AGE, child) :-
    range(AGE, 0, 18).

range(X, K, Y) :- 
X >= K , X < Y.


diagnosis(schistosomiasis, _Age) :-
    write('Schistosomiasis is a disease caused by parasitic worm that is commonly present in contaminated waters. Most people have no symptoms at first stage of infection. '), nl,
    write('However, when it persists for months, a person may develop fever, chills, cough, and muscle aches. With a history of exposure to contaminated waters, '), nl,
    write('your chances of having acquired this disease is high. It is recommended to get tested and for accurate diagnosis, '), nl, 
    write('you must wait 6- 8 weeks after your last exposure to contaminated waters before getting tested.').

diagnosis(malaria, _Age) :-
    write('Given, that you have been experiencing all the early symptoms of Malaria, it is best to get tested and have formal diagnosis. The infection can become severe if not promptly treated that is'), nl,
    write('why it is recommended to get tested without delay if there is suspicion of infection.'), nl,
    write('For your reference, Malaria is a disease caused by an infective female mosquito. This is a common disease in tropical countries, as higher temperatures allows Anopheles mosquito to thrive.').

diagnosis('acute respiratory infection', _Age) :-
    write('Acute Respiratory Infection is an infection that may cause difficulty in breathing. A respiratory exam will be needed to accurately diagnose this infection.'), nl,
    write('In most cases, the breathing will be observed by a doctor to check if there is an abnormal sound in lungs when breathing. '),
    write('It is advised to seek medical attention and have formal diagnosis.'). 

diagnosis(dengue, _Age) :-
    write('Dengue is a viral infection transmitted by an infected mosquitos of the genus Aedes, which are common in subtropical and tropical areas of the world. '), nl,
    write('Most people recover in a week. However, there are cases where symptoms can worsen. When you observe the following severe-dengue fever, seek immediate medical attention:  '), nl,
    format('~N ~Nstomach pain~Npersistent vomiting~Nbleeding in gums or nose~Nblood in urine or stools~Nbruising', []).

diagnosis(diarrhea, Age) :-
    Age = adult,
    write('Diarrhea is frequent and watery bowel movement, which is a common condition that can be usually resolved without medical intervention.  '), nl,
    format('There are cases, however, where it can be a serious complication. As a/an ~w, if you later experience the following, consult a doctor immediately: ', [Age]),
    format('~N ~Nthirst~Nurinating less than usual~Nfeeling tired~Ndark-colored urine~Ndry mouth~Nsunken eyes or cheeks~Nlight-headedness or fainting~Nstomach pain~Npersistent vomiting~Nbleeding in gums or nose~Nblood in urine or stools~Nbruising.', []).

diagnosis(diarrhea, Age) :-
    Age = child, 
    write('Diarrhea is frequent and watery bowel movement, which is a common condition that can be usually resolved without medical intervention.  '), nl,
    format('There are cases, however, where it can be a serious complication. As a/an ~w, if you later experience the following, consult a doctor immediately: ', [Age]),
    format('~N ~Nthirst~Nurinating less than usual~Nlack of energy~Ndry mouth~Nno tears when crying,~Ndecreased skin turgor~Nsunken eyes ', []).

diagnosis(tuberculosis, _Age) :-
    write('Tuberculosis is a bacterial infection that mainly affects the lungs. It can be latent or active, both of which require treatment.'), nl,
    write('As you have been experiencing symptoms of active Tuberculosis, it is advised to seek medical attention and have formal diagnosis.'). 

diagnosis('COVID-19', _Age) :-
    write('Coronavirus disease (COVID-19) is an infectious disease caused by the SARS-CoV-2 virus. '),
    write('In most cases, infected people self-isolate for at least 10 days, until almost all symptoms are gone.'), nl,
    write('You may want to contact your healthcare provider for testing and isolation duration.').

diagnosis('Hepatitis B', _Age) :-
    write('Hepatitis B is a serious infection in the liver  caused by hepatitis B virus. It spreads when a body fliud of an infected person enters a body of uninfected. It is also referred to as "silent epidemic" as its '), nl,
    write('symptoms does not always show up in the early stage of infection. It quietly attacks and damages the liver for years which in return can lead to an even more serious liver disease. '), nl,
    write('It is best to seek medical attention and have formal diagnosis.'). 

diagnosis(leprosy, _Age) :-
    write('Leprosy, also known as Hansen''s Disease, is an infectious disease that causes skin sores, nerve damage at limbs and skin. It is caused by a bacteria called Mycobacterium leprae which can be transmitted to another person' ), nl,
    write('when a droplet of the bacteria is breathed in.'), nl, nl,
    write('Leprosy is curable and the treatment depends on the type of leprosy. It is then recommended to get tested to determine the type of leprosy that you might have before'), nl,
    write('it gets severe and permanently damage your skin, nerves, arms, legs, feet, and eyes. '). 

diagnosis(pneumonia, _Age) :-
    write('Pneumonia is an iflammation of lungs cause by a bacterial, viral, or fungal infection. When you have a pneuomonia, the air sacks in the lung are filled with pus and fluid which makes breathing difficult and painful.' ), nl,
    write('As you have been experiencing serious symptoms of Pneumonia, it is advised to seek medical attention and have formal diagnosis.'). 


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
    muscle pain,
    joint pain,
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
    6. COVID-19
    fever,
    cough,
    fatigue
    shortness of breath,
    loss of taste or smell
*/

/*
    7. HEPATITIS B 
    abdominal pain
    loss of appetite
    dark urine
    jaundice
*/

/*
    8. LEPROSY
    discolored skin patches or nodules
    nerve damage
    enlarged nerves
*/

/*
    9. SCHISTOSOMIASIS
    rashes
    exposure to contaminated water
*/

/*
    10. PNEUMONIA
    cough
    chest pain
    shortness of breath
    fatigue
    vomiting
    bloody mucus
*/
