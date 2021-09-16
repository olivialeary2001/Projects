%Olivia Leary (R11616039) | Assignment #5 | 8/4/2021
%The purpose of this program is to create a family tree
%based on facts given by the assignment. 

%START OF FACTS%
male(kaden).
male(greyson).
male(nicolas).
male(finn).
male(grant).
male(maverick).
male(paul).
male(andrew).
male(kyle).
male(prince).
male(adriel).
male(jeremy).
male(dean).
male(walter).
male(bryce).
male(julian).
male(graham).
male(ethan).
male(anthony).
male(hudson).
female(margaret).
female(elaina).
female(alivia).
female(gemma).
female(leila).
female(hope).
female(madelyn).
female(kaylee).
female(zoe).
female(gracie).
female(mackenzie).
female(arianna).
female(paisley).
female(quinn).
female(mary).
female(teagan).
female(selena).
female(abigail).
female(alana).
female(camila).

parent(gracie, kyle).
parent(nicolas, paisley).
parent(teagan, paisley).
parent(kaylee, camila).
parent(madelyn, julian).
parent(greyson, adriel).
parent(greyson, hope).
parent(walter, andrew).
parent(zoe, hope).
parent(selena, graham).
parent(arianna, leila).
parent(kaylee, nicolas).
parent(anthony, graham).
parent(zoe, adriel).
parent(prince, alana).
parent(walter, leila).
parent(madelyn, abigail).
parent(teagan, ethan).
parent(gemma, quinn).
parent(kyle, quinn).
parent(finn, prince).
parent(adriel, nicolas).
parent(arianna, andrew).
parent(andrew, julian).
parent(adriel, camila).
parent(alana, mackenzie).
parent(bryce, mackenzie).
parent(margaret, alana).
parent(selena, walter).
parent(greyson, kaden).
parent(anthony, gracie).
parent(nicolas, ethan).
parent(hope, prince).
parent(jeremy, kyle).
parent(zoe, kaden).
parent(andrew, abigail).
parent(selena, gracie).
parent(anthony, walter).
%END OF FACTS%

mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
sibling(X, Y) :- parent(Z, X), parent(Z,Y), X \= Y.
brother(X,Y) :- sibling(X,Y), male(X).
sister(X,Y) :- sibling(X,Y), female(X).
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
descendant(X,Y) :- ancestor(Y,X).
relative(X,Y) :- ancestor(Z,X), ancestor(Z,Y), X \= Y.