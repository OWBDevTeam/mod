import os, glob, re
filenames = []
def getrawstatelines(filename):
    os.chdir ("states")
    with open(filename, "r") as file:
        rawtext = file.readlines()  # reads out all of the lines into an array
        rawtext = [x.strip("\n") for x in rawtext]  # takes out the new lines from each of the lines
    return rawtext

def provinceparser():
    pass
def generatenewfile():
    for file in glob.glob("*.txt"):
        filenames.append(file)

    for i in range(len(filenames)):
        with open(filenames[i], 'w+') as outfile:
            nospacename = filenames[i].strip()
            splitstatename = nospacename.split("-", 1)
            stateid = splitstatename[0]
            statename = splitstatename[1]
            # os.rename(filenames[i], filenames[i].replace(filenames[i], str(stateid) + "-STATE_PLACEHOLDER_" + str(stateid) + ".txt"))
            outfile.write("state {\n")
            outfile.write("\tid = " + str(stateid) + " # State ID, if you are editing a default state file DO NOT CHANGE")
            outfile.write("\n\tname = 'STATE_" + str(
                stateid) + "' # State name, edit this to the name you want the state to have in game")
            outfile.write("\n\t")
            outfile.write(
                "\n\t # actually models the amount of population in this state. The actual amount of manpower gained from it is based off of conscription laws, think of this like a maximum amount that could potentially be gained.")
            outfile.write("\n\tmanpower = 0")
            outfile.write(
                "\n\tstate_category = rural" + " # State category determines the amount of building slots this state has, more info about what each category is can be found in common/state_categories")
            outfile.write("\n\thistory {")
            outfile.write("\n\t\t# owner of the state at the start of the game, change to the appropriate tag")
            outfile.write("\n\t\t owner = NCR")
            outfile.write("\n")
            outfile.write("\n\t\tbuildings = {")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t# Infrastructure level of this state, determines supply throughput, how fast factories can build, and how fast divisions can move and recover (0-10)")
            outfile.write("\n\t\t\tinfrastructure = 0")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t# Air base level of the state, determines the amount of planes allowed. Each level supports 200 plans without penalties being applied (0-10)")
            outfile.write("\n\t\t\tair_base = 0" + " ")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t# number of civilian factories that will start in this state, limited by building slots to a maximum of 20 in one state (0-20)")
            outfile.write("\n\t\t\tindustrial_complex = 0")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t# number of military factories that will start in this state, same as civilian factories it's limited by building slots up to a maximum of 20 in one state (0-20)")
            outfile.write("\n\t\t\tarms_factory = 0")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t# number of naval dockyards that will start in this state, state MUST BE COASTAL. Same as civilian factories it's limited by building slots up to a maximum of 20 in one state (0-20)")
            outfile.write("\n\t\t\tdockyard = 0")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t# number of anti-aircraft guns in a state. Both reduces damage to factories and damages enemy aircraft attacking buildings in the state. DOES NOT TARGET FIGHTERS (0-5)")
            outfile.write("\n\t\t\tanti_air_building = 0")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t# if you want to add local buildings, uncomment the following as needed and do it here. The Syntax is as follows:")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t" + str(provincelist[provincecounter]) + " {" + " # change this to the province number/id that you want to add the buildings to here")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t\t# adds local naval bases to the province, must be coastal. Naval bases repair 0.075 HP worth of ships per level of base per hour, divided evenly between all ships docked at that base for repairs. (0-10)")
            outfile.write("\n\t\t\t\t#naval_base = 0")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t\t# adds local land fort to the province. Reduces the attack and defense of land invaders by 15% per level (0-10)")
            outfile.write("\n\t\t\t\t#bunker = 0")
            outfile.write("\n")
            outfile.write(
                "\n\t\t\t\tadds local coastal fort to the province. Province must be adjacent to a sea tile. Reduces the attack and defense of sea invaders by 15% per level, does NOT affect non-naval invasions (0-10)")
            outfile.write("\n\t\t\t\t#coastal_bunker = 0")
            outfile.write("\n\t\t\t\t")
            outfile.write("\n\t\t\t\t}")
            outfile.write("\n\t\t}")
            outfile.write(
                "\n\t\t# Determines which countries have a core on this state. In general the owner of this province should also have a core. Core states give much more manpower to their owner and allow those who don't own the state to fabricate claims easier.")
            outfile.write("\n\t\tadd_core_of = NCR")
            outfile.write("\n\t}")
            (
                "\n\t # (below) determines what provinces are in the state, you can easily find what number a province is by going in game and typing 'tdebug' into the console, then hovering over the province in question")
            outfile.write("\n\t provinces {")
            outfile.write("\n\t\t\t" + str(provincelist[provincecounter]))
            outfile.write("\n\t}")
            outfile.write("\n}")