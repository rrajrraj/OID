
set echo off newp 0 spa 0 pages 0 feedback off head off tab off ver off lines 250 trimspool on
spool oid.csv
select 'uid,lastname,firstname,middlename,email,idcardcn,edipi,orgid,orgaff,authid,sigid,personaemail,rank,sponsorfn,sponsorln,sponsorphone,sponsoremail' FROM DUAL;
SELECT
rtrim(
rtrim(ltrim(upper(substr(G.rdn,4,50)))) ||','||
rtrim(ltrim(A.attrval)) ||','||
rtrim(ltrim(B.attrval)) ||','||
rtrim(ltrim(C.attrval)) ||','||
rtrim(ltrim(D.attrval)) ||','||
rtrim(ltrim(F.attrval)) ||','||
rtrim(ltrim(H.attrval)) ||','||
rtrim(ltrim(nvl(J.attrval,'1727'))) ||','||
rtrim(ltrim(K.attrval)) || ','||
rtrim(ltrim(M.attrval)) || ','||
rtrim(ltrim(N.attrval)) || ','||
rtrim(ltrim(O.attrval)) || ','||
L.usr_udf_xxmcrank || ','||
L.usr_udf_xxmcsponsorfirstname || ',' ||
L.usr_udf_xxmcsponsorlastname || ',' ||
L.usr_udf_xxmcsponsorphoneno || ',' ||
L.usr_udf_xxmcsponsoremail||' '
) ONELINE
from ods.ds_attrstore A,
ods.ds_attrstore B,
ods.ds_attrstore C,
ods.ds_attrstore D,
ods.ds_attrstore F,
ods.ds_attrstore H,
ods.ds_attrstore J,
ods.ds_attrstore K,
ods.ds_attrstore M,
ods.ds_attrstore N,
ods.ds_attrstore O,
 ods.ct_dn G,
gcss2_oim.usr L
where
A.entryid(+)=G.entryid
and B.entryid(+)=G.entryid
and C.entryid(+)=G.entryid
and D.entryid(+)=G.entryid
and F.entryid(+)=G.entryid
and H.entryid(+)=G.entryid
and J.entryid(+)=G.entryid
and K.entryid(+)=G.entryid
and M.entryid(+)=G.entryid
and N.entryid(+)=G.entryid
and O.entryid(+)=G.entryid
and G.parentdn='dc=mil,dc=gcssmc,cn=users,'
and A.attrkind(+)='u'
and B.attrkind(+)='u'
and C.attrkind(+)='u'
and D.attrkind(+)='u'
and F.attrkind(+)='u'
and H.attrkind(+)='u'
and J.attrkind(+)='u'
and K.attrkind(+)='u'
and M.attrkind(+)='u'
and N.attrkind(+)='u'
and O.attrkind(+)='u'
and A.attrname(+)='sn'
and B.attrname(+)='givenname'
and C.attrname(+)='middlename'
and D.attrname(+)='mail'
and F.attrname(+)='xxmcidcardcn'
and H.attrname(+)='xxmcdodedipersonid'
and K.attrname(+)='xxmcpersoncategorycode'
and M.attrname(+)='xxmcauthid'
and N.attrname(+)='xxmcsigid'
and O.attrname(+)='xxmcpersonaemail'
and J.attrname(+)='xxmcbranchofservicecode'
and L.usr_login(+)=upper(substr(G.rdn,4,50))
 order by 1
/

