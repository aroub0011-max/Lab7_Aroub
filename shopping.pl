
:- dynamic basket/1.

basket([apple, milk, coffee, bread, juice]).

start :- menu.

menu :-
    nl,
    writeln('** SHOPPING LIST **'),
    writeln('d. Display all items'),
    writeln('a. Add an item'),
    writeln('e. Exit'),
    write('Enter your choice: '),
    read(Choice),
    handle_choice(Choice).

handle_choice(d) :-
    basket(Items),
    display_items(Items),
    menu.

handle_choice(a) :-
    write('Enter an item: '),
    read(Item),
    retract(basket(Items)),
    append(Items, [Item], NewItems),
    assertz(basket(NewItems)),
    writeln('Item added.'),
    menu.

handle_choice(e) :-
    writeln('Goodbye!').

handle_choice(_) :-
    writeln('Invalid choice.'),
    menu.

display_items([]).
display_items([Head|Tail]) :-
    writeln(Head),
    display_items(Tail).
