{ResetOptions                ;
OverwriteBlocks        := 'y'; 
CreateDebugInfo        := 'y';
SetOKFlag              := 'n';
OptimizeObjectCode     := 'y';
GenerateReferenceData  := 'y';
S7ServerActive         := 'n';
CreateObjectCode       := 'y';
MonitorArrayLimits     := 'n';
SetMaximumStringLength := '20'}   
 
FUNCTION_BLOCK "LockSeqTest"
TITLE = ''
(*
Revision no.  : 1.0
Master path   : 
********************************************************************************
Author        : Burke
Description   : Test the Auto Lock / Unlock sequence
Input parameter: 
Output parameter: 
Calls       :     
Remarks     :  
Revision Description:
Revision no. / Revision made by / Revision date:
--------------------------------------------------------------------------------
V1.0 / Burke / 24.03.2026
1. Created for project
*)
 

VERSION: '1.0'
//KNOW_HOW_PROTECT

VAR_INPUT
    bRequestSetpoint       : BOOL; // TRUE if Speed and Torque setpoints should be set
    bRequestCw              : BOOL;
    bRequestCcw             : BOOL;
    bAutoLockUnlockActive   : BOOL; // TRUE as long as FB is active
    bAutoLockUnlockMsgAct   : BOOL; // TRUE as long as FB is active but at least for the duration of tAutoLockUnlockActMsg
    bAutoLockUnlockFailed   : BOOL;
    


    bStart                  : BOOL;
END_VAR
VAR_OUTPUT
    bOpenCmd                : BOOL;
    bCloseCmd               : BOOL;
    bPinCwHp                : BOOL; // feedback pin in HP
    bPinCwWp                : BOOL; // feedback pin in WP
    bPinCcwHp               : BOOL; // feedback pin in HP
    bPinCcwWp               : BOOL; // feedback pin in WP
    bLockTimedout           : BOOL;
    bUnlockTimedout         : BOOL;
    wTestResults            : WORD;

    bTestActive             : BOOL;
END_VAR
VAR_IN_OUT
    
END_VAR
VAR
    bFirstScan              : BOOL;
    iState                  : INT := 0;
    iNextTestCaseIndex      : INT;
    iTableOrientation       : INT := 0; // orientation in degree
    bLockUnlockTimeout      : TON;
    bNextStepDelay          : TON;
END_VAR
VAR_TEMP

END_VAR
CONST
    iSTATE_INIT             := 0;
    iSTATE_DONE             := 999;

    Bit0  := 16#0001;   // 0000 0000 0000 0001
    Bit1  := 16#0002;   // 0000 0000 0000 0010
    Bit2  := 16#0004;   // 0000 0000 0000 0100
    Bit3  := 16#0008;   // 0000 0000 0000 1000
    Bit4  := 16#0010;   // 0000 0000 0001 0000
    Bit5  := 16#0020;   // 0000 0000 0010 0000
    Bit6  := 16#0040;   // 0000 0000 0100 0000
    Bit7  := 16#0080;   // 0000 0000 1000 0000

    Bit8  := 16#0100;   // 0000 0001 0000 0000
    Bit9  := 16#0200;   // 0000 0010 0000 0000
    Bit10 := 16#0400;   // 0000 0100 0000 0000
    Bit11 := 16#0800;   // 0000 1000 0000 0000
    Bit12 := 16#1000;   // 0001 0000 0000 0000
    Bit13 := 16#2000;   // 0010 0000 0000 0000
    Bit14 := 16#4000;   // 0100 0000 0000 0000
    Bit15 := 16#8000;   // 1000 0000 0000 0000
END_CONST

IF NOT bFirstScan THEN
    bFirstScan := TRUE;
    iState := iSTATE_INIT;
    iNextTestCaseIndex := 0;
END_IF;
IF bStart THEN
    IF iState = iSTATE_INIT THEN
        iState := iSTATE_DONE;
    END_IF;
END_IF;

(*
Test cases:
1.
    RT is unlocked.
    LockCmd = TRUE
    locks immediatly.
2.
    RT is unlocked
    LockCmd = TRUE
    does not lock immediatly.
    4 seconds after requestCw or Ccw AND requestSetpoint the both pins will lock
3.
    RT is unlocked
    LockCmd = TRUE
    does not lock immediatly.
    5 seconds after requestCw or Ccw AND requestSetpoint the one pin will lock
    rotation should be flipped and second pin will lock after .5 seconds
4.
    RT is locked
    UnlockCmd = TRUE
    unlocks immediatly
5.
    RT is locked
    UnlockCmd = TRUE
    all pins are stuck.
    after cw AND setpoint one pin will unlock
    after ccw AND setpoint the other pin will unlock
6.
    RT is in undefined state
    UnlockCmd = TRUE
    unlocks immediatly
7.
    RT is in undefined state
    LockCmd = TRUE
    locks immediatly
8.
    RT is in undefined state
    unlockCmd = TRUE
    does not unlock until rotation starts
9.
    RT is in undefined state
    lockCmd = TRUE
    does not lock until rotation starts
10.
    RT locked
    unlock := TRUE
    does not reach HP
11.
    RT unlocked
    lock := TRUE
    does not reach WP
*)
IF iState = iSTATE_DONE THEN
    iNextTestCaseIndex := iNextTestCaseIndex + 10;
    iState := iNextTestCaseIndex;
END_IF;
// Test case 1
CASE iState OF
    10: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := TRUE;
        bPinCcwHp       := TRUE;
        bPinCwWp        := FALSE;
        bPinCcwWp       := FALSE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bLockUnlockTimeout(IN := FALSE, PT := T#1s);
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    11: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    12: // set lockCmd and wait for Seq active. leave HP after 1s
        bCloseCmd := TRUE;
        bLockUnlockTimeout(IN := TRUE, PT := T#10s);
        bNextStepDelay(IN := bAutoLockUnlockActive, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCwHp        := FALSE;
            bPinCcwHp       := FALSE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    13: // reach WP after 1s
        bNextStepDelay(IN := TRUE, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCwWp        := TRUE;
            bPinCcwWp       := TRUE;
            iState      := iState + 1;
        END_IF;
    14: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit0;
        END_IF;
END_CASE;
// Test case 2
CASE iState OF
    20: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := TRUE;
        bPinCcwHp       := TRUE;
        bPinCwWp        := FALSE;
        bPinCcwWp       := FALSE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        iState      := iState + 1;
    21: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    22: // set lockCmd and wait for Seq active. leave HP after 1s
        bCloseCmd := TRUE;
        bNextStepDelay(IN := bAutoLockUnlockActive, PT := T#1s);
        IF bAutoLockUnlockActive THEN
            bPinCwHp    := FALSE;
            bPinCcwHp   := FALSE;
            bNextStepDelay(IN := FALSE, PT := T#1s); // reset timer
            iState      := iState + 1;
        END_IF;
    23: // wait for bRequestSetpoint AND bRequestCw/bRequestCcw to be active for 4s
        bNextStepDelay(IN := bRequestSetpoint AND (bRequestCw OR bRequestCcw), PT := T#4s);
        IF bNextStepDelay.Q THEN
            bPinCwWp    := TRUE;
            bPinCcwWp   := TRUE;
            iState      := iState + 1;
        END_IF;
    24: // wait for outputs to be reset
        IF NOT bRequestSetpoint AND NOT bRequestCw AND NOT bRequestCcw AND NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit1;
        END_IF;
END_CASE;
// Test case 3
CASE iState OF
    30: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := TRUE;
        bPinCcwHp       := TRUE;
        bPinCwWp        := FALSE;
        bPinCcwWp       := FALSE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        iState          := iState + 1;
    31: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    32: // set lockCmd and wait for Seq active
        bCloseCmd := TRUE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        IF bAutoLockUnlockActive THEN
            bNextStepDelay(IN := TRUE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    33: // leave HP after 1s
        bNextStepDelay(IN := TRUE, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCwHp    := FALSE;
            bPinCcwHp   := FALSE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    34: // wait for bRequestSetpoint AND bRequestCw to be active for 5s. Cw Pin locks
        bNextStepDelay(IN := bRequestSetpoint AND bRequestCw, PT := T#5s);
        IF bNextStepDelay.Q THEN
            bNextStepDelay(IN := FALSE, PT := T#5s);
            bPinCwWp    := TRUE;
            iState      := iState + 1;
        END_IF;
    35: // wait for turn in Ccw direction for 500ms. Ccw Pin locks
        bNextStepDelay(IN := bRequestSetpoint AND bRequestCcw, PT := T#500ms);
        IF bNextStepDelay.Q THEN
            bPinCcwWp   := TRUE;
            iState      := iState + 1;
        END_IF;
    36: // wait for outputs to be reset
        IF NOT bRequestSetpoint AND NOT bRequestCw AND NOT bRequestCcw AND NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit2;
        END_IF;
END_CASE;
// Test case 4
CASE iState OF
    40: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := FALSE;
        bPinCcwHp       := FALSE;
        bPinCwWp        := TRUE;
        bPinCcwWp       := TRUE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    41: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    42: // set unlockCmd and wait for Seq active. leave HP after 1s
        bOpenCmd := TRUE;
        bNextStepDelay(IN := bAutoLockUnlockActive, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCwWp        := FALSE;
            bPinCcwWp       := FALSE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    43: // reach WP after 1s
        bNextStepDelay(IN := TRUE, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCwHp        := TRUE;
            bPinCcwHp       := TRUE;
            iState      := iState + 1;
        END_IF;
    44: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit3;
        END_IF;
END_CASE;
// Test case 5
CASE iState OF
    50: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := FALSE;
        bPinCcwHp       := FALSE;
        bPinCwWp        := TRUE;
        bPinCcwWp       := TRUE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    51: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    52: // set unlockCmd and wait for cw rotation
        bOpenCmd := TRUE;
        // bNextStepDelay(IN := bAutoLockUnlockActive, PT := T#1s);
        IF bRequestCw AND bRequestSetpoint THEN
            bPinCcwWp   := FALSE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    53: // turning CW now. Ccw pin moves
        bNextStepDelay(IN := TRUE, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCcwHp   := TRUE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    54: // wait for Ccw rotation
        bOpenCmd := TRUE;
        IF bRequestCcw AND bRequestSetpoint THEN
            bPinCwWp    := FALSE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    55: // wait for ccw rotation. cw pin locks
        bNextStepDelay(IN := TRUE, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCwHp    := TRUE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    56: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit4;
        END_IF;
END_CASE;
// Test case 6
CASE iState OF
    60: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := FALSE;
        bPinCcwHp       := FALSE;
        bPinCwWp        := FALSE;
        bPinCcwWp       := FALSE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    61: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    62: // set unlockCmd. cylinders unlock after 1s
        bOpenCmd := TRUE;
        bNextStepDelay(IN := bAutoLockUnlockActive, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCcwHp   := TRUE;
            bPinCwHp    := TRUE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    63: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit5;
        END_IF;
END_CASE;
// Test case 7
CASE iState OF
    70: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := FALSE;
        bPinCcwHp       := FALSE;
        bPinCwWp        := FALSE;
        bPinCcwWp       := FALSE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    71: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    72: // set lockCmd. cylinders lock after 1s
        bCloseCmd := TRUE;
        bNextStepDelay(IN := bAutoLockUnlockActive, PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCcwWp   := TRUE;
            bPinCwWp    := TRUE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    73: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit6;
        END_IF;
END_CASE;
// Test case 8
CASE iState OF
    80: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := FALSE;
        bPinCcwHp       := FALSE;
        bPinCwWp        := FALSE;
        bPinCcwWp       := FALSE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    81: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    82: // set unlockCmd. cylinders unlock 1s after rotation started
        bOpenCmd := TRUE;
        bNextStepDelay(IN := bRequestSetpoint AND (bRequestCcw OR bRequestCw), PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCcwHp   := TRUE;
            bPinCwHp    := TRUE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    83: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit7;
        END_IF;
END_CASE;
// Test case 9
CASE iState OF
    90: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := FALSE;
        bPinCcwHp       := FALSE;
        bPinCwWp        := FALSE;
        bPinCcwWp       := FALSE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    91: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    92: // set lockCmd. cylinders unlock 1s after rotation started
        bCloseCmd := TRUE;
        bNextStepDelay(IN := bRequestSetpoint AND (bRequestCcw OR bRequestCw), PT := T#1s);
        IF bNextStepDelay.Q THEN
            bPinCcwWp   := TRUE;
            bPinCwWp    := TRUE;
            bNextStepDelay(IN := FALSE, PT := T#1s);
            iState      := iState + 1;
        END_IF;
    93: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit8;
        END_IF;
END_CASE;
// Test case 10
CASE iState OF
    100: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := FALSE;
        bPinCcwHp       := FALSE;
        bPinCwWp        := TRUE;
        bPinCcwWp       := TRUE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    101: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    102: // set unlockCmd. wait for sequence to fail after timeout
        bOpenCmd := TRUE;
        bNextStepDelay(IN := TRUE, PT := T#15s);
        bUnlockTimedout := bNextStepDelay.Q;
        IF NOT bAutoLockUnlockActive AND bAutoLockUnlockFailed AND bUnlockTimedout THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit9;
        END_IF;
END_CASE;
// Test case 11
CASE iState OF
    110: // prepare values
        bOpenCmd        := FALSE;
        bCloseCmd       := FALSE;
        bPinCwHp        := FALSE;
        bPinCcwHp       := FALSE;
        bPinCwWp        := TRUE;
        bPinCcwWp       := TRUE;
        bLockTimedout   := FALSE;
        bUnlockTimedout := FALSE;
        bNextStepDelay(IN := FALSE, PT := T#1s);
        iState      := iState + 1;
    111: // wait for NOT SeqActive
        IF NOT bAutoLockUnlockActive THEN
            iState := iState + 1;
        END_IF;
    112: // set unlockCmd. wait for sequence to fail after timeout
        bCloseCmd := TRUE;
        bNextStepDelay(IN := TRUE, PT := T#15s);
        bLockTimedout := bNextStepDelay.Q;
        IF NOT bAutoLockUnlockActive AND bAutoLockUnlockFailed AND bLockTimedout THEN
            iState := iSTATE_DONE;
            wTestResults := wTestResults AND Bit10;
        END_IF;
END_CASE;

IF iState >= 120 THEN
    bTestActive := FALSE;
END_IF;
END_FUNCTION_BLOCK





















































