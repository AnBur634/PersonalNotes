Owner 	Chief Engineer – Control Systems 

Process 	Common for Operating Processes 

Applies to	Equipment & System Solutions 

Purpose and Scope 

Purpose 

The main goal of this procedure is to manage changes to software produced and delivered by HMH with adequate level of control and quality. 

Secure communication and manage knowledge from start to end. 

Make sure that required quality steps are fulfilled, starting in first step and ending in last step. 

Scope 

This procedure is applicable for software and parameters produced and delivered by HMH ESS 

This procedure shall be used: 

At least from initial product delivery FAT and through product lifetime (Project may decide to start using this procedure even earlier) 

When delivering new product to existing rig 

Software changes are defined as: 

All software code changes, including hard-coded values 

All user interface changes 

All parameter/configuration changes affecting functionality, behavior, limitations or interfaces, except for operational parameters described in the user manual 

All interface changes 

Used in work processes: Manage Products, Deliver Products, Deliver Packages and Deliver Lifecycle Services 

For products in QA21 exclusion list, this procedure is not required 

Input and Output 

Input 

Request for software change 

Output 

Changed software on rig, installed and tested 

Updated user documentation in accordance with change  

New software release in Octoplant (DLS Folder) 

New online backup in Octoplant (DLS Folder) 

Signed test record and additional documents, if required. 

Closed CCN 

Table of Contents 

 

Responsibility and Authority 

Configuration Management 

Personnel to Fulfill this Role 

Configuration Management Engineer 

Software/Services Engineer authorized by Configuration Management Engineer 

Responsibilities 

Plan, control and coordinate the change process 

Establish and coordinate change board 

If handover is required, approve and coordinate role handover between two persons.  

Lock/Freeze relevant software if complex/multiple software upgrades are ongoing e.g. CADS, Riglogger or third-party systems  

Provide a risk estimate/chart based on testing done prior to software release  

Quality assures the CCN filling and handling 

If new software release and documentation are not within acceptance, evaluate and if necessary, stop the upcoming change 

Technical Responsible 

Personnel to Fulfill this Role 

Subject Matter Expert, as listed in OCTO BI 

Software engineer authorized by Subject Matter Expert 

Responsibilities 

Produce and provide software and documentation in accordance with CCN and procedures  

Provide timely technical support during change installation 

Provide timely support/approval during Service Mission 

Quality assure the CCN filling and handling 

Services Engineer (SVE) 

Personnel to Fulfill this Role 

DLS Services Engineer (SVE) 

Trained Engineer authorized by Services Engineer (SVE) 

Responsibilities 

Lead the lifecycle software deployment into operating rigs, based on field context and a system-level perspective (interfaces), including installation planning and the management of constraints and change within defined asset operating windows to ensure risk control, downtime mitigation, and continuous optimization. 

Inform the organization in the change board about: 

Software release order according to I&C needs 

I&C requirements 

Plans for Installation window  

Handle CCN according to QAW21-8 

Manage the software change during rig installation 

Provide Implementing Personnel with software and documentation (work package) 

Receive and store software and documentation from implementing personnel 

Handover with Configuration Management Engineer/SMEs with: CCN information, signed documents/procedures, Technical Report, as built, etc. 

Change Board 

Change board is headed by Engineering Manager, Configuration Management or trained engineer authorized by them. The change board shall be composed by at least: 

SME for each application involved or/and engineer authorized by them. 

Services Engineer (SVE) or trained engineer authorized by them. 

Engineering Manager, Configuration Management or trained software engineer authorized by them. 

Responsibilities 

Evaluate scope, risks, side effects, and other consequences of change 

Involve necessary roles in the organization 

Field Service Engineer (FSE) 

Personnel to Fulfill this Role 

Field Service Engineer (FSE) with the correct competence level for the product and for the software type 

Responsibilities 

Execute installation and verification, involving customers 

Keep track of all software versions as defined in this procedure 

Involve Technical Responsible or Rapid Response team and inform the Services Engineer (SVE) in the event of problems 

Return software and records to Services Engineer (SVE) 

NOTE  

Implementing Personnel is not allowed to change software, unless if pre-authorized by Technical Responsible in case of Bugfixes, see Technical Responsible’ s Responsibilities for details. 

Customer 

Personnel to Fulfill this Role 

Relevant rig representative 

Responsibilities 

Approve all changes to be done on the Rig prior software change 

Witness and sign test procedures 

 

Description of Activities 

Change Flow Chart 

 

Activities 

Address Software Change 

Execute QA21-2 paragraph 2.2.1 

Review status on rig  

Establish CCN, if not already existing 

Verify CCN according to work instruction 

Initiate Software Change 

Execute QA21-2 paragraph 2.2.2 

Establish change board and invite to meeting  

Evaluate Software Change 

Execute QA21-2 paragraph 2.2.3 

Verify scope of work in CCN, and update if required 

Identify side effects to other products/systems not listed up to this point. 

Evaluate requests for multiple simultaneous software releases 

Evaluate and recommend or reject the change request 

Evaluate change impact on Product certificate or declaration of conformity  

Consider past CCNs for the same functionality in other rigs to implement the same solution in this change. 

Consider past NCRs for the same functionality in other similar rigs and apply preventive recurrence action 

Determine whether the reported issue qualifies as a Bugfix. If the software change is classified as a Bugfix, it should follow the established Bugfix workflow. 

Update Software and Documentation 

Execute QA21-2 paragraph 2.2.4 

Update Software 

Update CCN and documentation 

Highlight risk of installing new software, especially due to missing testing 

Test integrated system 

Approve for Installation 

Execute QA21-2 paragraph 2.2.5 

Verify CCN contents according to procedure 

Estimate I&C and update CCN based on the Complexity/Quality Matrix. 

Calculate risk level of installing the new software 

If risk level is high, change board should decide the mitigating actions are required. 

Prepare Installation 

Execute QA21-2 paragraph 2.2.6 

Clarify Risk level clearly to customer. If risk level is unacceptable, gather Change Board and decide on mitigating actions. 

Prepare contents and send to customer for approval, if required by customer: 

Create Work Package Folder and share with implementing personnel 

Invite Technical Responsible to the mobilization meeting according to QA108 

Immediately before installation, evaluate other activities towards the rig since the CCN was established and resolve all issues before initiating installation.  

Install and Test Software  

Execute QA21-2 paragraph 2.2.7 

Create recovery backup 

Install software 

Test software  

Collect customer signatures 

Make online backup of running software 

Update RDPC 

Send software and signed documents to Services Engineer (SVE)  

Coordinate Fix 

Execute QA21-2 paragraph 2.2.8 

Determine whether the reported issue qualifies as a Hotfix. 

Develop an action plan and coordinate all required steps with relevant stakeholders. 

Update the CCN Frames to reflect planned or completed actions. 

Ensure implementation personnel have all necessary information and resources to proceed. 

Final Reporting and Records Management 

Execute QA21-2 paragraph 2.2.9 

Close out meeting preparation 

Gather documentation and software from FSE 

Software Handling 

Document uploads 

Software Fixes 

Post-Job Briefing 

Definitions and Abbreviations 

 

 

Bugfix 

Bugfix requires a separate Change Control Notice (CCN) and execution of QA21. QA process is simpler than a full change. 

A Bugfix is a modification implemented to correct a fault that causes the system to behave incorrectly, inconsistently, or not as intended.  
Bugfixes do not introduce new features, interfaces changes, changes in product documentation or enhancements—their sole purpose is to restore the system’s intended functionality. 

Any modification that requires significant redesign or involves extensive changes across the code shall not be classified as a Bugfix. 

A Bugfix is a software correction normally performed in the office by the Engineering Department to resolve identified faults and ensure proper system operation. 

Hotfix 

A Hotfix is a software correction applied during the rig installation and testing of an existing Change Control Notice (CCN). No extra CCN is required. 

A Hotfix is a modification implemented to correct a fault that causes the system to behave incorrectly, inconsistently, or not as intended.  
Hotfixes do not introduce new features, interfaces changes, changes in product documentation or enhancements—their sole purpose is to restore the system’s intended functionality. 

Any modification that requires significant redesign or involves extensive changes across the code shall not be classified as a hotfix. 

Hotfix is typically performed in the office by the Engineering Department but can also be executed by the Rapid Response Team or Field Service Engineers (FSEs) with proper authorization, if required. 

NOTE  

If the correction cannot be fully tested at the rig before demobilization, treat it as a Bugfix. 

 

CCN 

Construction Change Notice – a record in the CCN system that tracks the complete change process   

DCMS 

Drilling Control Monitoring System 

FAT 

Factory Acceptance Test 

FSE 

Field Service Engineer 

Implementing personnel 

The person(s) who installs and tests the change 

Rapid Response  

Rig support (24/7) 

Simulator/Lab 

The local simulator used by the software engineer and running in the software engineer’s test environment. Any other simulators have to be treated as additional verification in context of change management. 

SVE 

Services Engineer 

SW 

Software 

SWBaseOnline 

The backup of the software currently running on the rig before this change job starts. 

SWBaseRelease 

Latest officially released software in Octoplant from prior to executing this change job. The software change shall normally be executed on this software base. Ideally, SWBaseOnline and SWBaseRelease is the same version. In less ideal cases, software installed on rig is different and the base will have to be created/merged before executing this change job. 

SWNewOnline  

The version of the software running on the rig after the job is completed or cancelled. 

SWNewRelease  

The new official release created by the Technical Responsible person as part of this change. 

SWRecovery 

A backup of the current software running on the rig before installation begins. It can be restored if the customer rejects the change or if testing fails. 

Test procedure 

Documented using the CCN Test Procedure 

Test record 

Test procedure with documented results and signature by tester and test approver as required in procedure 

References 

QA24 Software Development and Release 

QA108 Mobilization Management 

QA198 Handling of Mark-ups from Manufacturing and Installation 

Download Guides 

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

Appendices 

QA21-2 Software Change Guideline 

QAW21-8 Software Change Tracking 

QAW21-13 octoplant Software Release Instruction 

 

Revision History  

Rev. 

Reason for issue: 

Date: 

Prepared by | 
Approved by 

21 

Restructured QA21 roles and responsibilities 

Updated end‑to‑end change workflow 

Strengthened risk classification and approval requirements  

Renamed previous “Bugfix” to “Hot Fix” 

New “Bugfix” process 

Transitioned software storage and backups from SAP to Octoplant 

Updated references and terminology. 

Introduced guideline QA21-2. 

March 13, 2026 

Fernanda Santos | Jens Hodne 

20 

Added reference and link to new work instruction QAW21-13 octoplant Software Release Instruction in chapter 5 

May 24, 2024 

Control System Network |  

Jens Hodne 

19 

Scope – Added delivering new product to existing rigs 

January 30, 2023 

Control System Network |  

Jens Hodne 

18 

Clarified Purpose – Emphasized 1 person per role and using procedure from start to end 

Scope: Project can now decide when to start using QA21 

Scope: Start using procedure at FAT 

Scope: Generalized and clarified the definition of a software change.  

Scope: Software products not used by customer excluded 

Clarified handover  

Clarified roles 

Added notes defining who to appoint Software Change Engineer 

Change Board – Change board to be headed by Software Change Engineer and involve all Technical Responsible 

Added flow chart box for “request change” 

Step 2: Improved handling of “multiple versions/releases” 

Step 3: Added instruction of how to handle when BaseRelease has not been installed on rig 

Step 3: Clarified that only 1 version of each software is allowed 

Step 5: Clarified that step 3 is repeated if BaseOnline invalid 

Removed references to “machine” and “rig” to better include non-machine software and simulator software 

Step 6: Clarified instruction to Implementing Personnel based on confusion identified in the organization. 

Step 5 – Require written consent from customer about accepting risk level of installation. 

Added new step 4 – “Test Integrated System” 

Changed Change Coordinator role to Software Change Engineer – a role with special competence. Moved responsibility for verifying SWBaseOnline to Software Change Engineer 

Customer steps integrated into other other steps and steps rearranged. 

Transferred into HMH template. 

August 25, 2022 

Control System Network |  

Jens Hodne 

17 

Scope: Clearer definition of when procedure is to be used. 

Ch. 1.1.1: Role definition for change coordinator: Handover clarified.  

Ch. 4 Updated link to SWD-18 

June 18, 2020 

Jens Hodne |  

Jens Hodne 

16 

Risk management increased 

 

Renamed SWRigPreBackup to SWRecovery 

 

Clarification that only Technical Responsible is allowed to change software 

 

Common CCN system in use globally (procedure will be released before this has been completed) 

 

Improvements found during development of eLearning 

October 17, 2019 

Jens Hodne |  

Jens Hodne 

15 

Updated scope. 

June 3, 2019 

Jens Hodne |  

Jens Hodne 

14 

Clarifications 

May 3, 2019 

Jens Hodne |  

Jens Hodne 

13 

Changed routine for document exchange between change coordinator and implementing personnel¨. 

Added reference to new tia portal download guide. 

Added references and links to QAW21-11 and QAW21-12. 

August 14, 2018 

Jens Hodne |  

Jens Hodne 

12 

Added additional verification steps for change coordinator 

Added clarification of how to handle customer requests for multiple pick-and-choose optional changes 

Clarified priority order of the change coordinator role 

 

Various corrections and clarifications. Updated owner role. 

May 9, 2018 

Jens Hodne |  

Jens Hodne 

11 

Various corrections and clarifications. Added reference to work instruction and direction for document status to step 9 – final reporting. 

August 14, 2017 

Jens Hodne |  

Jens Hodne 

10 

First global release – major reorganization. Updated process. Removed attachments QA21-1 and QAW21-1-7.  Changes not marked throughout the document. 

April 20, 2017 

Jens Hodne |  

Jens Hodne 

09 

New owner. Minor updates in text in chapter 1. 

April 4, 2016 

Kjell Olav Håland | 
Kjell Olav Håland and Jens Hodne 

08 

Transferred to MHWirth template 

November 17,  2015 

Giana Steen | 

Kjell Olav Håland 

07 

Emphasized scope of work and expected delivery (test re-port/procedure and peer-review). 

September 08, 2014 

Kjell Olav Håland | 

Jens Hodne 

06 

Process reference changed 

August 15, 2014 

Kjell Olav Håland | 

Jens Hodne 

05 

Updated TR and change coordinator definition. Emphasized use of Change Request as necessary input to TR. Added feed-back/backup to TR on all relevant flow diagrams. 

May 08, 2014 

Kjell Olav Håland | 

Jens Hodne 

04 

New process for changes through 24/7 online support. Updated workflow step 1-8 regarding who to establish CCN. Removed “Check out” requirement in step 11. 

January 16, 2014 

Kjell Olav Håland | 

Jens Hodne 

03 

Removed fast track possibility in QA21. Added sw verification. Added test procedure. Added parameter change definition. Changed CCN coordinator to administrative role. Added work in-structions: QAW21-1 to QAW21-6. Changes not marked in margin 

April 19, 2013 

Kjell Olav Håland | 

Jens Hodne 

02 

New activity 14 added in workflow and activity description 

April 3, 2008 

Eldri Nærum | 

Dag Snemyr 

01 

Procedure moved into operating system 

March 3, 2008 

 

- 

First issue, in old operating system 

2001 

Jens Hodne 

 

 