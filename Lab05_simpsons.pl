% ARTI 303 - Lab 5: Working with Rules
% Task 1 - The Simpsons Family Tree
% Name: Tala Abdullah

% ---------- Facts: male ----------
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% ---------- Facts: female ----------
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% ---------- Facts: parent(X, Y) means X is a parent of Y ----------
parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% ---------- Rules ----------
father(X, Y)      :- parent(X, Y), male(X).
mother(X, Y)      :- parent(X, Y), female(X).
son(X, Y)         :- parent(Y, X), male(X).
daughter(X, Y)    :- parent(Y, X), female(X).
brother(X, Y)     :- male(X), parent(P, X), parent(P, Y), X \= Y.
sister(X, Y)      :- female(X), parent(P, X), parent(P, Y), X \= Y.
grandfather(X, Z) :- male(X), parent(X, Y), parent(Y, Z).
aunt(X, Y)        :- sister(X, P), parent(P, Y).
uncle(X, Y)       :- brother(X, P), parent(P, Y).
cousin(X, Y)      :- parent(PX, X), parent(PY, Y), (brother(PX, PY) ; sister(PX, PY)).

% ancestor is recursive: base case + recursive case
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
