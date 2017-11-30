# FINP-2347
---
**Summary**
inquiry modal works from MPAY but not from asset lookup




**Description**
null




**Acceptance Criteria**
null




**Subtasks**




**Comments**
I put a PR out there to fix this one. This is different then FINP-2331 in that I'm adding the versionNumber to every framework generated inquiry in KFS, if the BO has a versionNumber. The upshot of the solution is that it would also fix FINP-2348. The downside is that to fix this problem in IE we now would pass the versionNumber for every inquiry in KFS.\r\n\r\nLets see what the tech team thinks of this solution.
I should add that my generic solution on this subtask wouldn't make the solution on FINP-2331 redundant since FINP-2331 deals with an inquiry that isn't generic -- it was coded on the JSP.
Yay!  :fingerscrossed:




