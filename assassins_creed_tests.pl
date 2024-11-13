% Load the knowledge base
:- [assassins_creed].


% Query 2: Retrieve all unique abilities specific to each character
test_unique_abilities :-
    writeln('Test 2: Retrieve all unique abilities specific to each character'),
    forall(character_unique_ability(Character, Ability),
           format('~w has unique ability: ~w~n', [Character, Ability])).

% Query 3: Determine if a character has a specific ability, including both default and unique abilities
test_character_ability :-
    writeln('Test 3: Determine if a character has a specific ability (Ezio Auditore)'),
    forall(character_ability('Ezio Auditore', Ability),
           format('Ezio Auditore has ability: ~w~n', [Ability])).

% Query 4: Find all characters who belong to the Assassins faction
test_assassin_faction :-
    writeln('Test 4: Find all characters in the Assassins faction'),
    forall(character_faction(Character, 'Assassins'),
           format('Character in Assassins: ~w~n', [Character])).

% Query 5: Retrieve characters and the factions they belong to
test_all_factions :-
    writeln('Test 5: Retrieve characters and the factions they belong to'),
    forall(character_faction(Character, Faction),
           format('~w belongs to faction: ~w~n', [Character, Faction])).

% Query 6: Identify characters with the same faction (using Ezio Auditore as base)
test_same_faction :-
    writeln('Test 6: Identify characters with the same faction as Ezio Auditore'),
    forall(same_faction('Ezio Auditore', Character2),
           format('Ezio Auditore shares faction with: ~w~n', [Character2])).

% Query 7: Find all characters who use a specific type of weapon (melee)
test_melee_specialization :-
    writeln('Test 7: Find all characters who use melee weapons'),
    forall(specialization(Character, melee),
           format('Character specializing in melee: ~w~n', [Character])).

% Query 8: List all characters and the weapons they commonly use
test_character_weapons :-
    writeln('Test 8: List all characters and their commonly used weapons'),
    forall(character_weapon(Character, Weapon),
           format('~w uses weapon: ~w~n', [Character, Weapon])).

% Query 9: Check which character uses a specific weapon type (Bow)
test_bow_users :-
    writeln('Test 9: Find all characters who use Bow'),
    forall(character_weapon(Character, 'Bow'),
           format('~w uses Bow~n', [Character])).

% Query 10: Check if a character can be identified with only one parameter (Spear)
test_spear_user :-
    writeln('Test 10: Identify character using a unique weapon (Spear)'),
    (find_my_character(Character, 'Spear', _, _, _) ->
        format('Character using Spear: ~w~n', [Character])
    ;   writeln('No character found with Spear')).

% Run all tests
run_all_tests :-
    test_unique_abilities,
    nl,
    test_character_ability,
    nl,
    test_assassin_faction,
    nl,
    test_all_factions,
    nl,
    test_same_faction,
    nl,
    test_melee_specialization,
    nl,
    test_character_weapons,
    nl,
    test_bow_users,
    nl,
    test_spear_user.
