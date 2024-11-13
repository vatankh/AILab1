### Описание целей проекта и его значимости

Цель проекта — создание базы знаний для вселенной *Assassin's Creed* на Prolog, позволяющей выполнять логические запросы для анализа персонажей, оружия и фракций. Значимость проекта:
1. **Обучение логическому программированию** — усвоение работы с базами знаний.
2. **Применение ИИ в играх** — демонстрация применения ИИ для поддержки решений и рекомендаций в игровой среде.
3. **Онтологический анализ** — перевод знаний в онтологию для развития навыков моделирования.

### Анализ требований

#### Основные требования к системе поддержки принятия решений

1. **Запросы от пользователя**: ввод характеристик и предпочтений для анализа персонажей и оружия.
2. **Анализ и рекомендации**: логические запросы к базе знаний для поиска персонажей с нужными характеристиками.
3. **Гибкость запросов**: поддержка простых и сложных запросов с использованием логических операторов и правил.
4. **Диалоговая система**: интерактивность для точных рекомендаций.
5. **Точность запросов**: корректные результаты на основе знаний базы.

#### Требования к базе знаний и онтологии

1. **Структура базы**: не менее 20 фактов, 10-15 фактов со связями, 5-7 правил для описания персонажей, оружия и фракций.
2. **Создание онтологии**: концепты и свойства, соответствующие фактам в Prolog, с иерархией классов.
3. **Проверка работоспособности**: тестирование запросов и функциональности в Protege.


#### Реализация системы искусственного интеллекта

```prolog
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
```


### Тест результат
```prolog
?- run_all_tests.

Test 2: Retrieve all unique abilities specific to each character
Ezio Auditore has unique ability: Parkour Mastery
Edward Kenway has unique ability: Naval Combat
Bayek of Siwa has unique ability: Mounted Combat
Kassandra has unique ability: Unique Abilities

Test 3: Determine if a character has a specific ability (Ezio Auditore)
Ezio Auditore has ability: Eagle Vision
Ezio Auditore has ability: Stealth Techniques
Ezio Auditore has ability: Close Combat Skills
Ezio Auditore has ability: Parkour Mastery

Test 4: Find all characters in the Assassins faction
Character in Assassins: Ezio Auditore
Character in Assassins: Altaïr Ibn-LaʼAhad
Character in Assassins: Connor Kenway
Character in Assassins: Bayek of Siwa

Test 5: Retrieve characters and the factions they belong to
Ezio Auditore belongs to faction: Assassins
Altaïr Ibn-LaʼAhad belongs to faction: Assassins
Connor Kenway belongs to faction: Assassins
Edward Kenway belongs to faction: Pirates
Bayek of Siwa belongs to faction: Assassins
Kassandra belongs to faction: Eagle Bearers

Test 6: Identify characters with the same faction as Ezio Auditore
Ezio Auditore shares faction with: Altaïr Ibn-LaʼAhad
Ezio Auditore shares faction with: Connor Kenway
Ezio Auditore shares faction with: Bayek of Siwa

Test 7: Find all characters who use melee weapons
Character specializing in melee: Ezio Auditore
Character specializing in melee: Altaïr Ibn-LaʼAhad
Character specializing in melee: Connor Kenway
Character specializing in melee: Bayek of Siwa
Character specializing in melee: Kassandra

Test 8: List all characters and their commonly used weapons
Ezio Auditore uses weapon: Hidden Blade
Ezio Auditore uses weapon: Sword
Ezio Auditore uses weapon: Firearm
Ezio Auditore uses weapon: Bombs
Altaïr Ibn-LaʼAhad uses weapon: Hidden Blade
Altaïr Ibn-LaʼAhad uses weapon: Sword
Altaïr Ibn-LaʼAhad uses weapon: Throwing Knives
Connor Kenway uses weapon: Hidden Blade
Connor Kenway uses weapon: Sword
Connor Kenway uses weapon: Bow
Connor Kenway uses weapon: Firearm
Edward Kenway uses weapon: Firearm
Edward Kenway uses weapon: Bombs
Edward Kenway uses weapon: Bow
Bayek of Siwa uses weapon: Hidden Blade
Bayek of Siwa uses weapon: Sword
Bayek of Siwa uses weapon: Bow
Bayek of Siwa uses weapon: Shield
Kassandra uses weapon: Sword
Kassandra uses weapon: Spear
Kassandra uses weapon: Shield

Test 9: Find all characters who use Bow
Connor Kenway uses Bow
Edward Kenway uses Bow
Bayek of Siwa uses Bow

Test 10: Identify character using a unique weapon (Spear)
Character using Spear: Kassandra

true.

?- 
```

### Оценка и интерпретация результатов

1. **Запросы**:
   - **Prolog**: поиск персонажей по фракциям, характеристикам и специализациям.
   - **Protege**: визуализация и запросы по классу "Ассасины" и типу атаки.
2. **Соответствие требованиям**: проект соответствует требованиям по структуре, запросам и поддержке диалога.
3. **Возможности развития**:
   - **Расширение базы и онтологии**: добавление новых фактов и подклассов.
   - **Диалоговая система**: улучшение взаимодействия с пользователем.
   - **Визуализация данных**: для лучшего анализа.

### Заключение

Проект демонстрирует:
1. **Образовательное значение**: изучение логического программирования и онтологий.
2. **Применение в играх**: создание рекомендательных систем и стратегий.
3. **Интерактивные рекомендации**: создание персонализированных предложений.

Система имеет широкие перспективы для дальнейшего применения и развития в сферах искусственного интеллекта и анализа данных.
