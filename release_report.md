# Release Report
Changes between releases 2017-10-19 and 2017-11-02
## Database File Changes
## **Duplicate Files Changes**
---
*File #1*

**kfs-ar/src/main/java/org/kuali/kfs/module/ar/report/service/impl/AccountsReceivableReportServiceImpl.java**

```diff
diff --git a/kfs-ar/src/main/java/org/kuali/kfs/module/ar/report/service/impl/AccountsReceivableReportServiceImpl.java b/kfs-ar/src/main/java/org/kuali/kfs/module/ar/report/service/impl/AccountsReceivableReportServiceImpl.java
index 7885d16118..78294044b1 100644
--- a/kfs-ar/src/main/java/org/kuali/kfs/module/ar/report/service/impl/AccountsReceivableReportServiceImpl.java
+++ b/kfs-ar/src/main/java/org/kuali/kfs/module/ar/report/service/impl/AccountsReceivableReportServiceImpl.java
@@ -306,7 +306,7 @@ public class AccountsReceivableReportServiceImpl implements AccountsReceivableRe
                 shipCityStateZip = generateCityStateZipLine(shipToAddr.getCustomerCityName(), shipToAddr.getCustomerStateCode(), shipToAddr.getCustomerZipCode());
             } else {
                 shipCityStateZip = generateCityStateZipLine(shipToAddr.getCustomerCityName(), shipToAddr.getCustomerAddressInternationalProvinceName(), shipToAddr.getCustomerInternationalMailCode());
-                customerMap.put("shipToCountry", shipToAddr.getCustomerCountry().getName());
+                customerMap.put("shipToCountry", shipToAddr.getCustomerCountry().getName().toUpperCase());
             }
             customerMap.put("shipToCityStateZip", shipCityStateZip);
         }
@@ -427,7 +427,7 @@ public class AccountsReceivableReportServiceImpl implements AccountsReceivableRe
                 billCityStateZip = generateCityStateZipLine(billToAddr.getCustomerCityName(), billToAddr.getCustomerStateCode(), billToAddr.getCustomerZipCode());
             } else {
                 billCityStateZip = generateCityStateZipLine(billToAddr.getCustomerCityName(), billToAddr.getCustomerAddressInternationalProvinceName(), billToAddr.getCustomerInternationalMailCode());
-                customerMap.put("billToCountry", billToAddr.getCustomerCountry().getName());
+                customerMap.put("billToCountry", billToAddr.getCustomerCountry().getName().toUpperCase());
             }
             customerMap.put("billToCityStateZip", billCityStateZip);
         }
```
---
*File #2*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetMaintainableImpl.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetMaintainableImpl.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetMaintainableImpl.java
index 4c9c53a91c..a269bf25ca 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetMaintainableImpl.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetMaintainableImpl.java
@@ -391,7 +391,6 @@ public class AssetMaintainableImpl extends FinancialSystemMaintainable {
                 return false;
             }
 
-            assetService.addAssetInactiveNote(documentBase, asset.getCapitalAssetNumber());
             return true;
         } else {
             return false;
```
---
*File #3*

**kfs-kns/src/main/resources/org/kuali/kfs/krad/config/MaintainableXMLUpgradeRules.xml**

```diff
diff --git a/kfs-kns/src/main/resources/org/kuali/kfs/krad/config/MaintainableXMLUpgradeRules.xml b/kfs-kns/src/main/resources/org/kuali/kfs/krad/config/MaintainableXMLUpgradeRules.xml
index 604c73fa58..05fe0ffa6d 100644
--- a/kfs-kns/src/main/resources/org/kuali/kfs/krad/config/MaintainableXMLUpgradeRules.xml
+++ b/kfs-kns/src/main/resources/org/kuali/kfs/krad/config/MaintainableXMLUpgradeRules.xml
@@ -76,6 +76,14 @@
             <match>org.kuali.rice.kim.bo.impl.ReviewResponsibility</match>
             <replacement>org.kuali.rice.kim.impl.responsibility.ReviewResponsibilityBo</replacement>
         </pattern>
+        <pattern>
+            <match>org.kuali.rice.krad.bo.AdHocRoutePerson</match>
+            <replacement>org.kuali.kfs.krad.bo.AdHocRoutePerson</replacement>
+        </pattern>
+        <pattern>
+            <match>org.kuali.rice.krad.bo.Note</match>
+            <replacement>org.kuali.kfs.krad.bo.Note</replacement>
+        </pattern>
     </rule>
 
     <!-- Rules specifying any change in class properties.
```
---
*File #4*

**kfs-cam/src/main/resources/org/kuali/kfs/module/cam/spring-cam.xml**

```diff
diff --git a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/spring-cam.xml b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/spring-cam.xml
index 5e2efa0ed0..1c6332ce6e 100644
--- a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/spring-cam.xml
+++ b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/spring-cam.xml
@@ -304,12 +304,9 @@
     <bean id="assetService" parent="assetService-parentBean"/>
     <bean id="assetService-parentBean" class="org.kuali.kfs.module.cam.document.service.impl.AssetServiceImpl" abstract="true">
         <property name="businessObjectService" ref="businessObjectService"/>
-        <property name="configurationService" ref="kualiConfigurationService"/>
-        <property name="noteService" ref="noteService"/>
         <property name="objectCodeService" ref="objectCodeService"/>
         <property name="parameterService" ref="parameterService"/>
         <property name="paymentSummaryService" ref="paymentSummaryService"/>
-        <property name="personService" ref="personService"/>
     </bean>
 
     <bean id="assetTransferService" parent="assetTransferService-parentBean"/>
```
## **Properties Files Changes**
## **Workflow File Changes**
## **Miscellaneous File Changes**
---
*File #5*

**CHANGELOG.txt**

```diff
diff --git a/CHANGELOG.txt b/CHANGELOG.txt
index 129464aa2e..0cb0a19b85 100644
--- a/CHANGELOG.txt
+++ b/CHANGELOG.txt
@@ -1,3 +1,153 @@
+************************* 2017-11-02 *************************
+commit a21380514242ca065e605b17190359dd33646f4b
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-11-01 18:23:30 -0400
+
+    FINP-2371: Removal of inactive org note
+
+:100644 100644 f8f5a2f... a17702c... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/CamsKeyConstants.java
+:100644 100644 6d26c97... a7c28a4... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetLocationGlobalMaintainableImpl.java
+:100644 100644 4c9c53a... a269bf2... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetMaintainableImpl.java
+:100644 100644 d746a3d... 90b825c... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetRetirementGlobalMaintainableImpl.java
+:100644 100644 e5bba9c... f4139cd... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetTransferDocument.java
+:100644 100644 3eab504... 84b5405... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/AssetService.java
+:100644 100644 5235196... e9e336f... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetServiceImpl.java
+:100644 100644 10309a4... 8ceb937... M	kfs-cam/src/main/resources/org/kuali/kfs/module/cam/cam-resources.properties
+:100644 100644 5e2efa0... 1c6332c... M	kfs-cam/src/main/resources/org/kuali/kfs/module/cam/spring-cam.xml
+
+commit e37d8deac5937a0334251ddf27134e9a226d35de
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-11-01 17:48:05 -0400
+
+    FINP-2372: Additional MD notes conversion defntn
+
+:100644 100644 9dd969e... 05fe0ff... M	kfs-kns/src/main/resources/org/kuali/kfs/krad/config/MaintainableXMLUpgradeRules.xml
+
+commit 416d79dec42781570df4bf819e9f1918c9badc38
+Author: warheadwl <warheadwl@users.noreply.github.com>
+Date:   2017-11-01 07:28:57 -0700
+
+    upgrade taxitems.tag to the newest UI standards (#1394)
+
+:100644 100644 0983a16... 504f5b4... M	kfs-web/src/main/webapp/WEB-INF/tags/module/purap/taxitems.tag
+
+commit 5a45dcf952dc46d8b5d392c9321047eaf36b432b
+Author: Kevin Kronenbitter <kevin@kuali.co>
+Date:   2017-10-31 16:27:52 -0600
+
+    FINP-2369 fix NPE when checking inactive org hierarchy (#1429)
+
+:100644 100644 c725563... f5503a3... M	kfs-core/src/main/java/org/kuali/kfs/coa/service/impl/OrganizationServiceImpl.java
+
+commit e6b322d4cb088af8ed9e52f72750a4b774be9ea2
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-31 15:36:54 -0400
+
+    FINP-2367: Review feedback, thanks!
+
+:100644 100644 11b39e0... 32616d1... M	kfs-web/src/main/webapp/WEB-INF/tags/module/ec/detailLineDataCell.tag
+:100644 100644 95dbe23... f5ddba2... M	kfs-web/src/main/webapp/css/newPortal.css
+
+commit 8f6f974dd3326ac2a86ca326feab4f98ef71ba06
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-31 15:15:15 -0400
+
+    FINP-2367: Give EC report cells a maxwidth
+
+:100644 100644 8de6384... 11b39e0... M	kfs-web/src/main/webapp/WEB-INF/tags/module/ec/detailLineDataCell.tag
+:100644 100644 55f4abe... 95dbe23... M	kfs-web/src/main/webapp/css/newPortal.css
+
+commit c55454f2ecad911febb52d99a0e51e7975f37525
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-30 17:26:28 -0400
+
+    FINP-2363: (Re-) allow range operators
+
+:100644 100644 ad094db... 1e7da00... M	kfs-kns/src/main/java/org/kuali/kfs/krad/dao/impl/LookupDaoOjb.java
+
+commit dfab1a3478bbe91d4eed72c001a797f26972e999
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-30 10:31:55 -0400
+
+    FINP-2359: Uppercase country name
+
+:100644 100644 7885d16... 7829404... M	kfs-ar/src/main/java/org/kuali/kfs/module/ar/report/service/impl/AccountsReceivableReportServiceImpl.java
+
+commit f6617b090b02a99bfafbef49245a360f0e222f23
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-27 18:11:01 -0400
+
+    FINP-2357: Wrong jira, reverting
+
+:100644 100644 7829404... 7885d16... M	kfs-ar/src/main/java/org/kuali/kfs/module/ar/report/service/impl/AccountsReceivableReportServiceImpl.java
+
+commit 8c27dfdb5161bc8b9d2eef9de3d37f186ec9816f
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-27 18:08:42 -0400
+
+    FINP-2357: Don't add duplicate notes
+
+:100644 100644 3d533c1... 5235196... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetServiceImpl.java
+
+commit c1b67cd410420c707b0fc6aeb50c99fd088bc741
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-27 12:14:46 -0400
+
+    FINP-2359: Uppercase country name
+
+:100644 100644 7885d16... 7829404... M	kfs-ar/src/main/java/org/kuali/kfs/module/ar/report/service/impl/AccountsReceivableReportServiceImpl.java
+
+commit 5920cb9d42ffd64ba0df0e5ca7a4f4d35c689dbb
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-26 17:40:41 -0400
+
+    FINP-2350: Added pattern for MD notes conversion
+
+:100644 100644 2707a80... 8a73b51... M	kfs-kns/src/main/java/org/kuali/kfs/krad/maintenance/MaintenanceDocumentBase.java
+:100644 100644 2f415e1... f7d77de... M	kfs-kns/src/main/java/org/kuali/kfs/krad/service/MaintainableXMLConversionService.java
+:100644 100644 616aafc... b9ce96f... M	kfs-kns/src/main/java/org/kuali/kfs/krad/service/impl/MaintainableXMLConversionServiceImpl.java
+:100644 100644 604c73f... 9dd969e... M	kfs-kns/src/main/resources/org/kuali/kfs/krad/config/MaintainableXMLUpgradeRules.xml
+
+commit b1531ff6f6e6dea6dd600e7241f426da8c565b74
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-26 13:23:31 -0400
+
+    FINP-2347: Generic solution for IE caching
+
+:100644 100644 243640a... 93eb284... M	kfs-kns/src/main/java/org/kuali/kfs/kns/inquiry/KualiInquirableImpl.java
+
+commit 19b7e8eb3db1ee309d9a22e8ba5310946f9ed5c7
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-25 16:59:23 -0400
+
+    FINP-2331: Force IE to skip cache if necessary
+
+:100644 100644 9967c10... e2d5e5b... M	kfs-web/src/main/webapp/WEB-INF/tags/module/cams/assetPaymentsAssetInformation.tag
+:100644 100644 20417a9... 0d34b45... M	kfs-web/src/main/webapp/WEB-INF/tags/module/cams/viewPaymentInProcessByAsset.tag
+
+commit 338dd2eb0a417ca227d5b09eed9cc253d1ecb11d
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-25 12:27:38 -0400
+
+    FINP-2338: Method foodprint cleanup
+
+:100644 100644 857f866... 29216e4... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetPaymentServiceImpl.java
+
+commit 0c1d13b774361aa1f255796f471fb383a48be902
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-25 12:27:09 -0400
+
+    FINP-2338: Avoid NPE on grouped lines
+
+:100644 100644 4bddd11... 857f866... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetPaymentServiceImpl.java
+
+commit d6f58e60e3ea58a235a1efeca5158640da711005
+Author: Philip Berg <pcberg@iu.edu>
+Date:   2017-10-24 17:16:06 -0400
+
+    FINP-2319: No valid. when MPAY from cab extract
+
+:100644 100644 43c2633... a8a0114... M	kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/validation/impl/AssetPaymentAllocationByAmountValidation.java
 ************************* 2017-10-19 *************************
 commit de3f445b9fc9f99b7bdb4f420572b5cd43ff33ac
 Author: Kevin Kronenbitter <kevin@kuali.co>
```
---
*File #6*

**kfs-ar/pom.xml**

```diff
diff --git a/kfs-ar/pom.xml b/kfs-ar/pom.xml
index a1ff49bacf..b078be6064 100644
--- a/kfs-ar/pom.xml
+++ b/kfs-ar/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #7*

**kfs-ar/src/main/resources/org/kuali/kfs/module/ar/db/phase5/next-release.xml**

```diff
diff --git a/kfs-ar/src/main/resources/org/kuali/kfs/module/ar/db/phase5/next-release.xml b/kfs-ar/src/main/resources/org/kuali/kfs/module/ar/db/phase5/next-release.xml
index c096e8a20b..4d94e80679 100644
--- a/kfs-ar/src/main/resources/org/kuali/kfs/module/ar/db/phase5/next-release.xml
+++ b/kfs-ar/src/main/resources/org/kuali/kfs/module/ar/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/ar/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/ar/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #8*

**kfs-cam/pom.xml**

```diff
diff --git a/kfs-cam/pom.xml b/kfs-cam/pom.xml
index e809ed3f34..9e1613e6cc 100644
--- a/kfs-cam/pom.xml
+++ b/kfs-cam/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #9*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/CamsKeyConstants.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/CamsKeyConstants.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/CamsKeyConstants.java
index f8f5a2f050..a17702c39a 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/CamsKeyConstants.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/CamsKeyConstants.java
@@ -72,8 +72,6 @@ public class CamsKeyConstants {
     public static final String CHART_ORG_DISALLOWED_BY_CURRENT_USER = "chart.org.disallowed.by.current.user";
     public static final String WARNING_GL_PROCESSED = "warning.gl.processed";
 
-    public static final String NOTE_LIST_OF_INACTIVE_ASSETS = "note.list.of.inactive.assets";
-
     public static class Depreciation {
         public static final String NO_ELIGIBLE_FOR_DEPRECIATION_ASSETS_FOUND = "error.batch.depreciation.assetsNotFound";
         public static final String ERROR_WHEN_CALCULATING_BASE_AMOUNT = "error.batch.depreciation.baseAmountCalculationError";
```
---
*File #10*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetLocationGlobalMaintainableImpl.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetLocationGlobalMaintainableImpl.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetLocationGlobalMaintainableImpl.java
index 6d26c97cb4..a7c28a4346 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetLocationGlobalMaintainableImpl.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetLocationGlobalMaintainableImpl.java
@@ -460,7 +460,6 @@ public class AssetLocationGlobalMaintainableImpl extends FinancialSystemGlobalMa
                 return false;
             }
 
-            getAssetService().addAssetInactiveNote(documentBase, assets);
             return true;
         }
     }
```
---
*File #11*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetRetirementGlobalMaintainableImpl.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetRetirementGlobalMaintainableImpl.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetRetirementGlobalMaintainableImpl.java
index d746a3daa6..90b825c4cf 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetRetirementGlobalMaintainableImpl.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetRetirementGlobalMaintainableImpl.java
@@ -115,7 +115,6 @@ public class AssetRetirementGlobalMaintainableImpl extends LedgerPostingMaintain
                 return false;
             }
 
-            getAssetService().addAssetInactiveNote(documentBase, assets);
             return true;
         }
     }
```
---
*File #12*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetTransferDocument.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetTransferDocument.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetTransferDocument.java
index e5bba9c3dc..f4139cd77b 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetTransferDocument.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/AssetTransferDocument.java
@@ -983,8 +983,6 @@ public class AssetTransferDocument extends GeneralLedgerPostingDocumentBase impl
      */
     protected static boolean isRequiresOrganizationInactiveRouteNode(DocumentBase documentBase, Asset asset) {
         if (!asset.getOrganizationOwnerAccount().getOrganization().isActive()) {
-            SpringContext.getBean(AssetService.class).addAssetInactiveNote(documentBase, asset.getCapitalAssetNumber());
-
             return true;
         } else {
             return false;
```
---
*File #13*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/AssetService.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/AssetService.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/AssetService.java
index 3eab50474b..84b540526a 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/AssetService.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/AssetService.java
@@ -20,7 +20,6 @@ package org.kuali.kfs.module.cam.document.service;
 
 import org.kuali.kfs.kns.document.MaintenanceDocument;
 import org.kuali.kfs.krad.document.Document;
-import org.kuali.kfs.krad.document.DocumentBase;
 import org.kuali.kfs.module.cam.businessobject.Asset;
 import org.kuali.kfs.module.cam.businessobject.AssetLocationGlobalDetail;
 import org.kuali.rice.kew.api.WorkflowDocument;
@@ -235,17 +234,4 @@ public interface AssetService {
      * @return
      */
     boolean hasAssetLocationChanged(Asset oldAsset, Asset newAsset);
-
-    /**
-     * @param documentBase on which to add the note
-     * @param capitalAssetNumber to display on the note
-     */
-    public void addAssetInactiveNote(DocumentBase documentBase, Long capitalAssetNumber);
-
-    /**
-     * @param documentBase on which to add the note
-     * @param assets to display on the note. Comma separated
-     */
-    public void addAssetInactiveNote(DocumentBase documentBase, List<Long> assets);
-
 }
```
---
*File #14*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetPaymentServiceImpl.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetPaymentServiceImpl.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetPaymentServiceImpl.java
index 4bddd11d20..29216e45e4 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetPaymentServiceImpl.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetPaymentServiceImpl.java
@@ -173,36 +173,19 @@ public class AssetPaymentServiceImpl implements AssetPaymentService {
                 KualiDecimal totalAmount = KualiDecimal.ZERO;
                 for (AssetPaymentDetail assetPaymentDetail : assetPaymentDetailLines) {
 
-                    // Retrieve the asset payment from the distribution map
-                    KualiDecimal amount = assetPaymentDistributionMap.get(assetPaymentDetail.getAssetPaymentDetailKey()).get(assetPaymentAssetDetail);
-                    totalAmount = totalAmount.add(amount);
-
-                    AssetPayment assetPayment = new AssetPayment(assetPaymentDetail);
-                    assetPayment.setCapitalAssetNumber(assetPaymentAssetDetail.getCapitalAssetNumber());
-                    assetPayment.setTransferPaymentCode(CamsConstants.AssetPayment.TRANSFER_PAYMENT_CODE_N);
-                    assetPayment.setPaymentSequenceNumber(++maxSequenceNo);
-                    if (StringUtils.isBlank(assetPayment.getDocumentNumber())) {
-                        assetPayment.setDocumentNumber(document.getDocumentNumber());
+                    // Retrieve the asset payment from the distribution map. It's possible not to find an entry because,
+                    // for example, AssetDistributionManual.findExistingMap will merge some line items. Skip in that
+                    // scenario
+                    Map<AssetPaymentAssetDetail, KualiDecimal> assetPaymentDistributionMapElement = assetPaymentDistributionMap.get(assetPaymentDetail.getAssetPaymentDetailKey());
+                    if (ObjectUtils.isNotNull(assetPaymentDistributionMapElement)) {
+                        KualiDecimal amount = assetPaymentDistributionMapElement.get(assetPaymentAssetDetail);
+
+                        AssetPayment assetPayment = createAssetPayment(document.getDocumentNumber(), ++maxSequenceNo, assetPaymentAssetDetail.getCapitalAssetNumber(), assetPaymentDetail, amount);
+                        totalAmount = totalAmount.add(amount);
+
+                        // add new payment
+                        assetPayments.add(assetPayment);
                     }
-                    assetPayment.setAccountChargeAmount(amount);
-
-                    KualiDecimal baseAmount = KualiDecimal.ZERO;
-
-                    // If the object sub type is not in the list of federally owned object sub types, then...
-                    ObjectCode objectCode = this.getObjectCodeService().getByPrimaryId(assetPaymentDetail.getPostingYear(), assetPaymentDetail.getChartOfAccountsCode(), assetPaymentDetail.getFinancialObjectCode());
-
-                    // Depreciation Base Amount will be assigned to each payment only when the object code's sub type code is not a
-                    // federally owned one
-                    if (!this.isNonDepreciableFederallyOwnedObjSubType(objectCode.getFinancialObjectSubTypeCode())) {
-                        baseAmount = baseAmount.add(amount);
-                    }
-                    assetPayment.setPrimaryDepreciationBaseAmount(baseAmount);
-
-                    // Resetting each period field its value with nulls
-                    this.adjustPaymentAmounts(assetPayment, false, true);
-
-                    // add new payment
-                    assetPayments.add(assetPayment);
                 }
                 // *********************BEGIN - Updating Asset ***********************************************************
                 // Retrieving the asset that will have its cost updated
@@ -233,6 +216,32 @@ public class AssetPaymentServiceImpl implements AssetPaymentService {
         this.getBusinessObjectService().save(assetPayments);
     }
 
+    protected AssetPayment createAssetPayment(String documentNumber, Integer maxSequenceNo, Long capitalAssetNumber, AssetPaymentDetail assetPaymentDetail, KualiDecimal amount) throws IllegalAccessException, InvocationTargetException {
+        AssetPayment assetPayment = new AssetPayment(assetPaymentDetail);
+        assetPayment.setCapitalAssetNumber(capitalAssetNumber);
+        assetPayment.setTransferPaymentCode(CamsConstants.AssetPayment.TRANSFER_PAYMENT_CODE_N);
+        assetPayment.setPaymentSequenceNumber(maxSequenceNo);
+        if (StringUtils.isBlank(assetPayment.getDocumentNumber())) {
+            assetPayment.setDocumentNumber(documentNumber);
+        }
+        assetPayment.setAccountChargeAmount(amount);
+
+        KualiDecimal baseAmount = KualiDecimal.ZERO;
+
+        // If the object sub type is not in the list of federally owned object sub types, then...
+        ObjectCode objectCode = this.getObjectCodeService().getByPrimaryId(assetPaymentDetail.getPostingYear(), assetPaymentDetail.getChartOfAccountsCode(), assetPaymentDetail.getFinancialObjectCode());
+
+        // Depreciation Base Amount will be assigned to each payment only when the object code's sub type code is not a
+        // federally owned one
+        if (!this.isNonDepreciableFederallyOwnedObjSubType(objectCode.getFinancialObjectSubTypeCode())) {
+            baseAmount = baseAmount.add(amount);
+        }
+        assetPayment.setPrimaryDepreciationBaseAmount(baseAmount);
+
+        // Resetting each period field its value with nulls
+        this.adjustPaymentAmounts(assetPayment, false, true);
+        return assetPayment;
+    }
 
     /**
      * @see org.kuali.kfs.module.cam.document.service.AssetPaymentService#adjustPaymentAmounts(org.kuali.kfs.module.cam.businessobject.AssetPayment,
```
---
*File #15*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetServiceImpl.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetServiceImpl.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetServiceImpl.java
index 3d533c1c61..e9e336f7a4 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetServiceImpl.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/service/impl/AssetServiceImpl.java
@@ -23,15 +23,12 @@ import org.kuali.kfs.coa.businessobject.ObjectCode;
 import org.kuali.kfs.coa.service.ObjectCodeService;
 import org.kuali.kfs.coreservice.framework.parameter.ParameterService;
 import org.kuali.kfs.kns.document.MaintenanceDocument;
-import org.kuali.kfs.krad.bo.Note;
 import org.kuali.kfs.krad.document.Document;
-import org.kuali.kfs.krad.document.DocumentBase;
 import org.kuali.kfs.krad.exception.ValidationException;
 import org.kuali.kfs.krad.service.BusinessObjectService;
 import org.kuali.kfs.krad.service.NoteService;
 import org.kuali.kfs.krad.util.ObjectUtils;
 import org.kuali.kfs.module.cam.CamsConstants;
-import org.kuali.kfs.module.cam.CamsKeyConstants;
 import org.kuali.kfs.module.cam.CamsPropertyConstants;
 import org.kuali.kfs.module.cam.businessobject.Asset;
 import org.kuali.kfs.module.cam.businessobject.AssetGlobal;
@@ -42,7 +39,6 @@ import org.kuali.kfs.module.cam.businessobject.AssetPayment;
 import org.kuali.kfs.module.cam.businessobject.AssetType;
 import org.kuali.kfs.module.cam.document.service.AssetService;
 import org.kuali.kfs.module.cam.document.service.PaymentSummaryService;
-import org.kuali.kfs.sys.KFSConstants;
 import org.kuali.kfs.sys.KFSConstants.DocumentStatusCodes;
 import org.kuali.kfs.sys.KFSPropertyConstants;
 import org.kuali.kfs.sys.businessobject.UniversityDate;
@@ -50,10 +46,8 @@ import org.kuali.kfs.sys.context.SpringContext;
 import org.kuali.kfs.sys.service.UniversityDateService;
 import org.kuali.rice.core.api.config.property.ConfigurationService;
 import org.kuali.rice.kew.api.WorkflowDocument;
-import org.kuali.rice.kim.api.identity.Person;
 import org.kuali.rice.kim.api.identity.PersonService;
 
-import java.text.MessageFormat;
 import java.util.ArrayList;
 import java.util.Arrays;
 import java.util.Collection;
@@ -67,12 +61,9 @@ public class AssetServiceImpl implements AssetService {
     protected static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(AssetServiceImpl.class);
 
     protected BusinessObjectService businessObjectService;
-    protected ConfigurationService configurationService;
-    protected NoteService noteService;
     protected ObjectCodeService objectCodeService;
     protected ParameterService parameterService;
     protected PaymentSummaryService paymentSummaryService;
-    protected PersonService personService;
 
     public boolean isAssetMovableCheckByAsset(Asset asset) {
         asset.refreshReferenceObject(CamsPropertyConstants.Asset.CAPITAL_ASSET_TYPE);
@@ -383,28 +374,6 @@ public class AssetServiceImpl implements AssetService {
             !StringUtils.equalsIgnoreCase(oldOffCampusLocation.getAssetLocationCountryCode(), newOffCampusLocation.getAssetLocationCountryCode()));
     }
 
-    public void addAssetInactiveNote(DocumentBase documentBase, Long capitalAssetNumber) {
-        List<Long> assets = new ArrayList();
-        assets.add(capitalAssetNumber);
-
-        addAssetInactiveNote(documentBase, assets);
-    }
-
-    public void addAssetInactiveNote(DocumentBase documentBase, List<Long> assets) {
-        String noteTextPattern = configurationService.getPropertyValueAsString(CamsKeyConstants.NOTE_LIST_OF_INACTIVE_ASSETS);
-        String noteText = MessageFormat.format(noteTextPattern, String.join(", ", assets.toString()));
-
-        Note note = new Note();
-        note.setNotePostedTimestampToCurrent();
-        note.setNoteText(noteText);
-        note.setNoteTypeCode(documentBase.getNoteType().getCode());
-        Person systemUser = personService.getPersonByPrincipalName(KFSConstants.SYSTEM_USER);
-        note = noteService.createNote(note, documentBase.getNoteTarget(), systemUser.getPrincipalId());
-        documentBase.addNote(note);
-
-        noteService.save(note);
-    }
-
     public BusinessObjectService getBusinessObjectService() {
         return businessObjectService;
     }
@@ -413,14 +382,6 @@ public class AssetServiceImpl implements AssetService {
         this.businessObjectService = businessObjectService;
     }
 
-    public void setConfigurationService(ConfigurationService configurationService) {
-        this.configurationService = configurationService;
-    }
-
-    public void setNoteService(NoteService noteService) {
-        this.noteService = noteService;
-    }
-
     public ObjectCodeService getObjectCodeService() {
         return objectCodeService;
     }
@@ -445,8 +406,4 @@ public class AssetServiceImpl implements AssetService {
         this.paymentSummaryService = paymentSummaryService;
     }
 
-    public void setPersonService(PersonService personService) {
-        this.personService = personService;
-    }
-
 }
```
---
*File #16*

**kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/validation/impl/AssetPaymentAllocationByAmountValidation.java**

```diff
diff --git a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/validation/impl/AssetPaymentAllocationByAmountValidation.java b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/validation/impl/AssetPaymentAllocationByAmountValidation.java
index 43c263384e..a8a0114074 100644
--- a/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/validation/impl/AssetPaymentAllocationByAmountValidation.java
+++ b/kfs-cam/src/main/java/org/kuali/kfs/module/cam/document/validation/impl/AssetPaymentAllocationByAmountValidation.java
@@ -34,7 +34,8 @@ public class AssetPaymentAllocationByAmountValidation extends GenericValidation
 
         AssetPaymentDocument assetPaymentDocument = (AssetPaymentDocument) event.getDocument();
 
-        if (CamsPropertyConstants.AssetPaymentAllocation.ASSET_DISTRIBUTION_BY_AMOUNT_CODE.equals(assetPaymentDocument.getAssetPaymentAllocationTypeCode())) {
+        if (!assetPaymentDocument.isCapitalAssetBuilderOriginIndicator() &&
+            CamsPropertyConstants.AssetPaymentAllocation.ASSET_DISTRIBUTION_BY_AMOUNT_CODE.equals(assetPaymentDocument.getAssetPaymentAllocationTypeCode())) {
             valid &= validateNonZeroAssetByAmountAllocation(assetPaymentDocument);
         }
 
```
---
*File #17*

**kfs-cam/src/main/resources/org/kuali/kfs/module/cam/cam-resources.properties**

```diff
diff --git a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/cam-resources.properties b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/cam-resources.properties
index 10309a4df5..8ceb937831 100644
--- a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/cam-resources.properties
+++ b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/cam-resources.properties
@@ -314,5 +314,3 @@ error.capitalAsset.required.for.purchase.order.sub.type=Capital Assets are being
 error.capitalAsset.required.for.purchase.order.sub.type.update = Capital Assets are being purchased - the information in the Capital Asset tab must be completed. Use the update view button to add or remove line items from the Capital Asset Tab. Use the change button, when you need to change the Capital Asset System Type or the Capital Asset System State. 
 error.capitalAsset.duplicate.asset=The same asset number may not be entered more than once.
 error.capitalAsset.not.allowed.system.type=Capital Asset System Type of {0} is not allowed with Capital Asset System State of {1}.
-
-note.list.of.inactive.assets=This document was routed to Organization Inactive route node because at the time the document was submitted the following asset(s) had an inactive organization assigned to Organization Owner: {0}.
```
---
*File #18*

**kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/next-release.xml**

```diff
diff --git a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/next-release.xml b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/next-release.xml
index bef158e89d..5404aa0b38 100644
--- a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/next-release.xml
+++ b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/cam/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/cam/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #19*

**kfs-cg/pom.xml**

```diff
diff --git a/kfs-cg/pom.xml b/kfs-cg/pom.xml
index 37cd4c39bd..0f86fb8b30 100644
--- a/kfs-cg/pom.xml
+++ b/kfs-cg/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #20*

**kfs-cg/src/main/resources/org/kuali/kfs/module/cg/db/phase5/next-release.xml**

```diff
diff --git a/kfs-cg/src/main/resources/org/kuali/kfs/module/cg/db/phase5/next-release.xml b/kfs-cg/src/main/resources/org/kuali/kfs/module/cg/db/phase5/next-release.xml
index 2b106c88b7..417b8abe68 100644
--- a/kfs-cg/src/main/resources/org/kuali/kfs/module/cg/db/phase5/next-release.xml
+++ b/kfs-cg/src/main/resources/org/kuali/kfs/module/cg/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/cg/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/cg/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #21*

**kfs-core/pom.xml**

```diff
diff --git a/kfs-core/pom.xml b/kfs-core/pom.xml
index 02724e41ab..428321eca4 100644
--- a/kfs-core/pom.xml
+++ b/kfs-core/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #22*

**kfs-core/src/main/java/org/kuali/kfs/coa/service/impl/OrganizationServiceImpl.java**

```diff
diff --git a/kfs-core/src/main/java/org/kuali/kfs/coa/service/impl/OrganizationServiceImpl.java b/kfs-core/src/main/java/org/kuali/kfs/coa/service/impl/OrganizationServiceImpl.java
index c725563345..f5503a32f2 100644
--- a/kfs-core/src/main/java/org/kuali/kfs/coa/service/impl/OrganizationServiceImpl.java
+++ b/kfs-core/src/main/java/org/kuali/kfs/coa/service/impl/OrganizationServiceImpl.java
@@ -180,7 +180,7 @@ public class OrganizationServiceImpl implements OrganizationService {
             return true;
         }
 
-        return isParentOrganization_Internal(currOrg, desiredParentOrg, new ArrayList<ChartOrgHolderImpl>());
+        return isParentOrganization_Internal(parentOrgCache, currOrg, desiredParentOrg, new ArrayList<ChartOrgHolderImpl>());
     }
 
     @Override
@@ -204,20 +204,20 @@ public class OrganizationServiceImpl implements OrganizationService {
             return true;
         }
 
-        return isParentOrganization_Internal(currOrg, desiredParentOrg, new ArrayList<ChartOrgHolderImpl>());
+        return isParentOrganization_Internal(allParentOrgCache, currOrg, desiredParentOrg, new ArrayList<ChartOrgHolderImpl>());
     }
 
     /**
      * This helper method handles the case where there might be cycles in the data.
      */
-    protected boolean isParentOrganization_Internal(ChartOrgHolderImpl currOrg, ChartOrgHolderImpl desiredParentOrg, List<ChartOrgHolderImpl> traversedOrgs) {
+    protected boolean isParentOrganization_Internal(Map<ChartOrgHolderImpl, ChartOrgHolderImpl> cache, ChartOrgHolderImpl currOrg, ChartOrgHolderImpl desiredParentOrg, List<ChartOrgHolderImpl> traversedOrgs) {
 
         if (traversedOrgs.contains(currOrg)) {
             LOG.error("THERE IS A LOOP IN THE ORG DATA: " + currOrg + " found a second time after traversing the following orgs: " + traversedOrgs);
             return false;
         }
 
-        ChartOrgHolderImpl parentOrg = parentOrgCache.get(currOrg);
+        ChartOrgHolderImpl parentOrg = cache.get(currOrg);
 
         // we could not find it in the table, return false
         if (parentOrg == null) {
@@ -233,7 +233,7 @@ public class OrganizationServiceImpl implements OrganizationService {
         }
         // otherwise, we don't know yet - so re-call this method moving up to the next parent org
         traversedOrgs.add(currOrg);
-        return isParentOrganization_Internal(parentOrg, desiredParentOrg, traversedOrgs);
+        return isParentOrganization_Internal(cache, parentOrg, desiredParentOrg, traversedOrgs);
     }
 
     /**
```
---
*File #23*

**kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/next-release.xml**

```diff
diff --git a/kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/next-release.xml b/kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/next-release.xml
index 3591143217..0aceec1c3d 100644
--- a/kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/next-release.xml
+++ b/kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.4.xsd" logicalFilePath="org/kuali/kfs/core/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.4.xsd" logicalFilePath="org/kuali/kfs/core/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #24*

**kfs-core/src/main/resources/org/kuali/rice/db/phase5/next-release.xml**

```diff
diff --git a/kfs-core/src/main/resources/org/kuali/rice/db/phase5/next-release.xml b/kfs-core/src/main/resources/org/kuali/rice/db/phase5/next-release.xml
index c36bc18262..0dc4e2fe76 100644
--- a/kfs-core/src/main/resources/org/kuali/rice/db/phase5/next-release.xml
+++ b/kfs-core/src/main/resources/org/kuali/rice/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/rice/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/rice/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #25*

**kfs-datatools/pom.xml**

```diff
diff --git a/kfs-datatools/pom.xml b/kfs-datatools/pom.xml
index 51cb3a87f0..4e49d769cf 100644
--- a/kfs-datatools/pom.xml
+++ b/kfs-datatools/pom.xml
@@ -24,7 +24,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #26*

**kfs-ec/pom.xml**

```diff
diff --git a/kfs-ec/pom.xml b/kfs-ec/pom.xml
index c43949d3cd..59744ac27f 100644
--- a/kfs-ec/pom.xml
+++ b/kfs-ec/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #27*

**kfs-ec/src/main/resources/org/kuali/kfs/module/ec/db/phase5/next-release.xml**

```diff
diff --git a/kfs-ec/src/main/resources/org/kuali/kfs/module/ec/db/phase5/next-release.xml b/kfs-ec/src/main/resources/org/kuali/kfs/module/ec/db/phase5/next-release.xml
index dd3270c19a..eb83d644ab 100644
--- a/kfs-ec/src/main/resources/org/kuali/kfs/module/ec/db/phase5/next-release.xml
+++ b/kfs-ec/src/main/resources/org/kuali/kfs/module/ec/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/ec/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/ec/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #28*

**kfs-kc/pom.xml**

```diff
diff --git a/kfs-kc/pom.xml b/kfs-kc/pom.xml
index 51953503d2..905adbe1de 100644
--- a/kfs-kc/pom.xml
+++ b/kfs-kc/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #29*

**kfs-kc/src/main/resources/org/kuali/kfs/module/kc/db/phase5/next-release.xml**

```diff
diff --git a/kfs-kc/src/main/resources/org/kuali/kfs/module/kc/db/phase5/next-release.xml b/kfs-kc/src/main/resources/org/kuali/kfs/module/kc/db/phase5/next-release.xml
index cbc8daf4f7..cbad8901d2 100644
--- a/kfs-kc/src/main/resources/org/kuali/kfs/module/kc/db/phase5/next-release.xml
+++ b/kfs-kc/src/main/resources/org/kuali/kfs/module/kc/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/kc/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/kc/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #30*

**kfs-kns/pom.xml**

```diff
diff --git a/kfs-kns/pom.xml b/kfs-kns/pom.xml
index 4f01c6eb53..20df5bdd97 100644
--- a/kfs-kns/pom.xml
+++ b/kfs-kns/pom.xml
@@ -24,7 +24,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #31*

**kfs-kns/src/main/java/org/kuali/kfs/kns/inquiry/KualiInquirableImpl.java**

```diff
diff --git a/kfs-kns/src/main/java/org/kuali/kfs/kns/inquiry/KualiInquirableImpl.java b/kfs-kns/src/main/java/org/kuali/kfs/kns/inquiry/KualiInquirableImpl.java
index 243640a356..93eb284547 100644
--- a/kfs-kns/src/main/java/org/kuali/kfs/kns/inquiry/KualiInquirableImpl.java
+++ b/kfs-kns/src/main/java/org/kuali/kfs/kns/inquiry/KualiInquirableImpl.java
@@ -50,6 +50,7 @@ import org.kuali.kfs.krad.service.PersistenceStructureService;
 import org.kuali.kfs.krad.util.ExternalizableBusinessObjectUtils;
 import org.kuali.kfs.krad.util.GlobalVariables;
 import org.kuali.kfs.krad.util.KRADConstants;
+import org.kuali.kfs.krad.util.KRADPropertyConstants;
 import org.kuali.kfs.krad.util.ObjectUtils;
 import org.kuali.kfs.krad.util.UrlFactory;
 import org.kuali.rice.core.api.CoreApiServiceLocator;
@@ -363,6 +364,12 @@ public class KualiInquirableImpl extends InquirableImpl implements Inquirable {
                     }
                 }
             }
+
+            // Version our inquiries to support IE caching. It doesn't recognize updates to BOs without this
+            if (getPersistenceStructureService().listFieldNames(businessObject.getClass()).contains(KRADPropertyConstants.VERSION_NUMBER)) {
+                keys.add(KRADPropertyConstants.VERSION_NUMBER);
+            }
+
             // build key value url parameters used to retrieve the business object
             String keyName = null;
             String keyConversion = null;
```
---
*File #32*

**kfs-kns/src/main/java/org/kuali/kfs/krad/dao/impl/LookupDaoOjb.java**

```diff
diff --git a/kfs-kns/src/main/java/org/kuali/kfs/krad/dao/impl/LookupDaoOjb.java b/kfs-kns/src/main/java/org/kuali/kfs/krad/dao/impl/LookupDaoOjb.java
index ad094db557..1e7da00f56 100644
--- a/kfs-kns/src/main/java/org/kuali/kfs/krad/dao/impl/LookupDaoOjb.java
+++ b/kfs-kns/src/main/java/org/kuali/kfs/krad/dao/impl/LookupDaoOjb.java
@@ -617,24 +617,36 @@ public class LookupDaoOjb extends PlatformAwareDaoBaseOjb implements LookupDao,
         } else if (propertyValue.startsWith(SearchOperator.GREATER_THAN_EQUAL.op())) {
             if (treatWildcardsAndOperatorsAsLiteral)
                 throw new RuntimeException("Cannot use wildcards and operators on numeric field " + propertyName);
-            criteria.addGreaterOrEqualThan(propertyName, cleanNumeric(propertyValue));
+            criteria.addGreaterOrEqualThan(propertyName, cleanNumeric(stripNumericRangeOperator(propertyValue, SearchOperator.GREATER_THAN_EQUAL)));
         } else if (propertyValue.startsWith(SearchOperator.LESS_THAN_EQUAL.op())) {
             if (treatWildcardsAndOperatorsAsLiteral)
                 throw new RuntimeException("Cannot use wildcards and operators on numeric field " + propertyName);
-            criteria.addLessOrEqualThan(propertyName, cleanNumeric(propertyValue));
+            criteria.addLessOrEqualThan(propertyName, cleanNumeric(stripNumericRangeOperator(propertyValue, SearchOperator.LESS_THAN_EQUAL)));
         } else if (propertyValue.startsWith(SearchOperator.GREATER_THAN.op())) {
             if (treatWildcardsAndOperatorsAsLiteral)
                 throw new RuntimeException("Cannot use wildcards and operators on numeric field " + propertyName);
-            criteria.addGreaterThan(propertyName, cleanNumeric(propertyValue));
+            criteria.addGreaterThan(propertyName, cleanNumeric(stripNumericRangeOperator(propertyValue, SearchOperator.GREATER_THAN)));
         } else if (propertyValue.startsWith(SearchOperator.LESS_THAN.op())) {
             if (treatWildcardsAndOperatorsAsLiteral)
                 throw new RuntimeException("Cannot use wildcards and operators on numeric field " + propertyName);
-            criteria.addLessThan(propertyName, cleanNumeric(propertyValue));
+            criteria.addLessThan(propertyName, cleanNumeric(stripNumericRangeOperator(propertyValue, SearchOperator.LESS_THAN)));
         } else {
             criteria.addEqualTo(propertyName, cleanNumeric(propertyValue));
         }
     }
 
+    /**
+     * Strip the operator from the value
+     *
+     * @param propertyValue
+     * @param operator
+     * @return
+     */
+    protected String stripNumericRangeOperator(String propertyValue, SearchOperator operator) {
+        String propertyValueWithoutOperator = StringUtils.replace(propertyValue, operator.op(), org.kuali.kfs.krad.util.KRADConstants.EMPTY_STRING);
+        return propertyValueWithoutOperator;
+    }
+
     /**
      * Adds to the criteria object based on query characters given
      */
```
---
*File #33*

**kfs-kns/src/main/java/org/kuali/kfs/krad/maintenance/MaintenanceDocumentBase.java**

```diff
diff --git a/kfs-kns/src/main/java/org/kuali/kfs/krad/maintenance/MaintenanceDocumentBase.java b/kfs-kns/src/main/java/org/kuali/kfs/krad/maintenance/MaintenanceDocumentBase.java
index 2707a80ef4..8a73b51d18 100644
--- a/kfs-kns/src/main/java/org/kuali/kfs/krad/maintenance/MaintenanceDocumentBase.java
+++ b/kfs-kns/src/main/java/org/kuali/kfs/krad/maintenance/MaintenanceDocumentBase.java
@@ -359,9 +359,15 @@ public class MaintenanceDocumentBase extends DocumentBase implements Maintenance
         if (StringUtils.isBlank(notesXml)) {
             return Collections.emptyList();
         }
-        List<Note> notes = (List<Note>) KRADServiceLocator.getXmlObjectSerializerService().fromXml(notesXml);
-        if (notes == null) {
-            return Collections.emptyList();
+        List<Note> notes;
+        try {
+            notes = (List<Note>) KRADServiceLocator.getXmlObjectSerializerService().fromXml(notesXml);
+            if (notes == null) {
+                return Collections.emptyList();
+            }
+        } catch (BaseException e) {
+            String convertedXml = KRADServiceLocatorWeb.getMaintainableXMLConversionService().transformMaintainableNoteXML(notesXml);
+            return (List<Note>) KRADServiceLocator.getXmlObjectSerializerService().fromXml(convertedXml);
         }
         return notes;
     }
```
---
*File #34*

**kfs-kns/src/main/java/org/kuali/kfs/krad/service/impl/MaintainableXMLConversionServiceImpl.java**

```diff
diff --git a/kfs-kns/src/main/java/org/kuali/kfs/krad/service/impl/MaintainableXMLConversionServiceImpl.java b/kfs-kns/src/main/java/org/kuali/kfs/krad/service/impl/MaintainableXMLConversionServiceImpl.java
index 616aafc171..b9ce96fc44 100644
--- a/kfs-kns/src/main/java/org/kuali/kfs/krad/service/impl/MaintainableXMLConversionServiceImpl.java
+++ b/kfs-kns/src/main/java/org/kuali/kfs/krad/service/impl/MaintainableXMLConversionServiceImpl.java
@@ -78,7 +78,6 @@ public class MaintainableXMLConversionServiceImpl implements MaintainableXMLConv
     protected static final String DEFINED_IN_ATTRIBUTE = "defined-in";
     protected static final String MAINTENANCE_ACTION_ELEMENT_NAME = "maintenanceAction";
 
-
     protected Map<String, String> classNameRuleMap;
     protected Map<String, Map<String, String>> classPropertyRuleMap;
     protected Set<String> classRemovals;
@@ -93,6 +92,17 @@ public class MaintainableXMLConversionServiceImpl implements MaintainableXMLConv
     public String transformMaintainableXML(String xml) {
         String maintenanceAction = "<" + MAINTENANCE_ACTION_ELEMENT_NAME + ">" + StringUtils.substringAfter(xml, "<" + MAINTENANCE_ACTION_ELEMENT_NAME + ">");
         xml = StringUtils.substringBefore(xml, "<" + MAINTENANCE_ACTION_ELEMENT_NAME + ">");
+        xml = transformXML(xml);
+        return xml + maintenanceAction;
+    }
+
+    @Override
+    public String transformMaintainableNoteXML(String xml) {
+        xml = transformXML(xml);
+        return xml;
+    }
+
+    protected String transformXML(String xml) {
         if (!CollectionUtils.isEmpty(getConversionRuleFiles())) {
             try {
                 DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
@@ -119,7 +129,7 @@ public class MaintainableXMLConversionServiceImpl implements MaintainableXMLConv
                 throw new RuntimeException(e);
             }
         }
-        return xml + maintenanceAction;
+        return xml;
     }
 
     public List<String> getConversionRuleFiles() {
```
---
*File #35*

**kfs-kns/src/main/java/org/kuali/kfs/krad/service/MaintainableXMLConversionService.java**

```diff
diff --git a/kfs-kns/src/main/java/org/kuali/kfs/krad/service/MaintainableXMLConversionService.java b/kfs-kns/src/main/java/org/kuali/kfs/krad/service/MaintainableXMLConversionService.java
index 2f415e1eb8..f7d77de88e 100644
--- a/kfs-kns/src/main/java/org/kuali/kfs/krad/service/MaintainableXMLConversionService.java
+++ b/kfs-kns/src/main/java/org/kuali/kfs/krad/service/MaintainableXMLConversionService.java
@@ -21,4 +21,6 @@ package org.kuali.kfs.krad.service;
 public interface MaintainableXMLConversionService {
 
     String transformMaintainableXML(String xml);
+
+    String transformMaintainableNoteXML(String xml);
 }
```
---
*File #36*

**kfs-ld/pom.xml**

```diff
diff --git a/kfs-ld/pom.xml b/kfs-ld/pom.xml
index 5f2fc5c3be..d302887530 100644
--- a/kfs-ld/pom.xml
+++ b/kfs-ld/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #37*

**kfs-ld/src/main/resources/org/kuali/kfs/module/ld/db/phase5/next-release.xml**

```diff
diff --git a/kfs-ld/src/main/resources/org/kuali/kfs/module/ld/db/phase5/next-release.xml b/kfs-ld/src/main/resources/org/kuali/kfs/module/ld/db/phase5/next-release.xml
index 0c0ffa59cf..7bf65df5c0 100644
--- a/kfs-ld/src/main/resources/org/kuali/kfs/module/ld/db/phase5/next-release.xml
+++ b/kfs-ld/src/main/resources/org/kuali/kfs/module/ld/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/ld/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/ld/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #38*

**kfs-purap/pom.xml**

```diff
diff --git a/kfs-purap/pom.xml b/kfs-purap/pom.xml
index 62ef01fe38..a1ba863c7a 100644
--- a/kfs-purap/pom.xml
+++ b/kfs-purap/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #39*

**kfs-purap/src/main/resources/org/kuali/kfs/module/purap/db/phase5/next-release.xml**

```diff
diff --git a/kfs-purap/src/main/resources/org/kuali/kfs/module/purap/db/phase5/next-release.xml b/kfs-purap/src/main/resources/org/kuali/kfs/module/purap/db/phase5/next-release.xml
index 49dfac6c9d..cd6b5be55b 100644
--- a/kfs-purap/src/main/resources/org/kuali/kfs/module/purap/db/phase5/next-release.xml
+++ b/kfs-purap/src/main/resources/org/kuali/kfs/module/purap/db/phase5/next-release.xml
@@ -19,4 +19,4 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 -->
-<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/purap/db/phase5/post-rel-2017-10-19.xml"/>
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/purap/db/phase5/post-rel-2017-11-02.xml"/>
```
---
*File #40*

**kfs-web/pom.xml**

```diff
diff --git a/kfs-web/pom.xml b/kfs-web/pom.xml
index d7f1191800..09008e4524 100644
--- a/kfs-web/pom.xml
+++ b/kfs-web/pom.xml
@@ -25,7 +25,7 @@
     <parent>
         <artifactId>kfs</artifactId>
         <groupId>org.kuali.kfs</groupId>
-        <version>2017-10-19</version>
+        <version>2017-11-02</version>
     </parent>
     <modelVersion>4.0.0</modelVersion>
 
```
---
*File #41*

**kfs-web/src/main/webapp/css/newPortal.css**

```diff
diff --git a/kfs-web/src/main/webapp/css/newPortal.css b/kfs-web/src/main/webapp/css/newPortal.css
index 55f4abe5ed..f5ddba2b84 100644
--- a/kfs-web/src/main/webapp/css/newPortal.css
+++ b/kfs-web/src/main/webapp/css/newPortal.css
@@ -109,6 +109,10 @@ div.fineprint {
     font-size: 11px;
 }
 
+div.fineprint.maxwidth {
+    max-width: 70px;
+}
+
 header.navbar {
     height: 60px;
     box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
```
---
*File #42*

**kfs-web/src/main/webapp/package.json**

```diff
diff --git a/kfs-web/src/main/webapp/package.json b/kfs-web/src/main/webapp/package.json
index 74b7b0ceb4..d3d771c0cc 100644
--- a/kfs-web/src/main/webapp/package.json
+++ b/kfs-web/src/main/webapp/package.json
@@ -14,7 +14,7 @@
     "url": "https://github.com/KualiCo/financials.git"
   },
   "dependencies": {
-    "auditjs": "^2.2.2",
+    "auditjs": "^2.2.6",
     "babel-core": "6.26",
     "babel-loader": "6.2.4",
     "babel-preset-es2015": "6.6.0",
```
---
*File #43*

**kfs-web/src/main/webapp/package-lock.json**

```diff
diff --git a/kfs-web/src/main/webapp/package-lock.json b/kfs-web/src/main/webapp/package-lock.json
index f7607aab8b..07ae90f17a 100644
--- a/kfs-web/src/main/webapp/package-lock.json
+++ b/kfs-web/src/main/webapp/package-lock.json
@@ -4,10 +4,15 @@
   "lockfileVersion": 1,
   "requires": true,
   "dependencies": {
+    "async": {
+      "version": "1.0.0",
+      "resolved": "https://registry.npmjs.org/async/-/async-1.0.0.tgz",
+      "integrity": "sha1-+PwEyjoTeErenhZBr5hXjPvWR6k="
+    },
     "auditjs": {
-      "version": "2.2.2",
-      "resolved": "https://registry.npmjs.org/auditjs/-/auditjs-2.2.2.tgz",
-      "integrity": "sha1-J6MsOP2BhSQa4i83wVSlbKgzPic=",
+      "version": "2.2.6",
+      "resolved": "https://registry.npmjs.org/auditjs/-/auditjs-2.2.6.tgz",
+      "integrity": "sha1-9uIs64GiWMwRXhF0cjGR/uBPVe4=",
       "requires": {
         "colors": "1.1.2",
         "commander": "2.11.0",
@@ -17,6 +22,7 @@
         "npm": "4.6.1",
         "ossindexjs": "2.0.0",
         "semver": "5.4.1",
+        "winston": "2.4.0",
         "xmldom": "0.1.27"
       },
       "dependencies": {
@@ -1579,6 +1585,11 @@
       "resolved": "https://registry.npmjs.org/commander/-/commander-2.11.0.tgz",
       "integrity": "sha512-b0553uYA5YAEGgyYIGYROzKQ7X5RAqedkfjiZxwi0kL1g3bOaBNNZfYkzt/CL0umgD5wc9Jec2FbB98CjkMRvQ=="
     },
+    "cycle": {
+      "version": "1.0.3",
+      "resolved": "https://registry.npmjs.org/cycle/-/cycle-1.0.3.tgz",
+      "integrity": "sha1-IegLK+hYD5i0aPN5QwZisEbDStI="
+    },
     "debug": {
       "version": "2.2.0",
       "resolved": "https://registry.npmjs.org/debug/-/debug-2.2.0.tgz",
@@ -1587,6 +1598,11 @@
         "ms": "0.7.1"
       }
     },
+    "eyes": {
+      "version": "0.1.8",
+      "resolved": "https://registry.npmjs.org/eyes/-/eyes-0.1.8.tgz",
+      "integrity": "sha1-Ys8SAjTGg3hdkCNIqADvPgzCC8A="
+    },
     "html-entities": {
       "version": "1.2.1",
       "resolved": "https://registry.npmjs.org/html-entities/-/html-entities-1.2.1.tgz",
@@ -1597,6 +1613,11 @@
       "resolved": "https://registry.npmjs.org/immutable/-/immutable-3.7.5.tgz",
       "integrity": "sha1-VX0D5cKtuXn0ze5JRUQ0wJw2EOQ="
     },
+    "isstream": {
+      "version": "0.1.2",
+      "resolved": "https://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz",
+      "integrity": "sha1-R+Y/evVa+m+S4VAOaQ64uFKcCZo="
+    },
     "js-cookie": {
       "version": "2.1.2",
       "resolved": "https://registry.npmjs.org/js-cookie/-/js-cookie-2.1.2.tgz",
@@ -3833,7 +3854,7 @@
             "iconv-lite": "0.4.19",
             "mkdirp": "0.5.1",
             "private": "0.1.8",
-            "q": "1.5.0",
+            "q": "1.5.1",
             "recast": "0.11.23"
           }
         },
@@ -4001,9 +4022,9 @@
           }
         },
         "q": {
-          "version": "1.5.0",
-          "resolved": "https://registry.npmjs.org/q/-/q-1.5.0.tgz",
-          "integrity": "sha1-3QG6ydBtMObyGa7LglPunr3DCPE="
+          "version": "1.5.1",
+          "resolved": "https://registry.npmjs.org/q/-/q-1.5.1.tgz",
+          "integrity": "sha1-fjL3W0E4EpHQRhHxvxQQmsAGUdc="
         },
         "recast": {
           "version": "0.11.23",
@@ -4158,6 +4179,11 @@
       "resolved": "https://registry.npmjs.org/semver/-/semver-5.4.1.tgz",
       "integrity": "sha512-WfG/X9+oATh81XtllIo/I8gOiY9EXRdv1cQdyykeXK17YcUW3EXUAi2To4pcH6nZtJPr7ZOpM5OMyWJZm+8Rsg=="
     },
+    "stack-trace": {
+      "version": "0.0.10",
+      "resolved": "https://registry.npmjs.org/stack-trace/-/stack-trace-0.0.10.tgz",
+      "integrity": "sha1-VHxws0fo0ytOEI6hoqFZ5f3eGcA="
+    },
     "url": {
       "version": "0.10.3",
       "resolved": "https://registry.npmjs.org/url/-/url-0.10.3.tgz",
@@ -5055,9 +5081,9 @@
           }
         },
         "is-buffer": {
-          "version": "1.1.5",
-          "resolved": "https://registry.npmjs.org/is-buffer/-/is-buffer-1.1.5.tgz",
-          "integrity": "sha1-Hzsm72E7IUuIy8ojzGwB2Hlh7sw="
+          "version": "1.1.6",
+          "resolved": "https://registry.npmjs.org/is-buffer/-/is-buffer-1.1.6.tgz",
+          "integrity": "sha512-NcdALwpXkTm5Zvvbk7owOUSvVvBKDgKP5/ewfXEznmQFfs4ZRmanOeKBTjRVjka3QFoN6XJ+9F3USqfHqTaU5w=="
         },
         "is-dotfile": {
           "version": "1.0.3",
@@ -5131,7 +5157,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "1.1.5"
+            "is-buffer": "1.1.6"
           }
         },
         "lazy-cache": {
@@ -5382,7 +5408,7 @@
                   "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
                   "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
                   "requires": {
-                    "is-buffer": "1.1.5"
+                    "is-buffer": "1.1.6"
                   }
                 }
               }
@@ -5392,7 +5418,7 @@
               "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-4.0.0.tgz",
               "integrity": "sha1-IIE989cSkosgc3hpGkUGb65y3Vc=",
               "requires": {
-                "is-buffer": "1.1.5"
+                "is-buffer": "1.1.6"
               }
             }
           }
@@ -5659,6 +5685,26 @@
         }
       }
     },
+    "winston": {
+      "version": "2.4.0",
+      "resolved": "https://registry.npmjs.org/winston/-/winston-2.4.0.tgz",
+      "integrity": "sha1-gIBQuT1SZh7Z+2wms/DIJnCLCu4=",
+      "requires": {
+        "async": "1.0.0",
+        "colors": "1.0.3",
+        "cycle": "1.0.3",
+        "eyes": "0.1.8",
+        "isstream": "0.1.2",
+        "stack-trace": "0.0.10"
+      },
+      "dependencies": {
+        "colors": {
+          "version": "1.0.3",
+          "resolved": "https://registry.npmjs.org/colors/-/colors-1.0.3.tgz",
+          "integrity": "sha1-BDP0TYCWgP3rYO0mDxsMJi6CpAs="
+        }
+      }
+    },
     "xml2js": {
       "version": "0.4.19",
       "resolved": "https://registry.npmjs.org/xml2js/-/xml2js-0.4.19.tgz",
```
---
*File #44*

**kfs-web/src/main/webapp/WEB-INF/tags/module/cams/assetPaymentsAssetInformation.tag**

```diff
diff --git a/kfs-web/src/main/webapp/WEB-INF/tags/module/cams/assetPaymentsAssetInformation.tag b/kfs-web/src/main/webapp/WEB-INF/tags/module/cams/assetPaymentsAssetInformation.tag
index 9967c10f23..e2d5e5bd4d 100644
--- a/kfs-web/src/main/webapp/WEB-INF/tags/module/cams/assetPaymentsAssetInformation.tag
+++ b/kfs-web/src/main/webapp/WEB-INF/tags/module/cams/assetPaymentsAssetInformation.tag
@@ -69,7 +69,7 @@
                         attributeEntry="${assetAttributes.capitalAssetNumber}" readOnly="true"
                         readOnlyBody="true">
                     <kul:inquiry boClassName="org.kuali.kfs.module.cam.businessobject.Asset"
-                                 keyValues="capitalAssetNumber=${KualiForm.document.assetPaymentAssetDetail[ctr].capitalAssetNumber}"
+                                 keyValues="capitalAssetNumber=${KualiForm.document.assetPaymentAssetDetail[ctr].capitalAssetNumber}&versionNumber=${KualiForm.document.assetPaymentAssetDetail[ctr].asset.versionNumber}"
                                  render="true">
                         <html:hidden write="true"
                                      property="document.assetPaymentAssetDetail[${ctr}].capitalAssetNumber"/>
```
---
*File #45*

**kfs-web/src/main/webapp/WEB-INF/tags/module/cams/viewPaymentInProcessByAsset.tag**

```diff
diff --git a/kfs-web/src/main/webapp/WEB-INF/tags/module/cams/viewPaymentInProcessByAsset.tag b/kfs-web/src/main/webapp/WEB-INF/tags/module/cams/viewPaymentInProcessByAsset.tag
index 20417a97bb..0d34b45c4b 100644
--- a/kfs-web/src/main/webapp/WEB-INF/tags/module/cams/viewPaymentInProcessByAsset.tag
+++ b/kfs-web/src/main/webapp/WEB-INF/tags/module/cams/viewPaymentInProcessByAsset.tag
@@ -90,7 +90,7 @@
                                             attributeEntry="${assetAttributes.capitalAssetNumber}" readOnly="true"
                                             readOnlyBody="true">
                                         <kul:inquiry boClassName="org.kuali.kfs.module.cam.businessobject.Asset"
-                                                     keyValues="capitalAssetNumber=${KualiForm.document.assetPaymentAssetDetail[pos].capitalAssetNumber}"
+                                                     keyValues="capitalAssetNumber=${KualiForm.document.assetPaymentAssetDetail[pos].capitalAssetNumber}&versionNumber=${KualiForm.document.assetPaymentAssetDetail[pos].asset.versionNumber}"
                                                      render="true">
                                             <html:hidden write="true"
                                                          property="document.assetPaymentAssetDetail[${pos}].capitalAssetNumber"/>
```
---
*File #46*

**kfs-web/src/main/webapp/WEB-INF/tags/module/ec/detailLineDataCell.tag**

```diff
diff --git a/kfs-web/src/main/webapp/WEB-INF/tags/module/ec/detailLineDataCell.tag b/kfs-web/src/main/webapp/WEB-INF/tags/module/ec/detailLineDataCell.tag
index 8de6384828..32616d1ea9 100644
--- a/kfs-web/src/main/webapp/WEB-INF/tags/module/ec/detailLineDataCell.tag
+++ b/kfs-web/src/main/webapp/WEB-INF/tags/module/ec/detailLineDataCell.tag
@@ -123,7 +123,7 @@
 	<br/>
 
 	<span class="${styleClass}">
-   		<div id="${divName}" name="${divName}" class="fineprint">${fieldInfo}</div>
+		<div id="${divName}" name="${divName}" class="fineprint maxwidth" title="${fieldInfo}">${fieldInfo}</div>
    	</span>
 
    	<c:if test="${withHiddenForm}">
```
---
*File #47*

**kfs-web/src/main/webapp/WEB-INF/tags/module/purap/taxitems.tag**

```diff
diff --git a/kfs-web/src/main/webapp/WEB-INF/tags/module/purap/taxitems.tag b/kfs-web/src/main/webapp/WEB-INF/tags/module/purap/taxitems.tag
index 0983a167c7..504f5b4f62 100644
--- a/kfs-web/src/main/webapp/WEB-INF/tags/module/purap/taxitems.tag
+++ b/kfs-web/src/main/webapp/WEB-INF/tags/module/purap/taxitems.tag
@@ -55,37 +55,41 @@
 	</c:when>
 </c:choose>
 
-<tr>
-	<td colspan="${mainColumnCount}" class="subhead">
-		<span class="subhead-left"><c:out value="${overrideTitle}" /> &nbsp;</span>
-		<c:if test="${isOpen == 'true' || isOpen == 'TRUE'}">
-			<html:button
-					property="methodToCall.toggleTab.tab${tabKey}"
-					alt="hide"
-					title="toggle"
-					styleClass="btn btn-default small"
-					styleId="tab-${tabKey}-imageToggle"
-					onclick="javascript: return toggleTab(document, '${tabKey}'); "
-					value="Hide"/>
-		</c:if>
-		<c:if test="${isOpen != 'true' && isOpen != 'TRUE'}">
-			<html:button
-					property="methodToCall.toggleTab.tab${tabKey}"
-					alt="show"
-					title="toggle"
-					styleClass="btn btn-default small"
-					styleId="tab-${tabKey}-imageToggle"
-					onclick="javascript: return toggleTab(document, '${tabKey}'); "
-					value="Show"/>
-		</c:if>
-	</td>
-</tr>
-
+<div class="tab-container">
+    <table class="standard side-margins acct-lines" summary="Items Section">
+        <tr class="title">
+            <th></th>
+            <td colspan="${mainColumnCount} }">
+                <h2>
+                <c:out value="${overrideTitle}" /> &nbsp;</span>
+                <c:if test="${isOpen == 'true' || isOpen == 'TRUE'}">
+                        <html:submit
+                                property="methodToCall.toggleTab.tab${tabKey}"
+                                alt="hide"
+                                title="toggle"
+                                styleClass="btn btn-default"
+                                styleId="tab-${tabKey}-imageToggle"
+                                onclick="javascript: return true; "
+                                value="Hide"/>
+                    </c:if>
+                    <c:if test="${isOpen != 'true' && isOpen != 'TRUE'}">
+                        <html:submit
+                                property="methodToCall.toggleTab.tab${tabKey}"
+                                alt="show"
+                                title="toggle"
+                                styleClass="btn btn-default"
+                                styleId="tab-${tabKey}-imageToggle"
+                                onclick="javascript: return true; "
+                                value="Show"/>
+                    </c:if>
+                </h2>
+            </td>
+        </tr>
 <c:if test="${isOpen != 'true' && isOpen != 'TRUE'}">
 	<tbody style="display: none;" id="tab-${tabKey}-div">
 </c:if>
 
-<tr>
+<tr class="header">
 	<kul:htmlAttributeHeaderCell colspan="${colSpanItemType + 4}"
 		attributeEntry="${itemAttributes.itemTypeCode}" />
 	<kul:htmlAttributeHeaderCell colspan="${colSpanExtendedPrice}"
@@ -98,35 +102,39 @@
 <logic:iterate indexId="ctr" name="KualiForm" property="document.items"	id="itemLine">
 	<%-- to ensure order this should pull out items from APC instead of this--%>
 	<c:if test="${itemLine.itemType.isTaxCharge}">
-		<tr>
-			<td colspan="${mainColumnCount}" class="tab-subhead" style="border-right: none;">
-			<kul:htmlControlAttribute
-				attributeEntry="${itemAttributes.itemTypeCode}"
-				property="document.item[${ctr}].itemType.itemTypeDescription"
-				readOnly="true" />
-		</tr>
-		<tr>
-			<td class="infoline right" colspan="${colSpanItemType + 4}">
-				<kul:htmlControlAttribute attributeEntry="${itemAttributes.itemTypeCode}" property="document.item[${ctr}].itemType.itemTypeDescription" readOnly="true" />:&nbsp;
+		<tr class="top line">
+			<td class="infoline heavy" colspan="${colSpanItemType + 4}">
+				<kul:htmlControlAttribute attributeEntry="${itemAttributes.itemTypeCode}" property="document.item[${ctr}].itemType.itemTypeDescription" readOnly="true" />
 			</td>
 			<td class="infoline right" colspan="${colSpanExtendedPrice}">
 				<kul:htmlControlAttribute attributeEntry="${itemAttributes.itemUnitPrice}" property="document.item[${ctr}].itemUnitPrice" readOnly="true" styleClass="amount" />
 			</td>
 			<c:if test="${colSpanBlank > 0}">
-			<td colspan="${colSpanBlank}" class="infoline">
-				&nbsp;
-			</td>
+		        <td colspan="${colSpanBlank - 2}" class="infoline">
+				    &nbsp;
+			    </td>
 			</c:if>
+		    <td class="infoline">
+                <div class="actions">
+                    <c:set var="toggleTabIndex" value="${KualiForm.currentTabIndex}"/>
+                    <purap:accountingLinesToggle currentTabIndex="${toggleTabIndex}" accountPrefix="document.item[${ctr}]."/>
+                </div>
+            </td>
 		</tr>
-		<c:if test="${empty KualiForm.editingMode['allowItemEntry'] || !empty itemLine.itemExtendedPrice}">
+		<c:if test="${empty KualiForm.editingMode['allowItemEntry'] || !empty itemLine.itemUnitPrice}">
 		    <purap:purapGeneralAccounting
 			    accountPrefix="document.item[${ctr}]."
-			    itemColSpan="${mainColumnCount}" />
+			    itemColSpan="${mainColumnCount}"
+			    currentTabIndex="${toggleTabIndex}"
+			    showToggle="false" />
 		</c:if>
 	</c:if>
 </logic:iterate>
 
-<c:if test="${isOpen != 'true' && isOpen != 'TRUE'}">
-	</tbody>
-</c:if>
+        <tr class="line"><td></td></tr>
 
+        <c:if test="${isOpen != 'true' && isOpen != 'TRUE'}">
+            </tbody>
+        </c:if>
+    </table>
+</div>
\ No newline at end of file
```
---
*File #48*

**pom.xml**

```diff
diff --git a/pom.xml b/pom.xml
index 2e123682f4..dc90ae5d82 100644
--- a/pom.xml
+++ b/pom.xml
@@ -37,7 +37,7 @@
     </modules>
     <groupId>org.kuali.kfs</groupId>
     <artifactId>kfs</artifactId>
-    <version>2017-10-19</version>
+    <version>2017-11-02</version>
     <name>Kuali Financial System</name>
     <description>a comprehensive financial management system for higher education.</description>
     <inceptionYear>2005</inceptionYear>
```
