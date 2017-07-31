NDefines.NGame.START_DATE = "2265.1.1.12"
NDefines.NGame.END_DATE = "2400.1.1.1"
NDefines.NAI.GENERATE_WARGOAL_THREAT_BASELINE = 0.6
NDefines.NAI.DIPLOMACY_SEND_MAX_FACTION = 0.5
NDefines.NAI.FALLBACK_LOSING_FACTOR = 0.0 					                    -- The lower this number  the longer the AI will hold the line before sending them to the fallback line
NDefines.NAI.PLAN_FACTION_STRONG_TO_EXECUTE = 0.65 --0.80	0.60		        -- % or more of units in an order to consider ececuting the plan
NDefines.NAI.ORG_UNIT_STRONG = 2 --0.5	 --0.75		0.9				            -- Organization % for unit to be considered strong
NDefines.NAI.STR_UNIT_STRONG = 0.65 --0.9 --0.7		0.75					    -- Strength (equipment) % for unit to be considered strong

NDefines.NAI.PLAN_FACTION_WEAK_TO_ABORT = 0.5 --0.50		0.65		        -- % or more of units in an order to consider executing the plan
NDefines.NAI.ORG_UNIT_WEAK = 0.45 --0.25 --0.3			0.15					-- Organization % for unit to be considered weak
NDefines.NAI.STR_UNIT_WEAK = 0.4 --0.6 --0.5			0.1					    -- Strength (equipment) % for unit to be considered weak

--NDefines.NAI.PLAN_AVG_PREPARATION_TO_EXECUTE = 0.0				            -- % or more average plan preparation before executing
NDefines.NAI.AI_FRONT_MOVEMENT_FACTOR_FOR_READY = 0.5			                -- If less than this fraction of units on a front is moving  AI sees it as ready for action	
--NDefines.NAI.PLAN_VALUE_TO_EXECUTE = -1.1                                     -- AI will typically avoid carrying out a plan it below this value (0.0 is considered balanced).

--NDefines.NAI.LOCATION_BALANCE_TO_ADVANCE = 0.0				                -- Limit on location strength balance between country and enemy for unit to dare to move forward.
NDefines.NAI.PLAN_ACTIVATION_MAJOR_WEIGHT_FACTOR = 0.0 		                    -- AI countries will hold on activating plans if stronger countries have plans in the same location. Majors count extra (value of 1 will negate this)
NDefines.NAI.PLAN_ACTIVATION_PLAYER_WEIGHT_FACTOR = 0.0 		                -- AI countries will hold on activating plans if player controlled countries have plans in the same location. Majors count extra (value of 1 will negate this)
--NDefines.NAI.FRONT_TERRAIN_DEFENSE_FACTOR = 5.0 				                -- Multiplier applied to unit defense modifier for terrain on front province multiplied by terrain importance
--NDefines.NAI.FRONT_TERRAIN_ATTACK_FACTOR = 5.0 				                -- Multiplier applied to unit attack modifier for terrain on enemy front province multiplied by terrain importance
NDefines.NAI.PLAN_MIN_SIZE_FOR_FALLBACK = 5000					                -- A country with less provinces than this will not draw fallback plans  but rather station their troops along the front

NDefines.NAI.MIN_FIELD_STRENGTH_TO_BUILD_UNITS = 0.8			                -- Cancel unit production if below this to get resources out to units in the field
NDefines.NAI.MIN_MANPOWER_TO_BUILD_UNITS = 0.0					                -- Cancel unit production if below this to get resources out to units in the field

NDefines.NAI.PRODUCTION_EQUIPMENT_SURPLUS_FACTOR = 1.5

NDefines.NAI.TRADEABLE_FACTORIES_FRACTION = 1
--NDefines.NAI.PRODUCTION_UNAVAILABLE_RESORCE_FACTORY_FACTOR = 0.5
--NDefines.NAI.MIN_DELIVERED_TRADE_FRACTION = 0.6

--NDefines.NAI.PRODUCTION_MAX_PROGRESS_TTO_SWITCH_NAVAL = 1
--NDefines.NAI.SHIPS_PRODUCTION_BASE_COST = 100000

NDefines.NAI.DEPLOY_MIN_TRAINING_PEACE_FACTOR = 0.9		                        -- Required percentage of training (1.0 = 100%) for AI to deploy unit in peacetime
NDefines.NAI.DEPLOY_MIN_TRAINING_WAR_FACTOR = 0.25		                        -- Required percentage of training (1.0 = 100%) for AI to deploy unit in wartime
--NDefines.NAI.DEPLOY_MIN_EQUIPMENT_PEACE_FACTOR = 1	                        -- Required percentage of equipment (1.0 = 100%) for AI to deploy unit in peacetime
--NDefines.NAI.DEPLOY_MIN_EQUIPMENT_WAR_FACTOR = 1		                        -- Required percentage of equipment (1.0 = 100%) for AI to deploy unit in wartime

NDefines.NAI.START_TRAINING_EQUIPMENT_LEVEL = 0.9                               -- ai will not start to train if equipment drops below this level
NDefines.NAI.STOP_TRAINING_EQUIPMENT_LEVEL = 0.8                                -- ai will not train if equipment drops below this level

NDefines.NAI.NEW_LEADER_EXTRA_PP_FACTOR = 5.0

NDefines.NAI.DIPLOMACY_IMPROVE_RELATION_COST_FACTOR = 7.0                       -- Desire to boost relations subtracts the cost multiplied by this

----------------------

--NDefines.NAI.DIPLOMACY_SEND_EXPEDITIONARY_INDUSTRY_FACTOR = 100               -- Weight when counting industry (will be added to military strength)
--NDefines.NAI.DIPLOMACY_SEND_EXPEDITIONARY_BASE = 200 --7                      -- Multiplied with relative strength factor to get result (if other is twice as "strong" the result with 25 would be 50)
NDefines.NAI.GENERATE_WARGOAL_THREAT_BASELINE = 0.0 -- 0.6
NDefines.NAI.DIPLOMACY_SEND_MAX_FACTION = 0.5
