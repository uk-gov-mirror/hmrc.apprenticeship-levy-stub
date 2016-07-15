<?xml version="1.0" encoding="UTF-8"?>
<!--
Schematron
Generated by CoreFiling: generator revision 472318
Tue Jul 12 13:59:03 BST 2016
-->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="exslt">
  <sch:title>Schematron for NINOverificationRequest</sch:title>
  <sch:ns prefix="hd" uri="http://www.govtalk.gov.uk/CM/envelope"/>
  <sch:ns prefix="dsig" uri="http://www.w3.org/2000/09/xmldsig#"/>
  <sch:ns prefix="nvr" uri="http://www.govtalk.gov.uk/taxation/PAYE/RTI/NINOverificationRequest/1"/>
    <sch:pattern id="p66">
      <sch:rule context="/hd:GovTalkMessage/hd:Body/nvr:IRenvelope/nvr:IRheader/nvr:Keys/nvr:Key">
        <sch:assert test="count(../../../../../hd:GovTalkDetails/hd:Keys/hd:Key[@Type = current()/@Type and . = current()]) &gt; 0" id="a_r1004" diagnostics="errorCode.r1004 transactional.r1004 transactional.en.r1004 ">Keys in the IR header must also exist in the GovTalk header with the same value</sch:assert>
      </sch:rule>
    </sch:pattern>
    <sch:pattern id="p65">
      <sch:rule context="/hd:GovTalkMessage/hd:Body/nvr:IRenvelope/nvr:IRheader">
        <sch:assert test="count(nvr:Keys/nvr:Key) &gt; 0" id="a_r1005" diagnostics="errorCode.r1005 transactional.r1005 transactional.en.r1005 ">At least one key must exist in the IRheader</sch:assert>
      </sch:rule>
    </sch:pattern>
    <sch:pattern id="p68">
      <sch:rule context="/hd:GovTalkMessage/hd:Body/nvr:IRenvelope/nvr:NINOverificationRequest/nvr:EmpRefs/nvr:OfficeNo">
        <sch:assert test="../../../nvr:IRheader/nvr:Keys/nvr:Key[@Type = &apos;TaxOfficeNumber&apos;] = ." id="a_HMRCOFFICENUMBER.0" diagnostics="errorCode.HMRCOFFICENUMBER.0 transactional.HMRCOFFICENUMBER.0 transactional.en.HMRCOFFICENUMBER.0 ">The TaxOfficeNumber key within the IRheader must match [HMRCOFFICENUMBER]</sch:assert>
      </sch:rule>
    </sch:pattern>
    <sch:pattern id="p69">
      <sch:rule context="/hd:GovTalkMessage/hd:Body/nvr:IRenvelope/nvr:NINOverificationRequest/nvr:EmpRefs/nvr:PayeRef">
        <sch:assert test="../../../nvr:IRheader/nvr:Keys/nvr:Key[@Type = &apos;TaxOfficeReference&apos;] = ." id="a_EMPLOYERPAYEREF.0" diagnostics="errorCode.EMPLOYERPAYEREF.0 transactional.EMPLOYERPAYEREF.0 transactional.en.EMPLOYERPAYEREF.0 ">The TaxOfficeReference key within the IRheader must match [EMPLOYERPAYEREF]</sch:assert>
      </sch:rule>
    </sch:pattern>
    <sch:pattern id="p71">
      <sch:rule context="/hd:GovTalkMessage/hd:Body/nvr:IRenvelope/nvr:NINOverificationRequest/nvr:Employee/nvr:EmployeeDetails/nvr:Address/nvr:ForeignCountry">
        <sch:assert test="(count(../nvr:Line)) &gt;= 2" id="a_FOREIGNCOUNTRY.0" diagnostics="errorCode.FOREIGNCOUNTRY.0 transactional.FOREIGNCOUNTRY.0 transactional.en.FOREIGNCOUNTRY.0 ">If [FOREIGNCOUNTRY] is present, at least two [ADDRESSLINE] should be present</sch:assert>
      </sch:rule>
    </sch:pattern>
    <sch:pattern id="p72">
      <sch:rule context="/hd:GovTalkMessage/hd:Body/nvr:IRenvelope/nvr:NINOverificationRequest/nvr:Employee/nvr:EmployeeDetails/nvr:BirthDate">
        <sch:assert test="(round(date:seconds(normalize-space((.))) div 86400) &lt;= round(date:seconds(normalize-space(date:date())) div 86400))" id="a_BirthDateType.1" diagnostics="errorCode.BirthDateType.1 transactional.BirthDateType.1 transactional.en.BirthDateType.1 ">The Date of Birth must be today or earlier.</sch:assert>
        <sch:assert test="(round(date:seconds(normalize-space(date:add(normalize-space(date:date()),normalize-space(&quot;-P130Y&quot;)))) div 86400) &lt; round(date:seconds(normalize-space((.))) div 86400))" id="a_DATEOFBIRTH.0" diagnostics="errorCode.DATEOFBIRTH.0 transactional.DATEOFBIRTH.0 transactional.en.DATEOFBIRTH.0 ">Must be later than 130 years before today</sch:assert>
      </sch:rule>
    </sch:pattern>
    <sch:pattern id="p70">
      <sch:rule context="/hd:GovTalkMessage/hd:Body/nvr:IRenvelope/nvr:NINOverificationRequest/nvr:Employee/nvr:EmployeeDetails">
        <sch:assert test="nvr:NINO
            or
              count(nvr:Address/nvr:Line) &gt;= 2" id="a_EMPLOYEE.0" diagnostics="errorCode.EMPLOYEE.0 transactional.EMPLOYEE.0 transactional.en.EMPLOYEE.0 ">At least two [ADDRESSLINE] should be present if not ( [NINO] is present )</sch:assert>
        <sch:assert test="nvr:Name/nvr:Fore or nvr:Name/nvr:Initials" id="a_EMPLOYEE.1" diagnostics="errorCode.EMPLOYEE.1 transactional.EMPLOYEE.1 transactional.en.EMPLOYEE.1 ">At least one of [FORENAME] and [INITIALS] must be present</sch:assert>
      </sch:rule>
    </sch:pattern>
    <sch:pattern id="p67">
      <sch:rule context="/hd:GovTalkMessage/hd:Body/nvr:IRenvelope/nvr:NINOverificationRequest">
        <sch:assert test="../../../hd:Header/hd:MessageDetails/hd:Class = &apos;HMRC-PAYE-RTI-NVR&apos;
          or
          ../../../hd:Header/hd:MessageDetails/hd:Class = &apos;HMRC-PAYE-RTI-NVR-TIL&apos;" id="a_NVR.1" diagnostics="errorCode.NVR.1 transactional.NVR.1 transactional.en.NVR.1 ">Valid message classes for a NINO Verification Request are HMRC-PAYE-RTI-NVR and HMRC-PAYE-RTI-NVR-TIL.</sch:assert>
        <sch:assert test="(count(nvr:Employee)) &lt;= 100" id="a_NVR.0" diagnostics="errorCode.NVR.0 transactional.NVR.0 transactional.en.NVR.0 ">[EMPLOYEE] may repeat up to 100 times.</sch:assert>
      </sch:rule>
    </sch:pattern>
  <sch:diagnostics>
    <sch:diagnostic id="errorCode.r1005">5004</sch:diagnostic>
    <sch:diagnostic id="transactional.r1005">At least one key must exist in the IRheader</sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.r1005">At least one key must exist in the IRheader</sch:diagnostic>
    <sch:diagnostic id="errorCode.r1004">5005</sch:diagnostic>
    <sch:diagnostic id="transactional.r1004">Keys in the GovTalkDetails do not match those in the IRheader.</sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.r1004">Keys in the GovTalkDetails do not match those in the IRheader.</sch:diagnostic>
    <sch:diagnostic id="errorCode.NVR.1">7839</sch:diagnostic>
    <sch:diagnostic id="transactional.NVR.1">Valid message classes for a NINO Verification Request are HMRC-PAYE-RTI-NVR and HMRC-PAYE-RTI-NVR-TIL.</sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.NVR.1">Valid message classes for a NINO Verification Request are HMRC-PAYE-RTI-NVR and HMRC-PAYE-RTI-NVR-TIL.</sch:diagnostic>
    <sch:diagnostic id="errorCode.NVR.0">7827</sch:diagnostic>
    <sch:diagnostic id="transactional.NVR.0">You can only include between 1 and 100 [EMPLOYEE]s in each NINO Verification request.</sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.NVR.0">You can only include between 1 and 100 [EMPLOYEE]s in each NINO Verification request.</sch:diagnostic>
    <sch:diagnostic id="errorCode.HMRCOFFICENUMBER.0">7821</sch:diagnostic>
    <sch:diagnostic id="transactional.HMRCOFFICENUMBER.0">The TaxOfficeNumber key within the IRheader must match [HMRCOFFICENUMBER]</sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.HMRCOFFICENUMBER.0">The TaxOfficeNumber key within the IRheader must match [HMRCOFFICENUMBER]</sch:diagnostic>
    <sch:diagnostic id="errorCode.EMPLOYERPAYEREF.0">7822</sch:diagnostic>
    <sch:diagnostic id="transactional.EMPLOYERPAYEREF.0">The TaxOfficeReference key within the IRheader must match [EMPLOYERPAYEREF]</sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.EMPLOYERPAYEREF.0">The TaxOfficeReference key within the IRheader must match [EMPLOYERPAYEREF]</sch:diagnostic>
    <sch:diagnostic id="errorCode.EMPLOYEE.0">7823</sch:diagnostic>
    <sch:diagnostic id="transactional.EMPLOYEE.0">There is no entry in [NINO]. Please complete at least two [ADDRESSLINE] </sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.EMPLOYEE.0">There is no entry in [NINO]. Please complete at least two [ADDRESSLINE] </sch:diagnostic>
    <sch:diagnostic id="errorCode.EMPLOYEE.1">7824</sch:diagnostic>
    <sch:diagnostic id="transactional.EMPLOYEE.1">There must be an entry in either [FORENAME] or [INITIALS]</sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.EMPLOYEE.1">There must be an entry in either [FORENAME] or [INITIALS]</sch:diagnostic>
    <sch:diagnostic id="errorCode.FOREIGNCOUNTRY.0">7825</sch:diagnostic>
    <sch:diagnostic id="transactional.FOREIGNCOUNTRY.0">There is an entry in [FOREIGNCOUNTRY]. Please complete at least two [ADDRESSLINE] </sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.FOREIGNCOUNTRY.0">There is an entry in [FOREIGNCOUNTRY]. Please complete at least two [ADDRESSLINE] </sch:diagnostic>
    <sch:diagnostic id="errorCode.BirthDateType.1">5001</sch:diagnostic>
    <sch:diagnostic id="transactional.BirthDateType.1">The Date must be today or earlier. Please check</sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.BirthDateType.1">The Date must be today or earlier. Please check</sch:diagnostic>
    <sch:diagnostic id="errorCode.DATEOFBIRTH.0">7826</sch:diagnostic>
    <sch:diagnostic id="transactional.DATEOFBIRTH.0">[DATEOFBIRTH] must be later than 130 years before today's date. Please check </sch:diagnostic>
    <sch:diagnostic xml:lang="en" id="transactional.en.DATEOFBIRTH.0">[DATEOFBIRTH] must be later than 130 years before today's date. Please check </sch:diagnostic>
  </sch:diagnostics>
</sch:schema>
