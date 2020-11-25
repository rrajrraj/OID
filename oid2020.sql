
REM
REM  Transforms LDAP data into a 'comma-separated' spreadsheet
REM   Can be used to create LOAD data
set echo off newp 0 spa 0 pages 0 feedback off head off tab off ver off lines 250 trimspool on
spool oid.csv
select 'uid,lastname,firstname,middlename,email,idcardcn,edipi,orgid,attributes' FROM DUAL;
SELECT
rtrim(
rtrim(ltrim(upper(substr(G.rdn,4,50)))) ||','||
rtrim(ltrim(A.attrval)) ||','||
rtrim(ltrim(B.attrval)) ||','||
rtrim(ltrim(C.attrval)) ||','||
rtrim(ltrim(D.attrval)) ||','||
rtrim(ltrim(F.attrval)) ||','||
rtrim(ltrim(H.attrval)) ||','||
rtrim(ltrim(nvl(J.attrval,'abcd'))) ||','||
rtrim(ltrim(K.attrval)) || ','||
rtrim(ltrim(M.attrval)) || ','||
rtrim(ltrim(N.attrval)) || ','||
rtrim(ltrim(O.attrval)) || ','||
L.usr_udf_attr1 || ','||
L.usr_udf_attr2 || ',' ||
L.usr_udf_attr3 || ',' ||
L.usr_udf_attr4|| ',' ||
L.usr_udf_attr5||' '
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
and G.parentdn='dc=com,dc=mycompany,cn=users,'
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
and F.attrname(+)='attr1'
and H.attrname(+)='attr2'
and K.attrname(+)='attr3'
and M.attrname(+)='attr4'
and N.attrname(+)='attr5'
and O.attrname(+)='attr6'
and J.attrname(+)='attr7'
and L.usr_login(+)=upper(substr(G.rdn,4,50))
 order by 1
/

