# FINP-2372
---
**Summary**
still unable to open some vendor docs in IU UNT




**Description**
able to open 66053666 (might have been created after upgrade by UAT testers)\r\n\r\n\r\nbut not able to open\r\n64703517\r\n64960424\r\n65404570\r\n65716210




**Acceptance Criteria**
null




**Subtasks**




**Comments**
Thanks, new error. See below. I'm putting a XML definition to convert that as well.\r\n\r\n{code}\r\\n---- Debugging information ----\r\nmessage             : Cannot convert type org.kuali.kfs.krad.bo.AdHocRoutePerson to type org.kuali.rice.krad.bo.AdHocRouteRecipient\r\nclass               : org.kuali.rice.krad.bo.Note\r\nrequired-type       : org.kuali.rice.krad.bo.Note\r\nconverter-type      : com.thoughtworks.xstream.converters.reflection.ReflectionConverter\r\npath                : /org.apache.ojb.broker.core.proxy.ListProxyDefaultImpl/org.kuali.rice.krad.bo.Note/adHocRouteRecipient\r\nline number         : 13\r\nclass[1]            : java.util.ArrayList\r\nconverter-type[1]   : com.thoughtworks.xstream.converters.collections.CollectionConverter\r\nversion             : 1.4.10\r\n-------------------------------\r\n{code}\r\n




