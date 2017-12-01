# FINP-2338
---
**Summary**

MPAY doc 7566 went to exception




**Description**

* as bomiddle, create manual payment document
* add asset 319730 with allocation amt of 100	
* add asset 319731 with allocation amt of -100	
* add acct line 1024700	7000 with amt 100
* add acct line 1024700	7000 with amt -100
* submit doc




**Acceptance Criteria**

null




**Subtasks**





**Comments**

This was the result of our work on FINP-2224. The reason this happens is because on that jira we changed by amount logic so that it groups accounting lines that have the same accounting line string per how it was specified in the provided spreadsheet. But we didn't account for that when creating the payments when the document goes final hence technically an exception (NPE).

I changed the code so that it's able to deal with that when creating payments. In order to achieve that I had to move some code around. It should work fine but I would recommend giving all MPAY allocation types (not just by amount") a go-over particularly for if the accounting lines are the same. Only "by amount is impacted by this change but the code in question is used for all allocation types.

Thanks!




