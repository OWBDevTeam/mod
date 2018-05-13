====================================
=OWB Modders Guide -- Written by Mechano=
====================================


---- For OWB Team and Submodders ----


Preamble: 
OWB is somewhat unique in a few ways with new modded in mechanics which those either working in the main project or as submodders may want to know about. Underneath some of these are listed. Note that this is not a general modding tutorial and assumes you have some understanding of modding HOI4.
=======================================================
=DATABASE -- MAKING NEW NATIONS AND CHANGING OLD ONES=
=======================================================
------------------
-General Info-
------------------
Since there is no way to properly define nation categories in HOI4, we have defined 6 generic nation categories pertaining to most nations. These are as follows:


Settler (most generic)
Raider
Tribal
Brotherhood
Ghoul
Supermutant


Each of these categories has associated portraits, voice files, and database entries which you must add for your nation to have these features enabled for your nation. If you are working on the Old World Blues team, all of the following still works, just put it into existing files rather than creating new ones.




Portraits:
Found in the oldworldblues/portraits. You will see our existing categories setup in there, it’s recommended that you create your own file rather than modifying our existing one, it can be called anything just put it into the same portraits folder. Each set of portraits is defined by the unique 3 letter TAG for your nation with separators in between them. Find the category you want to use and then copy from the start of any nation within denoted by “TAG = {“ to the end with the last curly brace. Paste that into your newly created file and change the TAG to your nation. Your nation will now generate generic portraits from this category.
TIP: if you want to use any of these portraits for leader portraits, for commanders you can use “portrait_path = “ or for country leaders “portrait = “ when generating leaders.
Names: 
        Similar to portrait files and not necessarily related just to nation categories, this one is optional and only for stuff like tribals in our mod. In common/names, add a new text file, inside you might spot a category you want to use, similar to portraits just copy paste a section and replace their TAG with your own. Otherwise you can add your own names and such, these are used for things like generated ace pilots, country leaders, commanders etc.


Voice Files:
        Again, similar to portrait files, you can find the voice files in oldworldblues/sound. In there you will see files called “vo_nationcategory”, E.X “vo_ghoul” for ghoul voices. Even though these are called “.asset” files they are essentially just normal text files, you can read them and save them with any text editor. Create a new .asset file, or copy an existing one and change its name. Copy the whole top section, which starts with “category = “. Once you have that top section, copy over one of the existing sections for a nation. Each one should have a comment showing the top of it, I.E “########## BRK”, copy all of this section until another nation’s section or the sound files section. In your new file, you should now have a top section which says “category =” and a bunch of sections saying “sound effect =”. Inside your file, for the top “category =” section, it has a “sound effects =” section inside it, remove all of entries with other tags except for the nation you copied the other section (“sound effect =”) from. Now just simply replace all instances of the 3 letter TAG you copied from to your new/modified nation, and then in game your nation will have the voices for that category of nation.




Database Entries: 
Old World Blues also explicitly defines some nations with a certain category, E.X for decisions, events, determining generic tree, setting initial technologies etc. These definitions can be found in oldworldblues/common/scripted_triggers/country_triggers.txt. If you are sub-modding (not on the Old World Blues team) it’s unwise to modify this directly as it will make your mod incompatible with future updates. Instead, there are specific “script hooks” you should utilize with your nation if you want it to be a part of the one of the generic nation types in script. (if you are a sub-modder) somewhere in your countries’ history file, add the appropriate line (anywhere in it’s own scope, similarly to “set_stability” and such) and it will be treated as part of that category:


Settler: set_country_flag = is_settler_nation
Raider: set_country_flag = is_raider_nation
Tribal: set_country_flag = is_tribal_nation
Brotherhood: set_country_flag = is_brotherhood_nation
Ghoul: set_country_flag = is_ghoul_nation
Supermutant: set_country_flag = is_super_mutant


NOTE: If you add your nation to a generic category, and you want to define a custom focus tree for them, you must make your “country =” (found at the top of our focus trees) factor higher than 10, otherwise they will use the generic focus tree instead of your custom one!
==========================
=SPECIAL SCRIPT FEATURES =
==========================
------------------
-General Info-
------------------
Old World Blues introduces some new scripted effects and triggers that you should be aware of, these may also be quite useful or cause unexpected behaviour if you are unaware.
=========================
=DECIMATION --- IMPORTANT=
=========================
Since Old World Blues offers coring, and features quite low population as well as a generally longer timeline than vanilla, you should be aware of a script within which is used to help prevent too hard snowballing. Every time a state is transferred, it is “decimated”, half of the industry is destroyed or damaged. Keep in mind that “transferred” could mean captured in war, but it can also mean just by triggering effects which annex other nations or states while they are at war with each other. This means that if you, say, annex a selected nation via script in an event, half of it’s industry will all be destroyed. There are also the opposite effect, when a state is “transferred” back to it’s “owner”, it’s industry will return to what it would be pre-decimation.
 If you want to use decimation yourself as a tool, it can be found in common/scripted_effects/decimation_effects:


decimate_half_arms_industry: destroys/damages half of all military factories in a state
decimate_half_civillian_industry: destroys/damages half of all civilian factories in a state
decimate_half_naval_industry: destroys/damages half of all naval dockyards in a state
decimate_half_all_industry: does all of the 3 previous effects, destroying/damaging half of all industry


There are also the opposite effects:
undecimate_half_arms_industry
undecimate_half_civillian_industry
undecimate_half_naval_industry
undecimate_half_all_industry


For example, you want to destroy half of the factories in a certain state, to using the effect:
“decimate_half_all_industry = yes”
Will do so.
-----------------------------------------------------------------
-TO PREVENT DECIMATION/UNDECIMATION-
-----------------------------------------------------------------
you must add the state flag “do_not_decimate”, I.E
“375 = { set_state_flag = do_not_decimate }”
would prevent state #375 from being decimated/undecimated. 
To re enable decimation (you should do this) 
“375 = { clr_state_flag = do_not_decimate }” 
would restore decimation.
To do so for a whole nation (this is a very handy way of doing it), use this and replace TAG with the unique 3 letter TAG for the nation you want to prevent decimation on:


TAG = {
        every_owned_state = {
                set_state_flag = do_not_decimate
        }
}
Then to clear:


TAG = {
        every_owned_state = {
                clr_state_flag = do_not_decimate
        }
}
==============================
=COUNTRY  CATEGORY TRIGGERS=
==============================
The country category triggers (instructed on how to add in previous section) are as follows, they indicate which country type a nation is and can be used for generic events, etc. for that category.


Settler: is_settler_nation
Raider: is_raider_nation
Tribal: is_tribal_nation
Brotherhood: is_brotherhood_nation
Ghoul: is_ghoul_nation
Supermutant: is_super_mutant 


I.E to check if the current country, say for an event is settler:
“is_settler_nation = yes”
Would check through the database to see if it was on the list of settler nations.
======================
=WAR CREATION SYSTEM=
======================
The war creation system, similar to that used in my other Millennium Chaos/ChaosAI mods, allows the AI to gain claims, which they then justify on based upon events. Note that if you give a country a claim in Old World Blues, the AI will justify for that state. 
Certain nations are excluded from taking part in this system, and may not be justified upon or justify upon others. In order to add your nation to this list, either temporarily or permanently, you must add the country flag somewhere:


“set_country_flag = random_war_protected”
In order to remove this protection:
“clr_country_flag = random_war_protected”


This can be either in an effect for an event, or just as a line in their history file.


NOTE: any claims given before this flag was added will still allow them to be justified on, and normal wargoals against them still work, this just excludes the AI from then on gaining any more claims to justify.


To check if a country has this protection, the trigger is:
“is_protected_lore_faction = yes”
================
=AREA TRIGGERS=
================
Something that may be of use to you for selecting larger regions of states are some pre-existing triggers located in oldworldblues/common/scripted_triggers/national_focus_triggers.txt, just check, for example if a state 373 in is in Utah for example:
“373 = { is_utah_state = yes }”
================
=CLOSING NOTES=
================
Old World Blues modifies many aspects of the game. If you are unfamiliar or unsure it’s always good to check our files for things like ideologies (common/ideologies) technologies (common/technologies) etc. to ensure that you are using the correct names. Happy modding!.