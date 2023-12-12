#Requires AutoHotkey v2.0
#SingleInstance


; gives the program a name
appName := "Everest Presets"

; check if in right directory
if !(RegExMatch(A_WorkingDir, "\\Celeste\\Mods$"))
{
	MsgBox("Move me to \Celeste\Mods and try again!", appName)
	ExitApp
}

; Creates preset folder
presetFolder := "Presets"
if !FileExist(presetFolder)
{
	DirCreate presetFolder
	FileAppend "
	( LTrim
		# This is a preset file. Add names of mods below to add them to the preset.
		# If the line ends with .zip, it will be removed
		# '#' acts as a comment: lines starting with it are ignored, along with any text preceded by it
		# Lines starting with * are selected by default.
		# **ALL** as the first line will select the entire preset by default.

		# If '#' removed, would check all by default
		# **ALL**
		exampleMod1.zip # Unchecked by default and will be listed as exampleMod1
		# Will not be listed
		# exampleMod2
		# Will be checked by default
		* exampleMod3
	)", presetFolder "\examplePreset.txt"

	MsgBox("Celeste\Mods\" presetFolder " created! Add some presets and run me again.", appName)
	ExitApp
}



MyGui := Gui(, appName)
TV := MyGui.Add("TreeView", "Checked h300 w300")
TV.OnEvent("ItemCheck", onCheck)

MyBtn := MyGui.Add("Button",, "&Update Mod List")
MyBtn.OnEvent("Click", onBtnPress)

root := TV_Add("All Presets")

; Adds nodes
Loop, Files, %presetFolder%\*.txt
{
	newPreset := RegExReplace(A_LoopFileName, "\.txt")
	if (newPreset = "examplePreset")
	{
		continue
	}
	curPreset := TV_Add(newPreset, root)
	; tracks default checking
	allChecked := False
	Loop, Read, %presetFolder%\%A_LoopFileName%
	{
		; tracks default checking
		itemChecked := False
		; comment handling
		newItem := RegExReplace(A_LoopReadLine, "(\s*#.*)|(\.zip)")
		if (newItem = "")
		{
			continue
		}
		if (RegExMatch(newItem, "\*\*\s*ALL\s*\*\*"))
		{
			allChecked := True
			TV_Modify(curPreset, "Check")
			continue
		}
		if (RegExMatch(newItem, "^\*"))
		{
			itemChecked := True
			newItem := RegExReplace(newItem, "^\*\s*")
		}
		lineItem := TV_Add(newItem, curPreset, ((itemChecked | allChecked) ? "" : "-") "Check")
	}
}

P1 := TV.Add("First parent", root)
P1C1 := TV.Add("Parent 1's first child", P1)
P2 := TV.Add("Second parent", root)
P2C1 := TV.Add("Parent 2's first child", P2)
P2C2 := TV.Add("Parent 2's second child", P2)
P2C2C1 := TV.Add("Child 2's first child", P2C2)

; Show the window and its TreeView.
MyGui.Show
 
onCheck(GuiCtrl, itemID, checked) {
    itemID := GuiCtrl.Modify(itemID, "Select")
    updateChildren(itemID)
    updateParent(itemID)
} 

updateChildren(ID) {
    childID := TV.GetChild(ID)

    Loop {
        ; recursively loops through all children
        if (childID = 0) {
            break
        }

        ; sets all children to match state of parent
        TV.Modify(childID, (TV.Get(ID, "C") ? "" : "-") "Check")
        updateChildren(childID)
        childID := TV.GetNext(ChildID)
    }
}

updateParent(ID) {
    ; set check var
	allSibChecked := true

	; get parent and first sibling
	parentID := TV.GetParent(ID)
	siblingID := TV.GetChild(parentID)

	; loop all siblings
	Loop {
		if (siblingID = 0) {
			break
		}

		; if any siblings unchecked, break
		if (TV.Get(siblingID, "C") != siblingID) {
			allSibChecked := false
			break
		}
		siblingID := TV.GetNext(siblingID)
	}

	; set parent to checked if all children checked
	parentID := TV.Modify(parentID, (allSibChecked ? "" : "-") "Check")

	; call on parent, stops when no parent
	if (parentID != 0) {
		updateParent(parentID)
	}
}