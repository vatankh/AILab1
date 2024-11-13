from pyswip import Prolog
import readline  # To enable history navigation with up/down keys

canonical_map = {
    "weapons": {
        "hidden blade": "Hidden Blade",
        "sword": "Sword",
        "bow": "Bow",
        "firearm": "Firearm",
        "bombs": "Bombs",
        "throwing knives": "Throwing Knives",
        "shield": "Shield",
        "spear": "Spear"
    },
    "factions": {
        "assassins": "Assassins",
        "templars": "Templars",
        "pirates": "Pirates",
        "eagle bearers": "Eagle Bearers"
    },
    "abilities": {
        "eagle vision": "Eagle Vision",
        "stealth techniques": "Stealth Techniques",
        "close combat skills": "Close Combat Skills",
        "parkour mastery": "Parkour Mastery",
        "naval combat": "Naval Combat",
        "mounted combat": "Mounted Combat",
        "unique abilities": "Unique Abilities"
    }
}

def get_canonical_value(category, value):
    value_lower = value.lower()
    return str(canonical_map[category].get(value_lower, value))

def find_ability(user_input):
    words = user_input.split()

    try:
        # Find the index of "has the ability to"
        ability_index = words.index("ability") + 2
        ability = words[ability_index].lower()

        # Check for multi-word abilities
        if ability == "eagle" and len(words) > ability_index + 1:
            next_word = words[ability_index + 1].lower()
            if next_word == "vision":
                ability += f" {next_word}"
        elif ability == "stealth" and len(words) > ability_index + 1:
            next_word = words[ability_index + 1].lower()
            if next_word == "techniques":
                ability += f" {next_word}"
        elif ability == "close" and len(words) > ability_index + 2:
            if words[ability_index + 1].lower() == "combat" and words[ability_index + 2].lower() == "skills":
                ability += " combat skills"

        ability = get_canonical_value("abilities", ability)
        if ability in canonical_map["abilities"].values():
            return ability
        else:
            available_abilities = "', '".join(canonical_map["abilities"].values())
            return f"There is no such ability -> {ability}\nAvailable abilities are {available_abilities}\n"

    except (ValueError, IndexError):
        return ""


# Canonical map for validation
def find_faction(user_input):
    words = user_input.split()

    try:
        # Find the index of "from the"
        from_index = words.index("from") + 2
        faction = words[from_index].lower()

        # Handle multi-word factions like "eagle bearers"
        if faction == "eagle" and len(words) > from_index + 1:
            next_word = words[from_index + 1].lower()
            if next_word == "bearers":
                faction += f" {next_word}"

        faction = get_canonical_value("factions", faction)
        if faction in canonical_map["factions"].values():
            return faction
        else:
            available_factions = "', '".join(canonical_map["factions"].values())
            return f"There is no such faction -> {faction} \nAvailable factions are {available_factions}\n"

    except (ValueError, IndexError):
        return ""


def find_style(user_input):
    words = user_input.split()

    try:
        # Find the index of "in" for fighting style
        style_index = words.index("in") + 1
        style = words[style_index].lower()

        # Directly return the recognized styles (either "melee" or "ranged")
        if style in ["melee", "ranged"]:
            return style
        else:
            return f"There is no such style -> {style}. Available styles are: melee, ranged."

    except (ValueError, IndexError):
        return ""


def find_weapon(user_input):
    # Take input from the user

    # Split the input into words
    words = user_input.split()

    try:
        # Find the index of "uses"
        uses_index = words.index("uses")

        # Get the word right after "uses" and convert it to lowercase
        weapon = words[uses_index + 1].lower()

        if weapon == 'a' and len(words) > uses_index + 2:
            weapon = words[uses_index + 2].lower()

        if weapon == "hidden" and len(words) > uses_index + 3:
            nextWord = words[uses_index + 3].lower()
            if nextWord == "blade":
                weapon += f" {nextWord}"
        elif weapon == "throwing" and len(words) > uses_index + 3:
            nextWord = words[uses_index + 3].lower()
            if nextWord == "knives":
                weapon += f" {nextWord}"

        weapon = get_canonical_value("weapons", weapon)
        if weapon in canonical_map["weapons"].values():
            return weapon
        else:
            list = "', '".join(canonical_map["weapons"].values())
            return f"There is no such weapon -> {weapon} \n available weapon are {list}"

    except ValueError:
        return ""
    except IndexError:
        return ""

def get_user_preferences():
    user_input = input("\nEnter your preferences (or type 'exit' to quit):\n")

    if user_input.lower() == "exit":
        return None, None, None, None, True  # Last argument indicates exit

    # Add the current input to readline history for navigation
    readline.add_history(user_input)

    weapon = find_weapon(user_input)
    ability = find_ability(user_input)
    faction = find_faction(user_input)
    style = find_style(user_input)
    print(f"weapon = {weapon}")
    print(f"ability = {ability}")
    print(f"faction = {faction}")
    print(f"style = {style}")

    errors = []
    if "no such" in weapon:
        errors.append(weapon)
    if "no such" in ability:
        errors.append(ability)
    if "no such" in faction:
        errors.append(faction)
    if "no such" in style:
        errors.append(style)

    if errors:
        print("\nErrors in your input:")
        print("\n".join(errors))
        return None, None, None, None, False
    else:
        return weapon, ability, faction, style, False

def recommend_character():
    prolog = Prolog()
    prolog.consult("assassins_creed.pl")  # Load your Prolog file
    print("Please provide your preferences in the following format:")
    print("Examples:")
    print("1. I want a character from the Assassins faction, who uses a sword in melee style and has the ability to stealth techniques")
    print("2. I want a character from the Templars faction, who uses a bow in ranged style and has the ability to eagle vision")
    print("3. I want a character from the Pirates faction, who uses a firearm in ranged style and has the ability to naval combat")
    while True:
        weapon, ability, faction, style, exit_requested = get_user_preferences()

        if exit_requested:
            print("Exiting the application. Goodbye!")
            break

        weapon_query = f"'{weapon}'" if weapon else "_"
        ability_query = f"'{ability}'" if ability else "_"
        faction_query = f"'{faction}'" if faction else "_"
        style_query = f"'{style}'" if style else "_"

        query = f"find_my_character(Character, {weapon_query}, {style_query}, {faction_query}, {ability_query})"
        print(f"Executing query: {query}")

        results = list(prolog.query(query))

        if results:
            if len(results) == 7:
                results.pop()
            print("\nRecommended Characters:")
            for result in results:
                print("- ", result["Character"])
        else:
            print("No characters match your preferences.")

if __name__ == '__main__':
    recommend_character()
