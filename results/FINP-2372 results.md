# FINP-2372
---
**Summary**
still unable to open some vendor docs in IU UNT




**Description**
able to open 66053666 (might have been created after upgrade by UAT testers)


but not able to open
64703517
64960424
65404570
65716210




**Acceptance Criteria**
null




**Subtasks**




**Comments**
Thanks, new error. See below. I'm putting a XML definition to convert that as well.

{code}
---- Debugging information ----
message             : Cannot convert type org.kuali.kfs.krad.bo.AdHocRoutePerson to type org.kuali.rice.krad.bo.AdHocRouteRecipient
class               : org.kuali.rice.krad.bo.Note
required-type       : org.kuali.rice.krad.bo.Note
converter-type      : com.thoughtworks.xstream.converters.reflection.ReflectionConverter
path                : /org.apache.ojb.broker.core.proxy.ListProxyDefaultImpl/org.kuali.rice.krad.bo.Note/adHocRouteRecipient
line number         : 13
class[1]            : java.util.ArrayList
converter-type[1]   : com.thoughtworks.xstream.converters.collections.CollectionConverter
version             : 1.4.10
-------------------------------
{code}





