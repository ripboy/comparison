**Comments**

**Comments**

This is an escaped defect of FINP-2222
FYI, I would recommend on breakpoint on isZero &= apad.getAllocatedUserValue().isZero(); of AssetPaymentAllocationValidation#validateNonZeroAssetByAmountAllocation (see https://github.com/KualiCo/financials/pull/1390/files if it helps). Something must be going wrong there.
Heather,

I’m concerned the edit is going to cause issues with finical documents that are processed on the Asset Manual Payment.  Is there a way call the edit *only* when the user is manually entering the information into the Asset Manual Payment? 

Theresa 
[~tcain] -  I can have the devs check to see if we can do that. Have you tested that scenario to see if the error is happening when the MPAY is processing an FP doc?
Heather,
I just tried a GEC that moved the payment from one account to a new account.   In this case the amounts net to zero so the allocate amount is 0.   The error Use "Distribute cost evenly" when Asset Allocation Amounts are 0. is presented.  

We will need to find a way to call the edit only when the Asset Manual Payment is not populated by CAB.  
{quote}
I’m concerned the edit is going to cause issues with finical documents that are processed on the Asset Manual Payment. Is there a way call the edit only when the user is manually entering the information into the Asset Manual Payment?
{quote}

I solved FINP-2319 by what Theresa proposes. MPAYs from CAB extract is what caused the validation to cause to incorrectly fire. I verified that change doesn't break when we _do_ expect it to fire. Please double check though once deployed.

Thank you!
