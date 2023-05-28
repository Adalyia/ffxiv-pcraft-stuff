# Auto-Repair

### Requirements
* [SomethingNeedDoing](https://github.com/daemitus/SomethingNeedDoing)
* All crafters leveled (The ability to repair your own gear without the use of a mender)



## Instructions
1. Install the [SomethingNeedDoing](https://github.com/daemitus/SomethingNeedDoing) plugin and enable it on your Dalamud (`/xlsettings`, `/xlplugins`).
2. Open the GUI for SomethingNeedDoing by typing `/pcraft`.
3. Create macros within the plugin GUI, one for your base crafting rotation and one for each of the Lua script's you'll be using / items you wish to automate. In this example my base rotation of crafting actions is called `Craft_70D` and I've imported the scripts for `Baked Eggplant` and `Grade 8 Tincture of Mind`.

![Example for Step 3](https://raw.githubusercontent.com/Adalyia/ffxiv-pcraft-stuff/main/img/1.png)

4. Make sure when importing the lua scripts the `Lua Script` button has been ticked beforehand in each appropriate macro.

![Example for Step 4](https://raw.githubusercontent.com/Adalyia/ffxiv-pcraft-stuff/main/img/2.png)

5. Import the lua scripts by copy-pasting directly or copying then clicking the `Import from clipboard` button as seen below.

![Example for Step 5](https://raw.githubusercontent.com/Adalyia/ffxiv-pcraft-stuff/main/img/3.png)

6. Click the `Help` button in the top-middle portion of the plugin GUI to bring up the options menu

![Example for Step 6](https://raw.githubusercontent.com/Adalyia/ffxiv-pcraft-stuff/main/img/4.png)

7. Navigate to the `Options` tab and make sure under the `Crafting skips` category the `Smart Wait` box is ticked as shown.

![Example for Step 7](https://raw.githubusercontent.com/Adalyia/ffxiv-pcraft-stuff/main/img/5.png)

8. Switch to the job appropriate for the recipe you want to craft and ensure you've met the CP/Craftsmanship/Control requirements outlined in the rotation you copied. Opening the recipe book is not necessary as each script is specific to an item.

9. Click the `Run` button next to the script you wish to try out. This should cause the recipe to open, the HQ materials to be selected, and a craft to immediately begin. The script will automatically pause if needed for repairs and attempt to repair your own gear with the current dark matter.

![Example for Step 9](https://raw.githubusercontent.com/Adalyia/ffxiv-pcraft-stuff/main/img/6.png)

10. Done!