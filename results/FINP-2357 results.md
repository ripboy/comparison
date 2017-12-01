# FINP-2357
---
**Summary**
fix it




**Description**
null




**Acceptance Criteria**
null




**Subtasks**




**Comments**
This was a little hairier then I hoped. Summary:\r\n# Attached the workflow XML and SQL for setting this up in base. Here are the test scenarios:  https://kualico.atlassian.net/browse/FINP-2132?focusedCommentId=67862&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-67862. Use agetz to avoid skipping the node\r\n# I wasn't able to consistently reproduce the duplicate note and didn't investigate further what the simulation is. I agree that the code has the potential to add multiple notes. The way I consistently tested this was via manually adding the note and verifying the system doesn't add it twice (see last bullet point on how I actually solved it)\r\n# I explored adding the note in doRouteStatusChange but that doesn't work because the status doesn't change, the route node changes\r\n# doRouteLevelChange fits that bill, however that method isn't supported for Maintenance Documents so it only works for AT and ELR\r\n{code}\r\n    @Override\r\n    public void doRouteLevelChange(DocumentRouteLevelChange levelChangeEvent) {\r\n        super.doRouteLevelChange(levelChangeEvent);\r\n\r\n        String newNodeName = levelChangeEvent.getNewNodeName();\r\n        if (CamsConstants.RouteLevelNames.ORGANIZATION_INACTIVE.equals(newNodeName)) {\r\n            SpringContext.getBean(AssetService.class).addAssetInactiveNote(this, asset.getCapitalAssetNumber());\r\n        }\r\n    }\r\n{code}\r\n# I modified out note adding logic and made sure the note doesn't already exists. Not as clean of a solution I hoped for but it's looking promising\r\n\r\nI did not address the issue of the note being added if it doesn't stop at the route node. Heather reminded me of this: https://kualico.atlassian.net/browse/FINP-2193?focusedCommentId=68044&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-68044




