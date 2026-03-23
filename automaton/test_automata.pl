% Import the automaton definition and testing utilities
:- ["automata"].

% Import the readutil library for reading test cases from a file
:- use_module(library(readutil)).

test_string(String) :-
    recognizes(String),
    write('Accepted: '), writeln(String),
    !.

test_string(String) :-
    write('Rejected: '), writeln(String).

run_test_accepted :-
    Tests = ["Dina", "Dol", "D0r", "Draug", "Drego"],
    test_list(Tests).

run_test(File) :-
    % Read test cases from the specified file
    read_file_to_string(File, Content, []),
    % Split the content into lines and filter out empty lines
    split_string(Content, "\n", "\r\t ", RawTests),
    exclude(=(""), RawTests, Tests),
    test_list(Tests).

test_list([]).
test_list([H|T]) :-
    test_string(H),
    test_list(T).