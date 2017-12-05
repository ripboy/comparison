# Release Report
Changes made between releases 2017-11-02 and 2017-11-30
## Database File Changes
*File #1*

**kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/2017-11-30.xml**

```diff
diff --git a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/2017-11-30.xml b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/2017-11-30.xml
new file mode 100644
index 0000000000..024d66628e
--- /dev/null
+++ b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/db/phase5/2017-11-30.xml
@@ -0,0 +1,31 @@
+<?xml version="1.0"?>
+<!--
+
+    The Kuali Financial System, a comprehensive financial management system for higher education.
+
+    Copyright 2005-2017 Kuali, Inc.
+
+    This program is free software: you can redistribute it and/or modify
+    it under the terms of the GNU Affero General Public License as published by
+    the Free Software Foundation, either version 3 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU Affero General Public License for more details.
+
+    You should have received a copy of the GNU Affero General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+-->
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/kfs/module/cam/db/phase5/post-rel-2017-11-02.xml">
+
+    <changeSet id="FINP-2418" author="KFS701" context="demo,unit">
+        <update tableName="CM_AST_PAYMENT_T">
+            <column name="FDOC_POST_PRD_CD" valueComputed="CONCAT(0, FDOC_POST_PRD_CD)"/>
+            <where>FDOC_POST_PRD_CD in ('1','2','3','4','5','6','7','8','9')</where>
+        </update>
+    </changeSet>
+
+</databaseChangeLog>
```


---
*File #2*

**kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/2017-11-30.xml**

```diff
diff --git a/kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/2017-11-30.xml b/kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/2017-11-30.xml
new file mode 100644
index 0000000000..437f6a3706
--- /dev/null
+++ b/kfs-core/src/main/resources/org/kuali/kfs/core/db/phase5/2017-11-30.xml
@@ -0,0 +1,31 @@
+<?xml version="1.0"?>
+<!--
+
+    The Kuali Financial System, a comprehensive financial management system for higher education.
+
+    Copyright 2005-2017 Kuali, Inc.
+
+    This program is free software: you can redistribute it and/or modify
+    it under the terms of the GNU Affero General Public License as published by
+    the Free Software Foundation, either version 3 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU Affero General Public License for more details.
+
+    You should have received a copy of the GNU Affero General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+-->
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.4.xsd" logicalFilePath="org/kuali/kfs/core/db/phase5/post-rel-2017-11-02.xml">
+
+    <changeSet author="KFS701" id="FINP-1782_KFS_CONFIG_VIEWER_NAVIGATION" context="bootstrap,demo,unit">
+        <update tableName="NAV_LNK_T">
+            <column name="LNK_VAL">ConfigViewer.do</column>
+            <where>LNK_LBL='Financials Configuration Viewer'</where>
+        </update>
+    </changeSet>
+
+</databaseChangeLog>
```


---
*File #3*

**kfs-core/src/main/resources/org/kuali/rice/db/phase5/2017-11-30.xml**

```diff
diff --git a/kfs-core/src/main/resources/org/kuali/rice/db/phase5/2017-11-30.xml b/kfs-core/src/main/resources/org/kuali/rice/db/phase5/2017-11-30.xml
new file mode 100644
index 0000000000..3683f5224b
--- /dev/null
+++ b/kfs-core/src/main/resources/org/kuali/rice/db/phase5/2017-11-30.xml
@@ -0,0 +1,129 @@
+<?xml version="1.0"?>
+<!--
+
+    The Kuali Financial System, a comprehensive financial management system for higher education.
+
+    Copyright 2005-2017 Kuali, Inc.
+
+    This program is free software: you can redistribute it and/or modify
+    it under the terms of the GNU Affero General Public License as published by
+    the Free Software Foundation, either version 3 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU Affero General Public License for more details.
+
+    You should have received a copy of the GNU Affero General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+-->
+<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd" logicalFilePath="org/kuali/rice/db/phase5/post-rel-2017-11-02.xml">
+
+    <changeSet author="KFS701" id="FINP-2022_FIX_DOC_HANDLER_URLS_DUE" context="bootstrap,demo,unit">
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/arCashControl.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'CTRL'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/arCashControl.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'CTRL'</where>
+        </update>
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/arContractsGrantsCollectionActivity.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'CCA'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/arContractsGrantsCollectionActivity.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'CCA'</where>
+        </update>
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/arCustomerInvoiceWriteoff.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'INVW'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/arCustomerInvoiceWriteoff.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'INVW'</where>
+        </update>
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/arCustomerInvoice.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'INV'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/arCustomerInvoice.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'INV'</where>
+        </update>
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/arContractsGrantsLetterOfCreditReview.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'LCR'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/arContractsGrantsLetterOfCreditReview.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'LCR'</where>
+        </update>
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/arFinalBilledIndicator.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'FBI'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/arFinalBilledIndicator.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'FBI'</where>
+        </update>
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/arPaymentApplication.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'APP'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/arPaymentApplication.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'APP'</where>
+        </update>
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/arCustomerCreditMemo.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'CRM'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/arCustomerCreditMemo.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'CRM'</where>
+        </update>
+        <update tableName="KREW_DOC_TYP_T">
+            <column name="doc_hdlr_url">${kfs.url}/generalLedgerGeneralLedgerCorrectionProcess.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'GLCP'</where>
+        </update>
+        <update tableName="krew_actn_itm_t">
+            <column name="doc_hdlr_url">${kfs.url}/generalLedgerGeneralLedgerCorrectionProcess.do?methodToCall=docHandler</column>
+            <where>doc_hdlr_url like '%kfs.url%Document.do%' and doc_typ_nm = 'GLCP'</where>
+        </update>
+    </changeSet>
+
+    <changeSet author="KFS701" id="FINP-1782_KFS_CONFIG_VIEWER_PERMISSIONS" context="bootstrap,demo,unit">
+        <insert tableName="krim_perm_t">
+            <column name="PERM_ID" value="FINP1782"/>
+            <column name="OBJ_ID" value="FINP1782"/>
+            <column name="VER_NBR" valueNumeric="1"/>
+            <column name="PERM_TMPL_ID" value="29"/>
+            <column name="NMSPC_CD" value="KFS-SYS"/>
+            <column name="NM" value="Use Configuration Viewer Screen"/>
+            <column name="DESC_TXT" value="Allows users to access the Configuration Viewer screen"/>
+            <column name="ACTV_IND" value="Y"/>
+        </insert>
+        <insert tableName="krim_perm_attr_data_t">
+            <column name="ATTR_DATA_ID" value="FINP1782"/>
+            <column name="OBJ_ID" value="FINP1782"/>
+            <column name="VER_NBR" valueNumeric="1"/>
+            <column name="PERM_ID" value="FINP1782"/>
+            <column name="KIM_TYP_ID" value="12"/>
+            <column name="KIM_ATTR_DEFN_ID" value="2"/>
+            <column name="ATTR_VAL" value="org.kuali.kfs.sys.web.struts.ConfigViewerAction"/>
+        </insert>
+        <insert tableName="krim_role_perm_t">
+            <column name="ROLE_PERM_ID" value="FINP1782"/>
+            <column name="OBJ_ID" value="FINP1782"/>
+            <column name="VER_NBR" valueNumeric="1"/>
+            <column name="ROLE_ID" valueComputed="(select ROLE_ID from krim_role_t where NMSPC_CD='KFS-SYS' and ROLE_NM='Technical Administrator')"/>
+            <column name="PERM_ID" value="FINP1782"/>
+            <column name="ACTV_IND" value="Y"/>
+        </insert>
+    </changeSet>
+
+</databaseChangeLog>
```


---
## **Duplicate Files Changes**
*File #4*

**kfs-core/src/main/java/org/kuali/kfs/sys/businessobject/lookup/ElectronicPaymentClaimLookupableHelperServiceImpl.java**

```diff
diff --git a/kfs-core/src/main/java/org/kuali/kfs/sys/businessobject/lookup/ElectronicPaymentClaimLookupableHelperServiceImpl.java b/kfs-core/src/main/java/org/kuali/kfs/sys/businessobject/lookup/ElectronicPaymentClaimLookupableHelperServiceImpl.java
index 7dc57db435..d6e3f691d0 100644
--- a/kfs-core/src/main/java/org/kuali/kfs/sys/businessobject/lookup/ElectronicPaymentClaimLookupableHelperServiceImpl.java
+++ b/kfs-core/src/main/java/org/kuali/kfs/sys/businessobject/lookup/ElectronicPaymentClaimLookupableHelperServiceImpl.java
@@ -188,7 +188,7 @@ public class ElectronicPaymentClaimLookupableHelperServiceImpl extends AbstractL
      */
     protected String getAmountCriteria(String fromAmount, String toAmount) {
         if (StringUtils.isNotBlank(fromAmount) && StringUtils.isNotBlank(toAmount)) {
-            return fromAmount + SearchOperator.BETWEEN.op() + toAmount;
+            return SearchOperator.GREATER_THAN_EQUAL.op() + fromAmount + SearchOperator.AND + SearchOperator.LESS_THAN_EQUAL.op() + toAmount;
         }
         if (StringUtils.isNotBlank(fromAmount) && StringUtils.isBlank(toAmount)) {
             return SearchOperator.GREATER_THAN_EQUAL.op() + fromAmount;
```
---
*File #5*

**kfs-core/src/main/java/org/kuali/kfs/sys/KFSConstants.java**

```diff
diff --git a/kfs-core/src/main/java/org/kuali/kfs/sys/KFSConstants.java b/kfs-core/src/main/java/org/kuali/kfs/sys/KFSConstants.java
index 9ae0897bb7..74c2f420eb 100644
--- a/kfs-core/src/main/java/org/kuali/kfs/sys/KFSConstants.java
+++ b/kfs-core/src/main/java/org/kuali/kfs/sys/KFSConstants.java
@@ -112,6 +112,7 @@ public class KFSConstants {
     public static final String BATCH_UPLOAD_HELP_SYS_PARAM_NAME = "BATCH_UPLOAD_HELP_URL";
     public static final String CONTRACTS_GRANTS_BILLING_ENABLED = "contracts.grants.billing.enabled";
     public static final String MODULE_EXTERNAL_KUALI_COEUS_ENABLED = "module.external.kuali.coeus.enabled";
+    public static final String PERIODIC_THREAD_DUMP_PURGE_DAYS = "periodic.thread.dump.purge.days";
 
     public static final String LOOKUP_RESULTS_LIMIT_URL_KEY = "RESULTS_LIMIT";
 
```
---
*File #6*

**kfs-cam/src/main/resources/org/kuali/kfs/module/cam/businessobject/datadictionary/Asset.xml**

```diff
diff --git a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/businessobject/datadictionary/Asset.xml b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/businessobject/datadictionary/Asset.xml
index 69e384ce5d..7defb809e7 100644
--- a/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/businessobject/datadictionary/Asset.xml
+++ b/kfs-cam/src/main/resources/org/kuali/kfs/module/cam/businessobject/datadictionary/Asset.xml
@@ -1637,7 +1637,7 @@
             <list>
                 <bean parent="InquirySectionDefinition">
                     <property name="defaultOpen" value="false"/>
-                    <property name="title" value="Asset Detail Information"/>
+                    <property name="title" value="Asset Detail"/>
                     <property name="inquiryFields">
                         <list>
                             <bean parent="FieldDefinition" p:attributeName="capitalAssetNumber"/>
```
---
*File #7*

**kfs-core/src/main/resources/org/kuali/kfs/sys/businessobject/datadictionary/ElectronicPaymentClaim.xml**

```diff
diff --git a/kfs-core/src/main/resources/org/kuali/kfs/sys/businessobject/datadictionary/ElectronicPaymentClaim.xml b/kfs-core/src/main/resources/org/kuali/kfs/sys/businessobject/datadictionary/ElectronicPaymentClaim.xml
index b61ecb7f02..6f1ee78c08 100644
--- a/kfs-core/src/main/resources/org/kuali/kfs/sys/businessobject/datadictionary/ElectronicPaymentClaim.xml
+++ b/kfs-core/src/main/resources/org/kuali/kfs/sys/businessobject/datadictionary/ElectronicPaymentClaim.xml
@@ -224,9 +224,9 @@
                 <bean parent="FieldDefinition" p:attributeName="generatingAccountingLine.organizationReferenceId"/>
                 <bean parent="FieldDefinition" p:defaultValue="U" p:attributeName="paymentClaimStatusCode"/>
                 <bean parent="FieldDefinition" p:attributeName="generatingAdvanceDepositDetail.financialDocumentAdvanceDepositDate"/>
-                <bean parent="FieldDefinition" p:attributeName="generatingAccountingLine.financialDocumentLineDescription"/>
                 <bean parent="FieldDefinition" p:attributeName="amountFrom"/>
                 <bean parent="FieldDefinition" p:attributeName="amountTo"/>
+                <bean parent="FieldDefinition" p:attributeName="generatingAccountingLine.financialDocumentLineDescription"/>
             </list>
         </property>
         <property name="resultFields">
```
---
*File #8*

**kfs-core/src/main/resources/org/kuali/kfs/sys/spring-sys.xml**

```diff
diff --git a/kfs-core/src/main/resources/org/kuali/kfs/sys/spring-sys.xml b/kfs-core/src/main/resources/org/kuali/kfs/sys/spring-sys.xml
index 9872ef27a4..9d92d64405 100644
--- a/kfs-core/src/main/resources/org/kuali/kfs/sys/spring-sys.xml
+++ b/kfs-core/src/main/resources/org/kuali/kfs/sys/spring-sys.xml
@@ -2678,5 +2678,11 @@
         </property>
     </bean>
 
+    <bean id="ojbConfigurationService" parent="ojbConfigurationService-parentBean"/>
+    <bean id="ojbConfigurationService-parentBean" abstract="true" class="org.kuali.kfs.sys.service.impl.OjbConfigurationServiceImpl">
+        <property name="dataDictionaryService" ref="dataDictionaryService"/>
+        <property name="persistenceStructureService" ref="persistenceStructureService"/>
+    </bean>
+
     <import resource="spring-sys-bus-exports.xml"/>
 </beans>
```
---
*File #9*

**kfs-web/src/main/webapp/jsp/gl/AccountBalanceByConsolidationLookup.jsp**

```diff
diff --git a/kfs-web/src/main/webapp/jsp/gl/AccountBalanceByConsolidationLookup.jsp b/kfs-web/src/main/webapp/jsp/gl/AccountBalanceByConsolidationLookup.jsp
index feab8addcd..3a7ef98baa 100644
--- a/kfs-web/src/main/webapp/jsp/gl/AccountBalanceByConsolidationLookup.jsp
+++ b/kfs-web/src/main/webapp/jsp/gl/AccountBalanceByConsolidationLookup.jsp
@@ -111,13 +111,19 @@
                                 </c:if>
 
                                 <display:column
-                                        class="${(column.formatter.implementationClass == 'org.kuali.rice.core.web.format.CurrencyFormatter') ? 'numbercell' : 'inofocell'}"
+                                        class="${(column.formatter.implementationClass == 'org.kuali.rice.core.web.format.CurrencyFormatter') ? 'numbercell' : 'infocell'}"
                                         title="${column.columnTitle}" comparator="${column.comparator}"
                                         sortable="${('dummyBusinessObject.linkButtonOption' ne column.propertyName) && column.sortable}">
                                     <c:choose>
-                                        <c:when test="${column.propertyURL != \"\" && param['d-16544-e'] == null}">
-                                            <a href="<c:out value="${column.propertyURL}"/>" title="<c:out value="${title}" />"
-                                               target="blank"><c:out value="${column.propertyValue}"/></a>
+                                        <c:when test="${not empty column.propertyURL && not empty column.propertyValue && param['d-16544-e'] == null}">
+                                            <a href="<c:out value="${column.propertyURL}&mode=modal"/>"
+                                               title="<c:out value="${title}" />"
+                                               data-label="${column.columnAnchor.objectLabel}"
+                                               data-remodal-target="modal">
+                                                <c:out value="${column.propertyValue}"/></a>
+                                            <a href="<c:out value="${column.propertyURL}&mode=standalone"/>"
+                                               title="Open in new tab" target="_blank" class="new-window">
+                                                <span class="glyphicon glyphicon-new-window"></span></a>
                                         </c:when>
                                         <c:otherwise>
                                             <c:out value="${column.propertyValue}"/>
```
---
## **Properties Files Changes**
## **Workflow File Changes**
