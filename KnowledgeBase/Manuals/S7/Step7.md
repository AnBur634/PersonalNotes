

## Access static address of variable
### Option A
- Know in wich DB your variable is located
- Open that DB to find out the address of the Variable
- Use this syntax to access the variable `DB8.DBX   60.0`
### Option B
- In case there is access locally from where the FB lives
- Example
	- FB2 - FB_SpeedControl -> DB2
	- FB3 - FB_Sequence

## Add Var to VAT
- Type the correct syntax to add symbolic values
	- i.e. `"IB_FB5".debug.bStart`