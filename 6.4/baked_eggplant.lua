local macro_name = "Craft_70D"
local recipe_name = "Baked Eggplant"

function recipe_setup()
    yield("/recipe \"" .. recipe_name .. "\"")
    yield("/waitaddon RecipeNote <maxwait.10>")

    -- RECIPE SPECIFIC PARAMS (This is where we pick how many of each material should be HQ vs NQ)
    yield("/click synthesis_material2_hq")
    yield("/click synthesis_material2_hq")
    yield("/click synthesis_material3_hq")
    -- END RECIPE SPECIFIC PARAMS
end

function repair_items()
    -- If a craft for some reason began, end it
    if IsCrafting() then
        yield("/click synthesis_quit")
        yield("/waitaddon RecipeNote <maxwait.10>")
    end
    -- Wait for the Recipe window to be visible again following a craft
    yield("/waitaddon RecipeNote <maxwait.10>")

    -- Exit the Recipe Note window
    yield("/send ESCAPE")
    yield("/wait 4")

    -- Open the Repair window
    yield("/ac Repair")

    -- Wait for the Repair Window to be visible
    yield("/waitaddon Repair <maxwait.10>")

    -- Click Repair All
    yield("/click repair_all")

    -- Wait for the confirmation dialogue to be visible
    yield("/waitaddon SelectYesno <maxwait.10>")

    -- Click Yes
    yield("/click select_yes")

    -- Wait for the action to complete
    yield("/wait 4")
    
    -- Close the Repair window
    yield("/send ESCAPE")

    -- 
    yield("/wait 2")
    recipe_setup()
end

-- Open the recipe book and apply the params for HQ items
recipe_setup()

-- Main loop
while true do
    -- Check if repairs are needed
    if NeedsRepair() then
        repair_items()
    end
    
    -- Wait for the Recipe Note Window
    yield("/waitaddon \"RecipeNote\" <maxwait.5>")

    -- Click the Synthesize button
    yield("/click \"synthesize\"")

    -- Wait for the Craft Window
    yield("/waitaddon \"Synthesis\" <maxwait.5>")

    -- Run the crafting actions macro defined at the top of the script
    yield("/runmacro \"" .. macro_name .. "\"")
end