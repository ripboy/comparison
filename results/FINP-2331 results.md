# FINP-2331
---
**Summary**
fix it for IE




**Description**
null




**Acceptance Criteria**
null




**Subtasks**




**Comments**
I solved this problem with a solution described here:  https://stackoverflow.com/questions/7413234/how-to-prevent-caching-of-my-javascript-file#7413243

Specifically I'm adding the versionNumber of the BO to the query string. The reload step the functionals have on the story assures the versionNumber is bumped up as long as the document went final. Note that per the PR I'm doing this specifically for Asset Manual Payment only -- I think in theory this could be a problem elsewhere though (for IE only, I assume). I'm curious what the tech team thinks about that solution. Seems redundant for our servers but it does force IE to realize it's a new version of the page...

{code}
BEFORE http://localhost:8080/kfs-dev/kr/inquiry.do?methodToCall=start&businessObjectClassName=org.kuali.kfs.module.cam.businessobject.Asset&capitalAssetNumber=319731&mode=modal

AFTER: http://localhost:8080/kfs-dev/kr/inquiry.do?methodToCall=start&businessObjectClassName=org.kuali.kfs.module.cam.businessobject.Asset&capitalAssetNumber=319731&versionNumber=7&mode=modal
{code}

Thanks [~philip]. I did reproduce this problem in Vendor. Since this looks like a simple fix, I've created another jira to fix other BOs. FINP-2348




