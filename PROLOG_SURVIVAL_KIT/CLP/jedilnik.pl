glavna_jed(pecen_kunec_s_paradiznikom).
glavna_jed(juncja_jetrca_v_omaki).
glavna_jed(zelenjavna_frtajla_z_zelisci).
glavna_jed(polnjene_bucke).

predjed(gobova_juha_z_ajdovo_kaso).
predjed(goveja_juha).
predjed(paradiznikova_juha).

priloga(polenta).
priloga(dusena_zelenjava).
priloga(pecen_mlad_krompir).
priloga(leca).

sladica(tortica).
sladica(mafin).

sadje(jabolko).
sadje(pomaranca).
sadje(banana).

vege(zelenjavna_frtajla_z_zelisci).
vege(polnjene_bucke).
vege(gobova_juha_z_ajdovo_kaso).
vege(leca).
vege(paradiznikova_juha).
vege(polenta).
vege(dusena_zelenjava).
vege(pecen_mlad_krompir).
vege(tortica).
vege(mafin).
vege(jabolko).
vege(pomaranca).
vege(banana).

cena(pecen_kunec_s_paradiznikom, 251).
cena(juncja_jetrca_v_omaki, 214).
cena(zelenjavna_frtajla_z_zelisci, 145).
cena(polnjene_bucke, 119).
cena(gobova_juha_z_ajdovo_kaso, 134).
cena(goveja_juha, 61).
cena(paradiznikova_juha, 52).
cena(polenta, 81).
cena(dusena_zelenjava, 102).
cena(pecen_mlad_krompir, 95).
cena(leca, 98).
cena(tortica, 121).
cena(mafin, 148).
cena(jabolko, 32).
cena(pomaranca, 49).
cena(banana, 58).

kalorije(pecen_kunec_s_paradiznikom, 453).
kalorije(juncja_jetrca_v_omaki, 381).
kalorije(zelenjavna_frtajla_z_zelisci, 145).
kalorije(polnjene_bucke, 182).
kalorije(gobova_juha_z_ajdovo_kaso, 153).
kalorije(goveja_juha, 108).
kalorije(paradiznikova_juha, 104).
kalorije(polenta, 275).
kalorije(dusena_zelenjava, 84).
kalorije(pecen_mlad_krompir, 231).
kalorije(leca, 321).
kalorije(tortica, 398).
kalorije(mafin, 377).
kalorije(jabolko, 126).
kalorije(pomaranca, 47).
kalorije(banana, 190).

beljakovine(pecen_kunec_s_paradiznikom, 53).
beljakovine(juncja_jetrca_v_omaki, 46).
beljakovine(zelenjavna_frtajla_z_zelisci, 12).
beljakovine(polnjene_bucke, 11).
beljakovine(gobova_juha_z_ajdovo_kaso, 7).
beljakovine(goveja_juha, 15).
beljakovine(paradiznikova_juha, 14).
beljakovine(polenta, 26).
beljakovine(dusena_zelenjava, 10).
beljakovine(pecen_mlad_krompir, 3).
beljakovine(leca, 29).
beljakovine(tortica, 21).
beljakovine(mafin, 24).
beljakovine(jabolko, 0).
beljakovine(pomaranca, 0).
beljakovine(banana, 1).

ogljikovi_hidrati(pecen_kunec_s_paradiznikom, 21).
ogljikovi_hidrati(juncja_jetrca_v_omaki, 23).
ogljikovi_hidrati(zelenjavna_frtajla_z_zelisci, 39).
ogljikovi_hidrati(polnjene_bucke, 31).
ogljikovi_hidrati(gobova_juha_z_ajdovo_kaso, 19).
ogljikovi_hidrati(goveja_juha, 8).
ogljikovi_hidrati(paradiznikova_juha, 10).
ogljikovi_hidrati(polenta, 41).
ogljikovi_hidrati(dusena_zelenjava, 13).
ogljikovi_hidrati(pecen_mlad_krompir, 29).
ogljikovi_hidrati(leca, 21).
ogljikovi_hidrati(tortica, 31).
ogljikovi_hidrati(mafin, 29).
ogljikovi_hidrati(jabolko, 14).
ogljikovi_hidrati(pomaranca, 13).
ogljikovi_hidrati(banana, 21).

:- use_module(library(clpfd)).
:- use_module(library(clpr)).

kosilo([A,B,C,D]) :-
	glavna_jed(A),
	priloga(B),
	(predjed(C), sladica(D); predjed(C), sadje(D); sladica(C), sadje(C)).

vege_kosilo(Kosilo) :-
	maplist(vege, Kosilo). % Vrne true, ce predikat vege vrne true za vse elemente seznama Kosilo

vege_kosilo2([H]) :-
	vege(H).
vege_kosilo2([]).
vege_kosilo2([H|T]) :-
	vege(H),
	vege_kosilo(T).

ustrezno_kosilo(Kosilo, MaxCena, MinKalorij, MaxKalorij, MinBeljakovin, MinOH) :-
	maplist(cena, Kosilo, Cene), % Poiskusi aplicirati predikat cena na vse elemente seznama Kosilo (prvi argument) in elemente Cene (drugi argument)
	maplist(kalorije, Kosilo, Kalorije), % Podobno...
	maplist(beljakovine, Kosilo, Beljakovine),
	maplist(ogljikovi_hidrati, Kosilo, OH),
	sum(Kalorije, #>=, MinKalorij), % Ali je vsota vseh elementov v Kalorije večja od MinKalorij? OMEJITEV DOMENE SPREMENLJIVKE
	sum(Kalorije, #=<, MaxKalorij), % podobno...
	sum(Beljakovine, #>=, MinBeljakovin),
	sum(OH, #>=, MinOH),
	sum(Cene, #=<, MaxCena).