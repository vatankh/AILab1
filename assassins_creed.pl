% Assassin's Creed Universe Knowledge Base
% Simplified with default abilities for all characters and unique abilities specified separately.

% Characters in the game series
character('Ezio Auditore').          % Main character in Assassin's Creed II
character('Altaïr Ibn-LaʼAhad').      % Main character in Assassin's Creed I
character('Connor Kenway').           % Main character in Assassin's Creed III
character('Edward Kenway').           % Main character in Assassin's Creed IV
character('Bayek of Siwa').           % Main character in Assassin's Creed Origins
character('Kassandra').               % Main character in Assassin's Creed Odyssey

% Types of weapons used by characters
weapon('Hidden Blade').               % Signature weapon of Assassins
weapon('Sword').                      % Common weapon in combat
weapon('Bow').                        % Long-range weapon used by certain characters
weapon('Firearm').                    % Ranged weapon option for some characters
weapon('Bombs').                      % Used by Ezio for strategic combat
weapon('Throwing Knives').            % Used by Altaïr for stealth attacks
weapon('Shield').                     % Used by Bayek and Robert for defense
weapon('Spear').                      % Kassandra's unique weapon

% Factions in the game
faction('Assassins').                 % Main faction players belong to
faction('Templars').                  % Primary adversary faction
faction('Pirates').                   % Faction in Assassin's Creed IV
faction('Eagle Bearers').             % Faction in Assassin's Creed Odyssey

% Default abilities all characters have
default_ability('Eagle Vision').              % Ability to see hidden objects and enemies
default_ability('Stealth Techniques').        % Techniques for remaining undetected
default_ability('Close Combat Skills').       % Combat skills in close range



% Unique abilities that only certain characters have
character_unique_ability('Ezio Auditore', 'Parkour Mastery').    % Unique movement skills
character_unique_ability('Edward Kenway', 'Naval Combat').       % Unique naval skills
character_unique_ability('Bayek of Siwa', 'Mounted Combat').     % Mounted combat skills
character_unique_ability('Kassandra', 'Unique Abilities').       % Unique abilities in combat



% Character affiliations with factions
character_faction('Ezio Auditore', 'Assassins').
character_faction('Altaïr Ibn-LaʼAhad', 'Assassins').
character_faction('Connor Kenway', 'Assassins').
character_faction('Edward Kenway', 'Pirates').
character_faction('Bayek of Siwa', 'Assassins').
character_faction('Kassandra', 'Eagle Bearers').

% Characters and the weapons they commonly use
character_weapon('Ezio Auditore', 'Hidden Blade').
character_weapon('Ezio Auditore', 'Sword').
character_weapon('Ezio Auditore', 'Firearm').
character_weapon('Ezio Auditore', 'Bombs').

character_weapon('Altaïr Ibn-LaʼAhad', 'Hidden Blade').
character_weapon('Altaïr Ibn-LaʼAhad', 'Sword').
character_weapon('Altaïr Ibn-LaʼAhad', 'Throwing Knives').

character_weapon('Connor Kenway', 'Hidden Blade').
character_weapon('Connor Kenway', 'Sword').
character_weapon('Connor Kenway', 'Bow').
character_weapon('Connor Kenway', 'Firearm').


character_weapon('Edward Kenway', 'Firearm').
character_weapon('Edward Kenway', 'Bombs').
character_weapon('Edward Kenway', 'Bow').



character_weapon('Bayek of Siwa', 'Hidden Blade').
character_weapon('Bayek of Siwa', 'Sword').
character_weapon('Bayek of Siwa', 'Bow').
character_weapon('Bayek of Siwa', 'Shield').

character_weapon('Kassandra', 'Sword').
character_weapon('Kassandra', 'Spear').
character_weapon('Kassandra', 'Shield').

% Weapons and their type (melee or ranged)
weapon_type('Hidden Blade', melee).
weapon_type('Sword', melee).
weapon_type('Bow', ranged).
weapon_type('Firearm', ranged).
weapon_type('Bombs', ranged).
weapon_type('Throwing Knives', ranged).
weapon_type('Shield', melee).
weapon_type('Spear', melee).

% Rules to derive relationships or characteristics based on facts

% Rule to Assign default abilities to each character
character_default_ability(Character, Ability) :-
    character(Character),
    default_ability(Ability).

% Rule to check if a character has a specific ability (default or unique)
character_ability(Character, Ability) :-
    character_default_ability(Character, Ability);
    character_unique_ability(Character, Ability).


% Rule to find character based on args
find_my_character(Character, Weapon, Type, Faction, Ability) :-
    distinct(Character, (
        (character_weapon(Character, Weapon) ; var(Weapon)),
        (weapon_type(Weapon, Type) ; var(Type)),
        (character_faction(Character, Faction) ; var(Faction)),
        (character_ability(Character, Ability) ; var(Ability))
    )).

% Rule to find characters in same faction
same_faction(Character1, Character2) :-
    character_faction(Character1, Faction),
    character_faction(Character2, Faction),
    Character1 \= Character2.

% Rule to check character specialization melee or ranged
specialization(Character, Type) :-
    distinct(Character,(
        character_weapon(Character, Weapon),
        weapon_type(Weapon, Type)
    )).







    
