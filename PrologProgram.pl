male(bob).
male(grandpa).
male(shane).
male(richard).
male(papaw).
male(mike).
male(daniel).
male(lex).
male(anthony).
male(granny_dad).
male(chris).
male(duke).

female(crystal).
female(amy).
female(granny).
female(yaya).
female(laurie).
female(olivia).
female(mallory).
female(jill).
female(berkley).
female(leah).
female(keely).
female(granny_mom).

parent(granny_mom, granny).
parent(granny_mom, laurie).
parent(granny_mom, lex).
parent(granny_dad, granny).
parent(granny_dad, laurie).
parent(granny_dad, lex).

parent(granny, crystal).
parent(granny, amy).
parent(papaw, crystal).
parent(papaw, amy).

parent(yaya, bob).

parent(laurie,jill).

parent(bob,olivia).
parent(bob,shane).
parent(bob,mallory).
parent(bob,richard).
parent(crystal,olivia).
parent(crystal,shane).
parent(crystal,mallory).
parent(crystal,richard).

parent(amy, daniel).
parent(amy, leah).
parent(amy, keely).
parent(mike, daniel).
parent(mike, leah).
parent(mike, keely).

parent(jill,berkley).
parent(anthony,berkley).

parent(olivia,duke).
parent(chris,duke).

sibling(X, Y) :- parent(Z, X), parent(Z,Y), X \= Y.
brother(X,Y) :- sibling(X,Y), male(X).
sister(X,Y) :- sibling(X,Y), female(X).
father(X,Y) :- parent(X,Y), male(x).
mother(X,Y) :- parent(X,Y), female(X).
child(X,Y) :- parent(Y,X).
son(X,Y) :- child(X,Y), male(X).
daughter(X,Y) :- child(X,Y), female(X).
aunt(X,Y) :- parent(Z,Y), sibling(Z,X), female(X).
uncle(X,Y) :- parent(Z,Y), sibling(Z,X), male(X).
niece(X,Y) :- sibling(Y, Z), daughter(X, Z).
nephew(X, Y) :- sibling(Y, Z), son(X, Z).
cousin(X,Y) :- parent(Z,X),parent(D,Y),sibling(Z,D).
secondcousin(X,Y) :- parent(Z,X), parent(D,Y), cousin(Z,D).
grandparent(X,Y) :- parent(Z,Y), parent(X,Z).
grandchild(X,Y) :- grandparent(Y,X).
granddaughter(X,Y) :- grandchild(X,Y), female(X).
grandson(X,Y) :- grandchild(X,Y), male(X).
grandfather(X,Y) :- grandparent(X,Y), male(X).
grandmother(X,Y) :- grandparent(X,Y), female(X).
greatgrandparent(X,Y) :- parent(X,Z), grandparent(Z,Y).
greatgrandmother(X,Y) :- parent(X,Z), grandparent(Z,Y), female(X).
greatgrandfather(X,Y) :- parent(X,Z), grandparent(Z,Y), male(X).
greatgrandchild(X,Y) :- greatgrandparent(Y,X).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
descendent(X,Y) :- ancestor(Y,X).
relative(X,Y) :- ancestor(Z,X), ancestor(Z,Y).




