Owner	Chief Engineer – Control Systems 

Process	Common for Operating Processes 

Applies to	Equipment & System Solutions 

Purpose and Scope 

Purpose 

The main goal of this guideline is to detail the activities from the QA21 procedure 

Scope 

All software changes regulated by QA21. 

Input and Output 

Ref. QA21 

 

Table of Contents 

 

 

Roles and Responsibility 

Refer to QA21 Software Changes for definitions of roles and responsibility. 

Description of Activities 

Flowchart 

 

Activities 

Address Software Change 

Review status on rig 

Ensure latest backup is available 

Ensure SWBaseOnline from rig is available in Octoplant. 

Verify the latest backup in the Rig Folder within Octoplant. If the Change Board confirms the version as valid, no further action is required. 

If the version is not accepted, the Services Engineer (SVE) shall request the software backup either from the Field Service Engineer (FSE), if available, or from the Rapid Response Team. 

Once the SWBaseOnline file is received, the SVE shall store the software in Octoplant in accordance with QAW21-13 – octoplant Software Release Instruction. 

Check for open CCNs or version mismatches 

Check for open CCNs or version mismatches between SWBaseOnline and last SWBaseRelease, if found, create an implementation plan. 

This step aims to verify whether there are any software releases that have not yet been installed on the rig. If so, a plan for implementing the new software must be prepared and discussed between the SAM and the customer to determine how they wish to proceed. The outcome of this discussion should then be presented at the Change Board meeting for further feasibility evaluation. 

Typical alternatives to be discussed with Change Board: 

When a new software project needs to be initiated while other are still in progress. 

Install the completed change on the rig prior to initiating the next one. 

Complete the ongoing software change before starting a new project. 

Stop the current project, void the existing software, and start the new project from the latest base software version when the change is required urgently (e.g., due to downtime or safety issues). 

NOTE  

Note: that changing the planned software release order may incur additional costs due to reprogramming and software handling. 

When a new software project must be initiated while other projects are in the pipeline but not yet started 

Decide whether the new job should be executed before the projects are already in the pipeline. 

Decide which software version will be used for the new project. 

NOTE  

Changing the planned software release order may incur additional costs due to reprogramming and software handling. 

When a new software project must be initiated and there are no projects in the pipeline or currently in progress 

Decide which software version will be used as the base for the new project. 

When there is an open Hotfix that has already been installed on the rig (SWBaseOnline) but was not included in the released version 

Integrate the Hotfix into the same software version being released for the new project, including the necessary changes. 

If more than one software version is marked as ready for installation or currently in progress, this scenario must be escalated to the Change Board for assessment. The board should determine which versions must be unchecked as “ready for installation” because they do not contain the hotfix. Additionally, the rig’s operational context should be reviewed to decide which version must be deployed to ensure the hotfix is included. It is important to reinforce that these cases should be treated as exceptions and require careful analysis by the Change Board, including a risk assessment and lab testing.  

NOTE  

For software installation sequences: 

■	Be mindful of critical contractual requirements or high priority customer cases. Some CCNs may need to be installed before others, which could lead to additional costs for the customer and require schedule adjustments. 

■	If the estimated time for installing pending upgrades requires an extended operational window, the customer may request that a new project must be installed first. This may result in extra costs and re planning efforts. 

■	When an upgrade also includes hardware installation and the customer lacks the required operational window, subsequent upgrades may be delayed. Changing the installation sequence can involve additional costs and re planning. 

Establish CCN if not already existing 

The purpose of the CCN is to register and share software changes throughout the product lifecycle and rig operations. Each software implementation to be carried out on a rig must have an open CCN associated with it. 

In general, establish one CCN per delivery, including all affected applications, where delivery is defined as a set of changes, functionalities, or scope elements that are interrelated and must be installed together due to their dependencies. 

For a service project, in practical terms, means that for each upgrade one CCN should be created considering the complete scope 

NOTE  

Exceptions can be made when the installation is planned in segmented phases-One CCN shall be created per delivery in accordance with QA21 and work instruction QAW21 8—or when the delivery includes multiple combined upgrades, such as a main project with several sub projects or multiple purchased bulletins. 

NOTE  

It is important to include the upgrade and bulletin descriptions in the CCN title for tracking purposes, in alignment with QAW21-8 Software Change tracking 

Verify CCN according to work instruction 

The purpose of QAW21-8 work instruction is to clearly define how to fill out and use the CCN formular to document software changes. QAW21-8 shall be used for all steps required for the CCNs. 

Establish Work Package Folder according to QAW21-12 

The work Package folder shall be created following the QAW21-12. 

Ensure compliance with customer-specific delivery requirements  

During CCN creation, it is important to verify whether the customer has any specific requirements—such as special testing, documentation, additional inspection items, or particular delivery standards. All such information must be recorded in the CCN for future reference. 

Add reference to Work Package Folder in CCN according to QAW21-8 

Initiate Software Change  

Establish change board 

For projects 

The Change board is typically established by the engineering team and SVE, once the project is informed. The objective is to define the scope, applications involved, change side effects, deliverables, software implementation plan and delivery dates. 

For Bug Fixes 

Change board is typically established by SVE or Engineering team. The objective is to define the scope, deliverables, software implementation plan and delivery dates. 

Invite to a change board meeting 

The invitation to the Change Board meeting is typically sent by the Engineering team, with the Configuration Management Engineer or Team Lead acting as the representative. It is essential that all key stakeholders are present at the meeting, including  Technical Responsible for each product, SVE and SAM/KAM. Project Manager and the Application Engineer responsible for the quote should be invited as optional attendants.  

Please note that the process for identifying responsible attendees may vary across different hubs. For example, in the Erkelenz products team, the manager should be contacted first, and they will direct the request to the appropriate personnel. 

The SVE contact list is available in Software Change Deployment page 

Contacts for SAM/KAM can be found in the quote documentation. 

Be sure to include all products potentially affected by the change, even if they are not listed in the initial quote; examples include Riglogger, CADS, beAware, e-tally, and WITS. 

Additionally, pay close attention to situations where third-party involvement is required. Ensure that all stakeholders are informed about their responsibilities and that any information discussed during the tender process is communicated as necessary. 

 

Evaluate Software Change 

This chapter explains the steps to check and confirm the scope of work before making any software changes. It includes what needs to be done before the kick-off meeting, how to check for possible impacts, and how to use past experience to avoid mistakes. The goal is to make sure everyone understands what needs to be done and that the change follows the correct process. 

Before the kick-off meeting, it is important to make sure the scope of work is clear and easy to understand. The scope shared during the sales phase—either in a document or spreadsheet—should help identify who needs to be involved in the kick-off. 

The Configuration Manager should organize a meeting with the SVE, SAM/AM, and Technical teams to go through the key points. The goal is to make sure everyone understands what changes are planned and what needs to be done. 

All involved teams should agree on: 

What will be delivered. 

How the solution will be tested. 

What resources will be needed. 

No software change should start before the Change Board reviews and approves it. The review should answer: 

Is the change acceptable? 

Is it part of the agreed scope? 

What systems or equipment will be affected? 

Do we need to involve third parties? 

Will other equipment need changes too? 

Sometimes, the Change Board may reject a proposed solution. This can happen if: 

The solution does not work on the platform. 

It goes against equipment standards. 

The rig is in software freeze. 

The equipment cannot support the function. 

If the change is already part of another CCN:  

This review must happen before the kick-off. For large projects, the meeting can be scheduled early in the process, but no software changes are allowed without an approved CCN. 

Verify scope of work in CCN, and update if required. 

During this step, the team should: 

Check for open CCNs for the rig. 

Look at similar CCNs from other rigs to keep consistency. 

Review past deliveries to see if bug fixes or NCRs were needed, and avoid repeating mistakes 

Read the CCN carefully. If something is missing or incorrect, update the scope so it matches what is really needed. 

Confirm that scope of the CCN fits within the agreed scope, cost and delivery time. 

The Project Manager will be responsible to address deviations, miscommunication, occasional changes on assumption and requisites. 

Identify side effects to other products/systems not listed up to this point. 

Check if the change might affect other systems or products not listed yet. If it does, go back to step 2.2.1 and review the change again. 

For changes affecting third party control logic, the third party (e.g. VFD) shall be consulted and the impact of the change discussed before the change is allowed to be implemented. 

If the change affects third-party control systems (like VFDs), talk to the supplier. Make sure they understand the change and agree before moving forward. 

Ensure that all required interface-related changes—such as those involving smart modules, dataloggers, RMC, SZMS, DEAL and any other relevant products or systems—are identified and incorporated into the scope of the change 

If it is not clear, ask! Refer to interface Matrix Hardware and Software  

Evaluate requests for multiple simultaneous software releases  

Base case for all software releases is: After completion of each CCN/QA21 a new SWNewOnline will be output. This will become the SWBaseOnline for the next CCN/QA21 in line. Only 1 software release is permitted at a time. Requests for multiple releases usually comes from a need to do I&C in multiple phases. This can be accommodated with Multi I&C Software: 

Run a risk assessment to evaluate the request 

Evaluate any side effects to other software, involving all necessary personnel 

Decide on clear I&C steps 

Create software containing both old and new behavior, where the functionality can be easily enabled without programming by Field Service Engineer. 

PLC: Typically, assign bits to control old vs new functionality (SetupDB) 

HMI + Operator Chair: Control visibility of old vs new functionality based on configuration in PLC or equivalent (if not possible, control availability as a minimum) 

Write in Work Package: 

Clear instructions for configuring each I&C phase  

Test procedures shall clearly indicate which tests to be performed in each I&C phase.  

Evaluate and recommend or reject the change request 

After look at the change from both technical and operational sides. The change board shall decide if it should be approved or rejected 

In case it is rejected, the stakeholders should be communicated and customer should be informed. The change board can propose alternatives if available.  

Evaluate change impact on Product certificate or declaration of conformity  

Evaluate change impact on Product certificate (ABS/DNV) or declaration of conformity (CE marking). If there is impact, estimate the extra work needed to stay compliant. 

Consider past CCNs for the same functionality in other rigs to implement the same solution in this change. 

Look at past CCNs for similar issues. Use proven solutions when possible to save time and keep things consistent across rigs. 

Consider past NCRs for the same functionality in other similar rigs and apply preventive recurrence action 

Review past NCRs for similar functions. If problems happened before, take steps to prevent them from happening again. 

Determine whether the reported issue qualifies as a Bugfix. If the software change is classified as a Bugfix, it should follow the established Bugfix workflow. 

Verify according to definition of Bugfix in QA21 

 

Update Software and Documentation 

Execute Software Change  

Execute software update according to QA24, releasing only 1 version of the software 

Configuration Management shall be involved in Internal Acceptance Tests. 

Ensure compliance with customer-specific delivery requirements  

CCN: Set the application to “implemented” with correct version. Ref. QAW21-8. 

NOTE  

Untested items are likely to require programming, which will normally require Technical Responsible to install software! 

Update required user documentation according to QA13. I.e.: SA06 and SA21 

Create/Update TF05 - Work Package for Modification if required. 

In TF05, clarify the QA21 role to install the software – implementing personnel or Technical Responsible 

In case Technical Responsible is required to install software, this person shall be identified with SAP ID and name. 

Create/Update Test Procedures for internal and external tests. 

Verify and update the CCN according to QAW21-8, chapter 2.4, QA21: Execute Software Implementation (QA24) 

Test Integrated System 

Create Integration Test Procedure 

Include all relevant product functions. 

Use CCN Test Procedure format for documentation. 

Execute Testing: 

Perform tests in simulator/lab environment. 

Use automated or continuous testing where applicable. 

Document results and obtain signatures from implementing personnel and customer. 

Internal Acceptance Testing (IAT): 

Invite Configuration Management Engineer to participate. 

Post-Test Actions: 

Upon successful test completion, copy final software files to the DLS folder in Octoplant. 

Bug Fixes: 

Apply workflow for bug fixes according to QA24, if previously approved by change board (QA21). 

NOTE  

Shortcuts such as skipping password checks or peer review are not permitted unless explicitly authorized under QA24 and approved by the  Technical Responsible. 

Approve for Installation 

Verify CCN contents according to QAW21-8. 

For every software implementation on a rig, an open CCN must be in place. 

To confirm that the installation is ready for implementation, all requirements outlined in QAW21-8 must be fulfilled. The following actions are mandatory: 

Documentation Compliance 

Ensure all related documentation is updated and released in Windchill. 

Verify that internal CCN documents are complete and accessible. 

Software Release 

Confirm that the software is properly released and stored in Octoplant. 

Internal Notes 

Use the Field Internal Notes section for any additional communication or clarifications. 

This field supports future reviews by providing context for anyone checking the CCN later. 

Typical entries include: 

Installation-related details 

Comments on scheduling or constraints 

Notes from the Configuration Manager or  Technical Responsible 

 

Calculate risk level of installing the new software  

If software testing was incomplete, high-risk reprogramming is expected! 

Guiding principle is that the customer shall be able to understand and control their own risk level. Help our customer by ensuring full transparency about risk. 

Use the risk matrix to determine the risk and readiness for installation. Document customer acceptance of the change and associated risk when required by contract or applicable QA21 steps 

Risk level and evaluation shall be documented in CCN. 

Step 1: Estimate complexity level 

Complexity Level 

Typical Decision Criteria 

Low 

Changes made to a single control node that involve minor software updates. 

If the change fails, the system can be fixed by using SWRecovery with less than 30 minutes of downtime. 

Online operational parameters are saved and restored easily 

No hardware changes involved. 

Medium 

Changes involving one or more of the following:  

multiple control nodes. 

Hardware changes. 

Configuration of switches or firewall rules (special skills needed). 

Third parties (e.g., Siemens, ABB, Shell). 

Updates to system code libraries. 

If the change fails, recovery is possible using SWRecovery, but operational testing is required. 

Major system changes with fast roll-back functionality (e.g., DCMS upgrades, new SmartModules projects). 

High 

Changes involving one or more of the following:  

Major system changes without fast roll-back functionality (e.g., DCMS upgrades, new SmartModules projects). 

Software platform upgrades (e.g., Step7 300 / WinAC → TIA Portal CPU1500). 

Major equipment replacements or upgrades (e.g., Enhanced Brake Test). 

New equipment installations (e.g., RNX replacing TM, DDM overhaul). 

Rollback not possible. 

Pilot projects with no operational history. 

 

 

Step 2: Estimate test coverage 

Test Coverage 

Typical Decision Criteria 

Low 

0% - 60% of the required tests have been executed 

Missing internal testing evidences, such as: 

Test report 

Integration Test report 

Documented peer review 

Medium 

60% - 90% of the required tests have been executed 

Test document includes all equipment functions available 

Test document quality acceptable 

High 

Test coverage: >90%. 

Test document includes all equipment functions available  

High quality test document 

 

Step 3: Calculate I&C Risk Level 

 

 

 

Complexity 

Lab Test Coverage 

 

Low 

Medium 

High 

Low 

I&C Risk – Medium 

I&C Risk – High 

I&C Risk – High 

Medium 

I&C Risk – Low 

I&C Risk – Medium 

I&C Risk – High 

High 

I&C Risk – Low 

I&C Risk – Low 

I&C Risk – Medium 

 

 

Step 4: Prepare customer communication 

These are only suggestions and should be modified according to project together with Technical Responsible. 

I&C Risk Level 

Customer dialogue recommendations 

Low 

This is a simple change with low risk level  

Change can be easily rolled back if required 

 

Medium 

Risk level is medium 

If the change fails, recovery is possible using SWRecovery, but operational testing may be required (check in each case). 

I&C demands well planned operational pause for intervention. 

There is a risk of unplanned downtime 

High 

Risk level is HIGH and requires thorough planning 

Rollback may not be possible 

Requires extended shutdowns and full access to equipment until completion. 

Comprehensive operational and integration testing required with engineering support throughout the I&C process. 

There is a risk of unplanned downtime 

Prepare Installation 

A software implementation on a rig can only proceed if there is a corresponding open CCN linked to that implementation. 

Prepare and send to customer for approval, if required by customer 

Ref. chapter 1.6 Customer 

 CCN including description of change(s) completely filled 

Test procedure(s) or any other testing document that customer can have access 

 Create Work Package Folder and share with implementing personnel: 

SWNewRelease, ref. QAW21-13 

SWBaseOnline, ref. QAW21-13 

All related documents, such as: 

CCN in PDF format 

External Test procedure in PDF format and any other required test document (TF05, CCV, KA39, KA10) 

Test record from internal testing 

Manuals and drawings that have been created or updated during the upgrade 

Applicable Software Download Guides 

Additional Guidelines   

Invite Technical Responsible to the mobilization meeting according to QA108 

The objective of this meeting is to ensure all technical and operational requirements are aligned prior to offshore mobilization. 

Conduct the Mobilization Meeting 

During the meeting, the SVE must ensure that the FSE (Field Service Engineer) has received all necessary documentation and information to execute the job successfully. 

If the person responsible for supporting any of the listed equipment is unavailable during the mobilization meeting, they must appoint and invite a qualified colleague to attend on their behalf. 

Recommended Discussion Topics 

The following topics shall be reviewed and clarified during the mobilization meeting: 

Rig operational context 

Details of the upgrades to be implemented 

Planned scope of work, including any known troubleshooting 

Designated contact persons for each case during the offshore mission, along with an availability plan to ensure timely technical support during execution 

Passwords required for: 

RDPC 

PLC 

DrillView 

Any other software to be installed 

PAM systems (e.g., SQL, switches, etc.) 

Software handling and installation instructions 

Inputs, suggestions, lessons learned, risk highlights, background information, and attention points related to the planned scope 

If the person responsible for supporting any of the listed equipment is unavailable during the service mission, they must indicate how support will be provided and who will be the designated backup.  

Immediately before installation, evaluate other activities towards the rig since the CCN was established and resolve all issues before initiating installation.  

Previous open CCNs 

Software fixes 

Mechanic/hydraulic issues related to the upgrades. 

 

Install and Test Software  

Create Recovery Backup 

Create SWRecovery (pre‑installation backup) as required by QA24 or the applicable Software Download Guide. 

The link to the technical guidelines can be found in the attachments provided with QA21.  

Install software 

Follow the Software Download Guide and install SWNewRelease (or an approved Hotfix) in accordance with QA21 and QA24. 

The link to the technical guidelines can be found in the attachments provided with QA21.  

Test software  

Test fully according to test procedure. 

If a test fails or any undesired behavior is detected, contact change board for evaluation. 

If the issue is qualified as a software fix, initiate the software fix . 

In case of customer disapproval, test failure or impossibility to test completely. 

Contact Services Engineer (SVE) and Technical Responsible for evaluation. 

If no agreement can be reached on the way forward, reinstall SWRecovery (rollback) 

After rollback, verify system functionality together with the customer by performing functional tests. 

Register customer approval in function tests through Technical Report (ref. QA108). 

Add relevant comments in the CCN, internal comments 

If all test steps cannot be carried on the rig (i.e.: casing/BHA not available) 

Align with Technical Responsible, preferably during Pre-Job briefing (ref. QA108) if this test is mandatory to leave the software running online.  

If not, keep the CCN open, with information in the internal comments field, until HMH has another opportunity onboard to complete the test. 

Collect customer signatures 

Collect customer signature on test record(s) and on Technical Report(s) (ref. QA108) with all related CCN(s) attached. 

Technical Report shall include all procedures and its version (including software download guides) followed during software installation. and  

Technical Report shall include evidence of: 

Functionality left running in the rig, through pictures, graphs, description. In some cases, test procedure signed is enough, but make sure that all relevant information that can prove the functionality left running in the rig were included. As list of software versions involved in the Technical Report with “as found” and “as left” version number. 

Write version number of installed software on Test Record and CCN, or in Technical Report as explained above. 

The signature should be done preferably after the test by the person who witnessed the test. 

Make an online backup of running software 

Make an online backup of running software – SWNewOnline. The link to the technical guidelines can be found in the attachments provided with QA21. 

Update RDPC 

Ensure that RDPC (Remote Diagnostic server), if exists, is updated with latest version installed. 

Send software and signed documents to SVE 

Send signed Technical Report (that includes Test Record, signed CCN and other procedures related with the change) and SWNewOnline to Services Engineer (SVE) according to QAW21-12: 

Preferably before leaving rig 

Latest when returning onshore or before commencing new service assignments 

NOTE  

Note: If an issue occurs during software implementation testing, the Implementing Personnel (FSE) must immediately inform both the Services Engineer (SVE) and the Technical Responsible to coordinate the fix. If urgent support is required outside of office hours, escalate the issue by including the Rapid Response team in the communication. 

  

Coordinate Fix 

Determine whether the reported issue qualifies as a Hotfix. 

Refer to QA21for Bug fix/Hotfix, 3	Definitions and Abbreviations. 

Develop an action plan and coordinate all required steps with relevant stakeholders. 

NOTE  

No software changes are permitted without prior approval from the Technical Responsible. 

Hotfixes are applicable only when the correction is applied during the implementation of an existing CCN, and the issue can be fully tested at the rig. Hotfixes are typically executed by Engineering but can also be executed by the Rapid Response Team or Field Service Engineers (FSEs) with proper authorization, if required.There are two possibilities when the  Technical Responsible cannot execute the change: 

The Field Service Engineer (FSE) is  authorized by the  Technical Responsible and has the technical competence to identify, correct, and test the fault directly at the rig site. 

The FSE, with support from the  Technical Responsible, cannot identify but can implement the software change and verify its functionality while still at the rig. 

Important: If the change cannot be tested at the rig site by the FSE before departure, it does not qualify as a Hotfix. 

Bug fixes are applicable when: 

The issue requires deeper investigation. 

A solution cannot be identified or implemented while the FSE is still at the rig site. 

The fault is discovered after the FSE has left the rig, requiring resolution in the office environment.  

Hotfixes – Fixes during the CCN implementation 

If a software fix is needed during a  service mission, the Field Service Engineer (FSE) must contact the Services Engineer (SVE). The SVE will coordinate the process and call the Change Board to decide what to do. 

There are two possible situations, based on the FSE’s experience, if the Technical Responsible cannot execute the change: 

FSE knows how to find, fix, and test the problem at the rig site 

 Technical Responsible must give permission before the FSE can make the change. After the fix is approved during the change board, the FSE can implement the changes 

Implement Hotfix 

Update software logic 

Update change log 

Software version number to be updated according to SF01-0009.pdf 

Test Hotfix 

Test changes from the hotfix 

Update CCN 

SVE to update the CCN with relevant information (QAW21-8) 

FSE needs help from the  Technical Responsible 

 Technical Responsible must first check the problem and then give clear instructions. Once the Instructions are received and understood: 

Implement Hotfix 

Update software logic 

Update change log 

Test Hotfix 

Test changes from the hotfix 

Update CCN 

SVE to update the CCN with relevant information (QAW21-8) 

NOTE  

Apply software version identification and numbering in full accordance with SF01‑0009. No additional suffix conventions shall be used. All change must be recorded in the existing Change Control Notice (CCN). 

After testing, the FSE must send the updated software to be stored in Octoplant. 

 Technical Responsible must follow the rules in QA24 to make sure the latest software version includes the fix. 

If the online software is different from the latest release and there are multiple releases not installed on the Rig, the change board should be established to define where/when the fix will be implemented in an official version. 

Important: 

In the next rig site visit, the newest version with the bug fix must be used. Older versions should not be installed, or the backup will be lost. 

Note for FSEs:	 

To help the Technical Responsible, the FSE must provide: 

A short description of the problem 

How they plan to fix it 

The current software version 

The backup (if available) 

No new CCN is needed for Hotfixes, but the category “F” must be added. 

Bug Fixes – Fixes Done in the Office 

If the problem needs more investigation or cannot be fixed at the rig site, the Change Board will review it. If it is confirmed as a bug fix: 

The fix will follow the normal project process in QA21. 

The release and documentation must follow the Bug Fix process in QA24. 

Software version control. Check that procedure also SF01-0009.pdf 

Update the CCN Frames to reflect planned or completed actions. 

All software changes—whether planned or already completed—must be clearly documented in the Change Control Notice (CCN). 

For Hotfixes, once the  Technical Responsible approves the change and the Field Service Engineer (FSE) completes the update and testing at the rig site, the following actions must be taken: 

The change must be recorded in the CCN, including:  

A short description of the issue 

The software version used 

Confirmation that the change was tested at the rig site 

Must add category “F” to CCN for traceability without removing the original category. 

The updated software must be submitted to Octoplant for proper storage. 

The  Technical Responsible must review the change and update the software version. 

If the fix is approved, the  Technical Responsible must follow the process in QA24 to make sure the latest released version includes the fix. 

If the fix is part of a newer software version already used in other jobs, the bug fix must be added to that version. The CCN for that version must also be updated with the bug fix details. 

For bug fixes, after the Change Board confirms the issue, the fix will follow the standard process in QA21 and the bug fix flow in QA24. 

Important Notes: 

If the bug fix was reported after the FSE left the rig, and the updated version is already installed, a new CCN must be created to manage the case. 

If the software was not installed, the same CCN can be updated with the necessary changes, including the addition of category “F”  

Ensure implementation personnel have all necessary information, instructions, and resources to proceed. 

It is the responsibility of the Services Engineer (SVE) to make sure that the Field Service Engineer (FSE) has everything needed to carry out the software change correctly. 

This includes: 

Clear instructions explaining what needs to be done 

A description of the issue and the expected result 

Screenshots or prints, if helpful 

Information about any additional testing that must be performed 

An updated test procedure, if required.  

The goal is to make sure the FSE can perform the change safely and correctly, without confusion or missing steps. 

After implementation, FSE must ensure that documentation, test evidence, and software backup are available and will be sent to the office. 

NOTE  

No software changes shall be made without prior approval from the Technical Responsible. 

Final Reporting and Records Management 

Ensure that all technical information, documentation, and software related to the offshore mission are properly reviewed, recorded, and transferred to the Engineering department for traceability and future reference. 

Close-Out Meeting Preparation 

The SVE must review all technical reports submitted by the FSE prior to the close-out meeting to ensure an effective discussion. 

All issues handled during the offshore mission must be reviewed with the FSE during the meeting. 

Any additional comments or required follow-up actions not included in the technical report must be documented by the SVE and shared with Engineering. 

Gather documentation and software from FSE 

The following items must be gathered from the FSE for post-job documentation: 

Software packages:  

SWNewOnline (PLC, DrillView, Touch Panel, PEF, Any other relevant software) 

Technical documentation:  

Technical Reports 

Work Packages (I.e.: TF05) 

Commissioning Reports 

Redline Markups (if applicable) 

Software Handling 

All software SWNewOnline received from the implementing personnel must be stored in Octoplant as soon as possible. 

Once stored, the SVE must notify the  Technical Responsible and/or Configuration Management that the SWNewOnline has been archived. 

If the online software is different from the latest release (Typically hotfix) and there are multiple releases not installed on the Rig, the change board should be established to define the way forward for the case. 

Upload SWNewOnline and all signed reports to Octoplant in accordance with QAW21-13.   

Attach all required documents to the CCN in accordance with QAW21-8.Notify Technical Responsible and Configuration Management 

In case there was a Hotfix implemented during I&C and/or by Rapid Response team, report to Technical Responsible indicating that he/she shall evaluate if the bugfix is applicable to other opened CCN for this same functionality in other rigs and/or if an Alert should be issued. 

Document Uploads 

Upload all technical reports, TF05 forms, and commissioning reports in accordance with QAW21-8. 

Submit redline markups in accordance with QA198. 

Attach the following to the CCN, in accordance with QAW21-8: 

Test Procedures 

Signed Technical Reports 

TF05 

CCV 

Commissioning Reports 
(Note: External documents must also be signed by the rig.) 

CCN handling must follow procedure QAW21-8. 

Software Fixes and NCR/PAR Evaluation 

If a software fix was implemented, refer to the relevant Software Fix procedure. 

Evaluate whether a Non-Conformance Report (NCR) or Product/Process Action Request (PAR) is required. If applicable, create the record in Synergi. 

Post-Job Briefing 

Verify all actions listed above and in CCN, CCN Test Procedure, TF05 and all related procedures were performed before closing the CCN.  

The SVE must send a post-job briefing invitation to all relevant  Technical Responsibles. 

The invitation must include:  

CCN 

Technical Report 

NCR (if applicable) 

Key findings 

Lessons learned 

References 

QA24 Rig Software Implementation 

QA108 Mobilization Management 

QA198 Handling of Mark-ups from Manufacturing and Installation 

SF01-0009 Software Version Identification and Numbering 

SH05-0001 Software Handling Philosophy 

SWD-05 Security Policy for Control System Computers 

SWD-13 PLC2005 Software Download Guide 

SWD-14 PLC1996 Software Download Guide 

SWD-16 PLCimple Implementation Guide 

SWD-18 TIA Portal Software Download Guide 

SWD-19 Pro-Face Software Download Guide 

SWD-24 PLCMud2004 Software Download Guide 

SWD-25 TIA Portal V17 and V20 Software Download Guide 

SWD-27 CADS Installation Procedure 

I0012729 Drawworks Software Handling Guide 

Revision History  

Rev. 

Reason for issue: 

Date: 

Prepared by | 
Approved by 

1 

First issue  

March 13, 2026 

Fernanda Santos | Jens Hodne 

 

 