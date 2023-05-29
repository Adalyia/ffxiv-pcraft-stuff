local macro_name = "Craft_70D"
local recipe_name = "Baked Eggplant"

function recipe_setup()
    yield("/recipe \"" .. recipe_name .. "\"")
    yield("/waitaddon RecipeNote")

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
        yield("/waitaddon RecipeNote")
    end
    -- Wait for the Recipe window to be visible again following a craft
    yield("/waitaddon RecipeNote")

    -- Exit the Recipe Note window
    while IsAddonVisible("RecipeNote") do
        yield("/send ESCAPE")
        yield("/wait 2")
    end

    -- Exit the System Menu if it was opened
    while IsAddonVisible("SystemMenu") do
        yield("/send ESCAPE")
        yield("/wait 2")
    end

    -- Open the Repair window
    yield("/ac Repair")

    -- Wait for the Repair Window to be visible
    yield("/waitaddon Repair")

    -- Click Repair All
    yield("/click repair_all")

    -- Wait for the confirmation dialogue to be visible
    yield("/waitaddon SelectYesno")

    -- Click Yes
    yield("/click select_yes")

    -- Wait for the action to complete
    yield("/wait 4")
    
    -- Exit the Repair window
    while IsAddonVisible("Repair") do
        yield("/send ESCAPE")
        yield("/wait 2")
    end

    -- Exit the System Menu if it was opened
    while IsAddonVisible("SystemMenu") do
        yield("/send ESCAPE")
        yield("/wait 2")
    end
end

function extract_materia()
    -- If a craft for some reason began, end it
    if IsCrafting() then
        yield("/click synthesis_quit")
        yield("/waitaddon RecipeNote")
    end
    -- Wait for the Recipe window to be visible again following a craft
    yield("/waitaddon RecipeNote")

    -- Exit the Recipe Note window
    while IsAddonVisible("RecipeNote") do
        yield("/send ESCAPE")
        yield("/wait 2")
    end

    -- Exit the System Menu if it was opened
    while IsAddonVisible("SystemMenu") do
        yield("/send ESCAPE")
        yield("/wait 2")
    end

    -- Open the Materia Extraction window
    yield("/ac \"Materia Extraction\"")

    while CanExtractMateria() do
        -- Wait for the Materia Extraction Window to be visible
        yield("/waitaddon Materialize")

        -- Select item 1
        yield("/send NUMPAD0")
        yield("/send NUMPAD0")

        -- Wait for the confirmation dialogue to be visible
        yield("/waitaddon MaterializeDialog")

        -- Click Yes
        yield("/click materialize")

        -- Wait for the action to complete
        yield("/wait 4")
    end 
    
    -- Exit the Repair window
    while IsAddonVisible("Materialize") do
        yield("/send ESCAPE")
        yield("/wait 2")
    end

    -- Exit the System Menu if it was opened
    while IsAddonVisible("SystemMenu") do
        yield("/send ESCAPE")
        yield("/wait 2")
    end
end

-- Open the recipe book and apply the params for HQ items
--recipe_setup()

-- Main loop
while true do
    -- Check if repairs are needed
    if NeedsRepair() then
        repair_items()
    end

    if CanExtractMateria() then
        extract_materia()
    end
    
    if not IsAddonVisible("RecipeNote") then
        recipe_setup()
    end

    -- Wait for the Recipe Note Window
    yield("/waitaddon \"RecipeNote\" <maxwait.5>")

    -- Click the Synthesize button
    yield("/click \"synthesize\"")

    -- Wait for the Craft Window
    yield("/waitaddon \"Synthesis\"")
    
    -- Run the crafting actions macro defined at the top of the script
    yield("/runmacro \"" .. macro_name .. "\"")
end