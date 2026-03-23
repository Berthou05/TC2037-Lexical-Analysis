% Automaton definition for the language of valid identifiers
% The automaton is defined as follows:
move(q0, "D", q1).

move(q1, "i", q2).
move(q1, "o", q5).
% Since Prolog does not support the character 'ô' directly, we will use '0'.
% move(q1, 'ô', q7). will be represented as:
move(q1, "0", q7).

move(q1, "r", q9).

move(q2, "n", q3).
move(q3, "a", q4).

move(q5, "l", q6).

move(q7, "r", q8).

move(q9, "a", q10).
move(q10, "u", q11).
move(q11, "g", q12).

move(q9, "e", q13).
move(q13, "g", q14).
move(q14, "o", q15).

% The initial state of the automaton
initial(q0).

% The final (accepting) states of the automaton
final(q4).
final(q6).
final(q8).
final(q12).
final(q15).

% The accept predicate checks if a given string is accepted by the automaton

accept(State, []) :-
    final(State).

accept(State, [T|H]) :-
    move(State, T, NextState),
    accept(NextState, H).

recognizes(String) :-
    initial(InitialState),
    % Using the function string_chars/2 to convert the input string into a list of characters
    string_chars(String, Chars),
    accept(InitialState, Chars).